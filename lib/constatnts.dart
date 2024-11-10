/// Environment variables and shared app constants.
abstract class Constants {
  static const String apiKey = String.fromEnvironment(
    'API_KEY',
    defaultValue: '',
  );

  static const String appId = String.fromEnvironment(
    'APP_ID',
    defaultValue: '',
  );

  static const String messageSenderId = String.fromEnvironment(
    'MSG_SENDER_ID',
    defaultValue: '',
  );

  static const String projectId = String.fromEnvironment(
    'PROJECT_ID',
    defaultValue: '',
  );
}