import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:app/l10n/app_localizations.dart';

class GeminiService {
  final GenerativeModel _model;
  late ChatSession _chat;
  final String initialPrompt = """
Eres un asistente inteligente especializado en pentesting usando el firmware Marauder del ESP32. Tu objetivo es ayudar al usuario a operar el Marauder, sugiriendo los comandos apropiados y explicando sus funciones, teniendo siempre en cuenta el contexto del pentest que se está realizando en el momento. Responde siempre en español.

IMPORTANTE: Mantén tus respuestas CONCISAS y DIRECTAS. Máximo de 3-4 frases por respuesta, centrándote en lo esencial.
""";

  GeminiService({required String apiKey})
    : _model = GenerativeModel(
        model: 'gemini-2.5-flash',
        apiKey: apiKey,
        generationConfig: GenerationConfig(
          temperature: 0.7,
          topK: 40,
          topP: 0.95,
        ),
      ) {
    _initializeChat();
  }

  void _initializeChat() {
    _chat = _model.startChat(history: [Content.text(initialPrompt)]);
  }

  Future<bool> testConnection() async {
    try {
      print("Probando conexión con Gemini...");
      print("Modelo: gemini-2.5-flash");

      final response = await _model.generateContent([Content.text("Prueba")]);

      print("Respuesta recibida: ${response.text?.isNotEmpty ?? false}");
      return response.text != null && response.text!.isNotEmpty;
    } on GenerativeAIException catch (e) {
      print("Error de la API Gemini: ${e.message}");
      return false;
    } catch (e) {
      print("Error de conexión: $e");
      return false;
    }
  }

  Future<String> processUserMessage(
    String userMessage,
    String deviceResponse,
    AppLocalizations l10n,
  ) async {
    try {
      if (deviceResponse.isNotEmpty) {
        await _chat.sendMessage(
          Content.text("Respuesta del ESP32: $deviceResponse"),
        );
      }

      final enhancedUserMessage =
          "$userMessage\n\n[Responde de forma CONCISA en un máximo de 3 frases]";

      final response = await _chat.sendMessage(
        Content.text(enhancedUserMessage),
      );

      final responseText =
          response.text ?? "Lo siento, no pude procesar tu solicitud.";

      return _limitResponseLength(responseText, maxChars: 500);
    } on GenerativeAIException catch (e) {
      return l10n.geminiApiError(e.message);
    } catch (e) {
      if (e.toString().contains('Failed host lookup')) {
        return l10n.connectionErrorCheckInternet;
      } else if (e.toString().contains('API key')) {
        return l10n.geminiApiKeyInvalid;
      } else {
        return l10n.unexpectedError(e.toString());
      }
    }
  }

  String _limitResponseLength(String text, {int maxChars = 500}) {
    if (text.length <= maxChars) return text;

    String truncated = text.substring(0, maxChars);
    int lastPeriod = truncated.lastIndexOf('.');
    int lastExclamation = truncated.lastIndexOf('!');
    int lastQuestion = truncated.lastIndexOf('?');

    int lastSentenceEnd = [
      lastPeriod,
      lastExclamation,
      lastQuestion,
    ].reduce((a, b) => a > b ? a : b);

    if (lastSentenceEnd > maxChars * 0.7) {
      return truncated.substring(0, lastSentenceEnd + 1);
    }

    return truncated.trim() + "...";
  }

  Future<String> getCommandForESP32(String assistantResponse) async {
    try {
      final response = await _chat.sendMessage(
        Content.text(
          "Por favor, genera solo el comando que debe enviarse al ESP32 basándote en tu última respuesta. "
          "Proporciona únicamente el comando, sin explicaciones adicionales.",
        ),
      );

      final command = response.text?.trim() ?? "";
      return command.endsWith('\\r\\n') ? command : command + '\\r\\n';
    } on GenerativeAIException catch (e) {
      print("Error de la API Gemini al generar comando: ${e.message}");
      return "";
    } catch (e) {
      print("Error al generar comando para ESP32: $e");
      return "";
    }
  }

  void resetChat() {
    _initializeChat();
  }

  void updateMaxTokens(int maxTokens) {
    print("Configurando límite máximo de tokens en: $maxTokens");
  }

  Future<String> getShortResponse(
    String userMessage, {
    required AppLocalizations l10n,
    int maxChars = 200,
  }) async {
    try {
      final shortPrompt =
          "$userMessage\n\n[RESPUESTA EN UN MÁXIMO DE 2 FRASES CORTAS]";
      final response = await _chat.sendMessage(Content.text(shortPrompt));
      final responseText = response.text ?? "Error al procesar.";
      return _limitResponseLength(responseText, maxChars: maxChars);
    } catch (e) {
      return l10n.unexpectedError(e.toString());
    }
  }

  Future<String> getCommandOnly(String userMessage) async {
    try {
      final commandPrompt =
          "$userMessage\n\n[RESPONDE ÚNICAMENTE CON EL COMANDO, SIN EXPLICACIONES]";
      final response = await _chat.sendMessage(Content.text(commandPrompt));
      final responseText = response.text?.trim() ?? "";

      return _limitResponseLength(responseText, maxChars: 100);
    } catch (e) {
      return "";
    }
  }
}
