import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  ErrorMessageWidget(
      {String message, String retryMessage, VoidCallback onPressed})
      : this._message = message,
        this._retryMessage = retryMessage,
        this._onPressed = onPressed;
  final String _message;
  final VoidCallback _onPressed;

  final String _retryMessage;

  @override
  Widget build(BuildContext context) {
    final retryButton = (_onPressed == null)
        ? Container()
        : RaisedButton(
            child: Text(_retryMessage ?? "RETRY"),
            onPressed: _onPressed,
            textColor: Colors.white,
          );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(_message ?? ""),
        retryButton,
      ],
    );
  }
}
