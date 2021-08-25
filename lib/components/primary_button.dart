import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    required this.text,
    this.onPressed,
    this.padding,
    this.minWidth,
    this.minHeight
  });

  final String text;
  final GestureTapCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final double? minWidth;
  final double? minHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: (this.padding != null) ? this.padding! : EdgeInsets.zero,
        child: RawMaterialButton(
          constraints: BoxConstraints(
            minWidth: (this.minWidth != null) ? this.minWidth! : double.infinity,
            minHeight: (this.minHeight != null) ? this.minHeight! : 48.0
          ),
          fillColor: Theme.of(context).accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
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