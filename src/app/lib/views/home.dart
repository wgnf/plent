import 'package:app/services/localstore_repository.dart';
import 'package:app/views/loading_indicator.dart';
import 'package:app/views/login_decision.dart';
import 'package:app/views/overview.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _repository = LocalStoreRepository();
  Future<bool>? _getFirstStartUpFuture;
  bool _isFirstStartUp = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getFirstStartUpFuture,
      builder: (context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          _getFirstStartUpFuture = _getIsFirstStartUp();

          return _buildLoadingIndicator(context);
        }

        if (_isFirstStartUp) return _buildLoginDecision(context);

        return _buildOverview(context);
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

  Future<bool> _getIsFirstStartUp() async {
    // TODO: move to 'configuration' collection
    // TODO: determine first startup by checking login-mode == null
    var firstStartUpObj = await _repository.getAsync('state', 'first_startup');

    _isFirstStartUp = firstStartUpObj == null;

    return true;
  }
}
