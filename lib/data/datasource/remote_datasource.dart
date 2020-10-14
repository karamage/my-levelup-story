abstract class RemoteDatasource {
  initializeApp();
  Future<Map<String, dynamic>> signInAnonymously();
  Future<Map<String, dynamic>> getUser(String userId);
  Future<Map<String, dynamic>> addUser(Map<String, dynamic> params);
  Future<Map<String, dynamic>> updateUser(Map<String, dynamic> params);
  Future<Map<String, dynamic>> addItem(Map<String, dynamic> params);
  Future<void> updateItem(Map<String, dynamic> params);
  Future<Map<String, dynamic>> getItem(String itemId);
  Future<List<Map<String, dynamic>>> getItems(String userId, DateTime lastDate);
  Future<List<Map<String, dynamic>>> getOurItems(DateTime lastDate);
  Future<List<Map<String, dynamic>>> getProfileItems(String userId, DateTime lastDate);
  Future<List<Map<String, dynamic>>> getNotifications(String userId, DateTime lastDate);
  Future<Map<String, dynamic>> addNotification(Map<String, dynamic> params);
}