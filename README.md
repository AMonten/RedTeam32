# RedTeam32
Chat serial para pentest móvil mediante un microcontrolador externo (ej.: ESP32) con ayuda de IA (API Gemini).

RedTeam32 es una aplicación desarrollada en Flutter que permite la comunicación directa entre el dispositivo
móvil y un microcontrolador conectado por cable OTG. La aplicación muestra un chat serial, permitiendo que
el usuario envíe y reciba comandos del microcontrolador. Además, la app ofrece una ventana flotante
opcional de asistencia basada en la API Gemini, que permite al usuario obtener ayuda en la interpretación y
creación de comandos.

RedTeam32 no recopila, almacena, comparte ni transmite ningún dato personal del usuario.
Toda la información que circula por la aplicación permanece exclusivamente en el dispositivo, salvo aquello
que el propio usuario decide enviar manualmente al microcontrolador o a la API Gemini.

> **Uso responsable:** las funcionalidades de pentest (deauth, beacon spam, captura de handshakes, etc.)
> deben utilizarse **únicamente en entornos autorizados** y con fines legítimos de auditoría e investigación
> en seguridad. El uso no autorizado contra redes de terceros es ilegal.

## Requisitos
- Android con soporte USB OTG.
- Un ESP32 con el firmware [Marauder](https://github.com/justcallmekoko/ESP32Marauder).
- Cable USB OTG.
- (Opcional) Una clave de API de Gemini para el asistente de IA: https://aistudio.google.com/apikey

## Para depurar
```
flutter run -t app/lib/main.dart
```

## Para compilar el APK
```
cd app
flutter build apk --release
```
El APK queda en `app/build/app/outputs/flutter-apk/app-release.apk`.

<img width="120" height="120" alt="RedTeam32" src="https://github.com/user-attachments/assets/7d774955-7b5e-45d7-97af-f73be68cc327" />
