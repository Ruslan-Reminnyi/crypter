class AppConfig {
  final int databaseVersion;

  AppConfig({required this.databaseVersion});

  factory AppConfig.fromEnvironment() {
    return AppConfig(databaseVersion: 1);
  }
}
