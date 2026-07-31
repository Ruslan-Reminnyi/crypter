abstract interface class NotificationsRepository {
  Future<void> initialize();
  Future<bool> isPermissionGranted();
  Future<bool> requestPermission();
  Future<void> showNotification({String? title, String? body, String? payload});
}
