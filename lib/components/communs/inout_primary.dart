import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPrimary extends StatelessWidget {
  final String label;
  final String? type;
  final bool not_floating_label;
  TextInputType type_input;
  final Function(String)? changed_call;
  final String? sulfix;
  final Icon? icon_sufix;
  final VoidCallback? func_icon_sufix;
  final VoidCallback? onTap;
  final TextCapitalization capitalization;
  final TextEditingController? controller_input;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixText;
  final double? height;
  final int? maxLin;

  InputPrimary(
      {Key? key,
      required this.type_input,
      this.label = "",
      this.not_floating_label = false,
      this.type,
      this.changed_call,
      this.controller_input,
      this.sulfix = null,
      this.func_icon_sufix = null,
      this.icon_sufix,
      this.onTap,
      this.capitalization = TextCapitalization.sentences,
      this.prefixText,
      this.height,
      this.maxLin,
      this.inputFormatters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.height ?? 48,
      child: TextField(
        controller: controller_input,
        textCapitalization: capitalization,
        // onSubmitted: (){},
        onChanged: changed_call,
        onTap: this.onTap,
        inputFormatters: inputFormatters,
        keyboardType: type_input,
        obscureText: this.type == "password",
        maxLines: maxLin,
        decoration: InputDecoration(
          // hintText: 'Email',
          // hasFloatingPlaceholder:
          //     (label.length > 0 && !not_floating_label) ? true : false,
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          suffixIcon: icon_sufix,
          focusColor: Theme.of(context).scaffoldBackgroundColor,
          labelText: label,
          // fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            gapPadding: 5,
            borderSide: new BorderSide(
                color: Theme.of(context).backgroundColor, width: 1),
          ),
          // filled: true,
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(16),

          //   gapPadding: 5,
          //   borderSide: new BorderSide(color: Colors.black),

          // ),
          prefixText: this.prefixText,
          suffixText: sulfix != null ? sulfix : "",
        ),
      ),
    );
  }
}
