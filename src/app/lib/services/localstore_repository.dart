import 'package:localstore/localstore.dart';

// TODO: create dynamic! data as generic-type and automatic conversion to Map<string, dynamic>
// TODO: get generic! automatic conversion from Map<string, dynamic> to generic-type

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
