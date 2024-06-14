import 'package:flutter/material.dart';

class BlueFormField extends StatefulWidget {
  const BlueFormField({
    Key? key,
    this.labelText = "",
    required this.controller,
    required this.labelTitle,
    this.subtitle = "",
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final String labelTitle;
  final String subtitle;

  @override
  State<BlueFormField> createState() => _BlueFormFieldState();
}

class _BlueFormFieldState extends State<BlueFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Column(
        children: [
          widget.labelTitle == "" || widget.labelTitle == null
              ? const SizedBox()
              : Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.labelTitle,
                        style: const TextStyle(color: Colors.black),
                      ),
                      widget.subtitle != ""
                          ? Text(widget.subtitle)
                          : const SizedBox(),
                    ],
                  ),
                ),
          TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Color(0xff2A74F7),
                  width: 2,
                ),
              ),
              labelText: widget.labelText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Color(0xff2A74F7),
                  width: 2.0,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
