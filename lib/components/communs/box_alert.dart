import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final Color bgColor;
  final String title;
  final String? positiveBtnText;
  final String? negativeBtnText;
  final VoidCallback? onPostivePressed;
  final VoidCallback? onNegativePressed;
  final double circularBorderRadius;
  final Widget? child;

  CustomAlertDialog({
    this.child,
    required this.title,
    this.circularBorderRadius = 15.0,
    this.bgColor = Colors.white,
    this.positiveBtnText,
    this.negativeBtnText,
    this.onPostivePressed,
    this.onNegativePressed,
  })  : assert(bgColor != null),
        assert(circularBorderRadius != null);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: child,
      // backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorderRadius)),
      actions: <Widget>[
        if (negativeBtnText != null)
          FlatButton(
            child: Text(negativeBtnText ?? ''),
            textColor: Colors.red,
            onPressed: () {
              Navigator.of(context).pop();
              if (onNegativePressed != null) {
                onNegativePressed;
              }
            },
          ),
        if (positiveBtnText != null)
          FlatButton(
              child: Text(positiveBtnText ?? ''),
              textColor: Colors.blue,
              onPressed: onPostivePressed

              // () {
              //   Navigator.of(context).pop();
              //   if (onPostivePressed != null) {
              //     print('E positivo');
              //     onPostivePressed;
              //   }
              // },
              ),
      ],
    );
  }

  // showDialog(context: context, builder: (BuildContext context) => dialog);
}
