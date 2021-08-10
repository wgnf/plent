import 'package:plent/models/configuration/configuration.dart';
import 'package:plent/services/localstore_repository.dart';

class ConfigurationRepository {
  final _localStoreRepository = LocalStoreRepository();

  final String _configurationCollection = 'configuration';
  final String _configurationId = '_';

  Future<Configuration?> get() async {
    var configurationJson = await _localStoreRepository.getAsync(
        _configurationCollection, _configurationId);
    if (configurationJson == null) return null;

    var configuration = Configuration.fromJson(configurationJson);
    return configuration;
  }

  Future set(Configuration configuration) async {
    var configurationJson = configuration.toJson();

    await _localStoreRepository.createWithIdAsync(
        _configurationCollection, configurationJson, _configurationId);
  }
}
