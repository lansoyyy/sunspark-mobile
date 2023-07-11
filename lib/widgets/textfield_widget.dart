import 'package:flutter/material.dart';
import 'package:sunspark/widgets/text_widget.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final String? hint;
  bool? isObscure;
  final TextEditingController controller;
  final double? width;
  final double? height;
  final int? maxLine;
  final TextInputType? inputType;
  final bool? isPassword;
  final bool? enabled;
  final String? Function(String?)? validator;

  TextFieldWidget({
    super.key,
    required this.label,
    this.enabled = true,
    this.hint = '',
    required this.controller,
    this.isObscure = false,
    this.width = 300,
    this.height = 60,
    this.maxLine = 1,
    this.isPassword = false,
    this.inputType = TextInputType.text,
    this.validator,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextRegular(text: widget.label, fontSize: 12, color: Colors.black),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: widget.height,
          width: widget.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextFormField(
                enabled: widget.enabled,
                keyboardType: widget.inputType,
                decoration: InputDecoration(
                  suffixIcon: widget.isPassword!
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              widget.isObscure = !widget.isObscure!;
                            });
                          },
                          icon: widget.isObscure!
                              ? const Icon(Icons.remove_red_eye)
                              : const Icon(Icons.visibility_off),
                        )
                      : const SizedBox(),
                  hintText: widget.hint,
                  border: InputBorder.none,
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  errorStyle:
                      const TextStyle(fontFamily: 'QBold', fontSize: 12),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                maxLines: widget.maxLine,
                obscureText: widget.isObscure!,
                controller: widget.controller,
                validator: widget.validator),
          ),
        ),
      ],
    );
  }
}
