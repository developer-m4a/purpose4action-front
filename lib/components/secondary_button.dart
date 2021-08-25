import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  SecondaryButton({
    required this.text,
    this.onPressed,
    this.padding
  });

  final String text;
  final GestureTapCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: (this.padding != null) ? this.padding! : EdgeInsets.zero,
        child: RawMaterialButton(
          constraints: BoxConstraints(
            minWidth: double.infinity,
            minHeight: 48.0
          ),
          fillColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(
              color: Theme.of(context).accentColor,
              width: 3.0,
              style: BorderStyle.solid
            )
          ),
          onPressed: (onPressed != null) ? onPressed : () { _showToast(context); },
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              text,
              style: Theme.of(context).textTheme.button,
            ),
          ),
        )
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text("It'll be implemented soon."),
        action: SnackBarAction(label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

}