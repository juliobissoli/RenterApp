import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final VoidCallback? func;
  final String label;
  final String mode;
  final bool outlined;
  final bool? isLoading;

  Btn(
      {required this.func,
      required this.label,
      this.mode = "light",
      this.outlined = false,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    // return
    if (isLoading ?? false)
      return Container(
        width: double.infinity,
        height: 42,
        child: Center(
            // decoration: BoxDecoration(color: Colors.red),
            // width: 48,
            child: CircularProgressIndicator()),
      );
    else
      return SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: func,
          style: ButtonStyle(
            // foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            // backgroundColor: !outlined
            //     ? MaterialStateProperty.all<Color>(Colors.deepPurpleAccent)
            //     : MaterialStateProperty.all<Color>(Colors.transparent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                // side: BorderSide(color: _getColor(context)),
              ),
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
                color: this.func != null
                    ? Colors.white
                    : Colors.grey, //_getColor(context),
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
