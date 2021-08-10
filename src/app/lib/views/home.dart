import 'package:plent/models/configuration/configuration.dart';
import 'package:plent/services/configuration_repository.dart';
import 'package:plent/views/loading_indicator.dart';
import 'package:plent/views/login_decision.dart';
import 'package:plent/views/overview.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _repository = ConfigurationRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Configuration>(
      future: _getConfiguration(),
      builder: (context, AsyncSnapshot<Configuration> snapshot) {
        if (!snapshot.hasData) {
          return _buildLoadingIndicator(context);
        }

        var configuration = snapshot.data;
        var workingMode = configuration?.workingMode;
        var firstStartUp = workingMode == null;

        return firstStartUp
            ? _buildLoginDecision(context)
            : _buildOverview(context);
      },
    );
  }

  Widget _buildLoadingIndicator(BuildContext context) {
    return Scaffold(
        body: LoadingIndicator(
            text: AppLocalizations.of(context).generalLoading));
  }

  Widget _buildLoginDecision(BuildContext context) {
    return Scaffold(body: LoginDecision());
  }

  Widget _buildOverview(BuildContext context) {
    return Scaffold(body: Overview());
  }

  Future<Configuration> _getConfiguration() async {
    var configuration = await _repository.get();

    if (configuration == null)
      configuration = Configuration();
    return configuration;
  }
}
