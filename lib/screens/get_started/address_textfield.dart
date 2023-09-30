import 'package:flutter/material.dart';

Widget AddressTextfield(TextEditingController controller) {
  return Row(
    children: [
      Expanded(
          child: Container(
        margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 0),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.multiline,
          minLines: 1,
          maxLines: 3,
          decoration: InputDecoration(
            labelText: 'Delivery Address',
            hintText: 'Enter your delivery address',
            prefixIcon: Icon(Icons.location_on),
            border: OutlineInputBorder(),
          ),
        ),
      ))
    ],
  );
}
