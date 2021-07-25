import 'package:localstore/localstore.dart';

class LocalStoreRepository {
  final _db = Localstore.instance;

  Future<Map<String, dynamic>?> getAllAsync(String collection) {
    return _db.collection(collection).get();
  }

  Future<Map<String, dynamic>?> getAsync(String collection, String id) {
    return _db.collection(collection).doc(id).get();
  }

  Future<dynamic> createAsync(String collection, Map<String, dynamic> data) {
    final id = _db.collection(collection).doc().id;
    return createWithIdAsync(collection, data, id);
  }

  Future<dynamic> createWithIdAsync(
      String collection, Map<String, dynamic> data, String id) {
    return _db.collection(collection).doc(id).set(data);
  }

  Future<dynamic> deleteAsync(String collection, String id) {
    return _db.collection(collection).doc(id).delete();
  }
}
