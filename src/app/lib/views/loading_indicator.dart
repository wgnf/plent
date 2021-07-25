import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  LoadingIndicator({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            CircularProgressIndicator(
              color: Theme.of(context).accentColor,
            )
          ],
        ),
      ),
    );
  }
}
