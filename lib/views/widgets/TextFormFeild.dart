
import 'package:flutter/material.dart';

class CustomTextFromFiled extends StatelessWidget {
   CustomTextFromFiled(
      {Key? key,
        required this.editingController,
        this.textFieldNameColor = Colors.grey,
        this.textFieldHint = " ",
        this.inputAction = TextInputAction.next,
        this.obscure = false,
        this.validator,
        this.autofillHints,
        this.keyboardType,
        this.fillColor = Colors.white,
        this.validateMode = AutovalidateMode.always,
        this.prefixIcon,
        this.title,
        this.suffixIcon,
        this.onSaved


      })
      : super(key: key);

  final String? Function(String?)? validator;
  FormFieldSetter<String>? onSaved;

  final Iterable<String>? autofillHints;
  final TextEditingController editingController;
  final Color fillColor;
  final TextInputAction inputAction;

  final TextInputType? keyboardType;
  final bool obscure;
  final String textFieldHint;

  final Color textFieldNameColor;
  final AutovalidateMode validateMode;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? title;



  @override
  Widget build(BuildContext context) {
    return TextFormField(
          enableSuggestions: true,
          textInputAction: inputAction,
          obscureText: obscure,
          style: TextStyle(color: Colors.black),
          autofillHints: autofillHints,
          autovalidateMode: validateMode,
          controller: editingController,
          keyboardType: keyboardType,
          validator: validator,
          onSaved: onSaved,
          cursorColor: Colors.black,

          decoration: InputDecoration(
              hintText: textFieldHint,
              focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.teal)
              ),
              enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
             errorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.blue)
    ),
              focusedErrorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.blue)
    ),
              hintStyle: const TextStyle(color: Colors.black45,fontSize: 16,fontWeight: FontWeight.w500),

              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon ,
              fillColor: Colors.grey.shade200,
              filled: true),
    );
  }
}