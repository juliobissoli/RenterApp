import 'package:flutter/material.dart';

class BtnOutline extends StatelessWidget {
  final VoidCallback? func;
  final String label;
  final String mode;

  BtnOutline({required this.func, required this.label, this.mode = "light"});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: func,
        style: ButtonStyle(
          // foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          // backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: _getColor(context)),
            ),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
              color: Colors.white, //_getColor(context),
              fontSize: 18,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  _getColor(context) {
    if (this.mode == "danger")
      return this.func != null ? Colors.red[400] : Colors.red[50];
    else
      return this.func != null
          ? Theme.of(context)
              .secondaryHeaderColor // Theme.of(context).backgroundColor
          : Colors.grey;
  }
}
