abstract class BaseService {
  Future<dynamic> getResource({
    required Uri query,
  });

  Future<dynamic> postResource(
      {required Uri query, required Map<String, dynamic> body});

  Future<dynamic> putResource(
      {required Uri query, required Map<String, dynamic> body});

  Future<dynamic> patchResource(
      {required Uri query, required Map<String, dynamic> body});

  Future<dynamic> deleteResource({
    required Uri query,
  });
}
