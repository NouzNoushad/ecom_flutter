abstract class ApiConsumer {
  Future<String> getResponse(String url, [Map<String, String>? baseHeader]);
  Future<String> postResponse(String url, Object? body);
  Future<String> deleteResponse(String url, [Object? body]);
  Future<String> updateResponse(String url, Object? body);
}
