import 'package:flutter/material.dart';

class InputSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String dropdownValue;
    return DropdownButtonFormField<String>(
      // borderRadius: BorderRadius.circular(10),
      isExpanded: true,
      // value: dropdownValue,
      decoration: InputDecoration(
        // hintText: 'Email',
        // hasFloatingPlaceholder:
        //     (label.length > 0 && !not_floating_label) ? true : false,
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        focusColor: Theme.of(context).scaffoldBackgroundColor,
        // fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          // gapPadding: 5,
          borderSide: new BorderSide(color: Colors.grey, width: 1),
        ),
        // filled: true,
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(16),

        //   gapPadding: 5,
        //   borderSide: new BorderSide(color: Colors.black),

        // ),
      ),

      onChanged: (String? newValue) {
        // setState(() {
        //   dropdownValue = newValue!;
        // });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
