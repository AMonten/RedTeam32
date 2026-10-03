// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'CERISE';

  @override
  String get welcome => 'Bienvenido';

  @override
  String get connect => 'Conectar';

  @override
  String get disconnect => 'Desconectar';

  @override
  String get connectionStatus => 'Estado de la conexión';

  @override
  String get connected => 'Conectado';

  @override
  String get disconnected => 'Desconectado';

  @override
  String get chat => 'Chat';

  @override
  String get typeMessage => 'Escribe un mensaje...';

  @override
  String get send => 'Enviar';

  @override
  String get statusDisconnected => 'DESCONECTADO';

  @override
  String get geminiApiKeyTitle => 'Clave API de Gemini';

  @override
  String get enterKeyHint => 'Introduce tu clave aquí';

  @override
  String get confirm => 'Confirmar';

  @override
  String get apiKeyNeededStatus => 'SE NECESITA CLAVE API';

  @override
  String get scanning => 'ESCANEANDO...';

  @override
  String get noDevices => 'SIN DISPOSITIVOS';

  @override
  String get devicesFound => 'DISPOSITIVOS ENCONTRADOS';

  @override
  String get connecting => 'CONECTANDO...';

  @override
  String get connectionFailed => 'CONEXIÓN FALLIDA';

  @override
  String get connectionEstablished => 'CONEXIÓN ESTABLECIDA';

  @override
  String get systemStatus => 'ESTADO DEL SISTEMA';

  @override
  String get unknownDevice => 'DISPOSITIVO DESCONOCIDO';

  @override
  String get unknownManufacturer => 'FABRICANTE DESCONOCIDO';

  @override
  String get configureApiKey => 'Configurar clave API';

  @override
  String get aiAssistant => 'Asistente IA';

  @override
  String get availableDevices => 'DISPOSITIVOS DISPONIBLES';

  @override
  String get apiKeyNeededMessage =>
      'Se requiere la clave API de Gemini.\nReinicia la app para introducirla.';

  @override
  String get noDevicesFoundTitle => 'NO SE ENCONTRARON DISPOSITIVOS';

  @override
  String get connectDevicePrompt =>
      'Conecta un dispositivo USB y pulsa el botón de escanear';

  @override
  String get processing => 'Procesando...';

  @override
  String get noEspContext => 'No hay contexto de ESP32 disponible';

  @override
  String recentContext(Object context, Object question) {
    return 'Contexto reciente del chat con el ESP32:\n$context\n\nPregunta del usuario: $question';
  }

  @override
  String userQuestion(Object question) {
    return 'Pregunta del usuario: $question';
  }

  @override
  String get normalResponse => 'Respuesta normal';

  @override
  String get shortResponse => 'Respuesta corta';

  @override
  String get commandOnly => 'Solo comando';

  @override
  String connectionError(Object error) {
    return 'ERROR DE CONEXIÓN: $error';
  }

  @override
  String get mockResponse => 'Respuesta simulada del ESP32.';

  @override
  String sendFailure(Object error) {
    return 'FALLO AL ENVIAR: $error';
  }

  @override
  String get typeCommand => 'Escribe un comando...';

  @override
  String get aiDisabled => 'Asistente IA desactivado (sin clave API)';

  @override
  String get openAiAssistant => 'Abrir asistente IA';

  @override
  String get aboutApp => 'Acerca de la app';

  @override
  String errorPrefix(Object error) {
    return 'ERROR: $error';
  }

  @override
  String get aiSystemPrompt =>
      'Eres un asistente inteligente especializado en pentesting usando el firmware ESP32 Marauder. Tu objetivo es ayudar al usuario a operar el Marauder sugiriendo los comandos adecuados y explicando sus funciones, teniendo siempre en cuenta el contexto del pentest que se está realizando en el momento.\n\nIMPORTANTE: Mantén tus respuestas CONCISAS y DIRECTAS. Máximo de 3-4 frases por respuesta, centrándote en lo esencial.';

  @override
  String geminiApiError(Object message) {
    return 'Error de la API de Gemini: $message';
  }

  @override
  String get connectionErrorCheckInternet =>
      'Error de conexión: comprueba tu conexión a internet e inténtalo de nuevo.';

  @override
  String get geminiApiKeyInvalid =>
      'Error: clave API de Gemini inválida o expirada.';

  @override
  String unexpectedError(Object message) {
    return 'Error inesperado: $message';
  }
}
