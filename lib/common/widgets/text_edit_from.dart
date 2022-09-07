import 'package:flutter/material.dart';


class TextEditForm extends StatefulWidget {
  final TextEditingController controller;
  final IconData? icon;
  final String label;
  final String hint;
  const TextEditForm(
      {Key? key,
      required this.controller,
      required this.icon,
      required this.label,
      required this.hint})
      : super(key: key);

  @override
  State<TextEditForm> createState() => _TextEditFormState();
}

class _TextEditFormState extends State<TextEditForm> {
  // @override
  // void initState() {
  //   widget.controller.addListener(() => setState(() {}));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value == null|| value.isEmpty) {
          return "Enter your ${widget.label}";
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: widget.hint,
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.controller.text.isEmpty
              ? Container(
                  width: 0,
                )
              : IconButton(
                  onPressed: () => {widget.controller.clear()},
                  icon: const Icon(Icons.clear)),
          border: const OutlineInputBorder(),
          label: Text(widget.label)),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
    );
  }
}

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordTextFormField({Key? key, required this.controller})
      : super(key: key);

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool isPasswordVisible = false;
  String password = "";
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter Password";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          hintText: "********",
          prefixIcon: const Icon(Icons.lock_outlined),
          suffixIcon: IconButton(
            icon: isPasswordVisible
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
            onPressed: () => {
              setState((() => {isPasswordVisible = !isPasswordVisible}))
            },
          ),
          border: const OutlineInputBorder(),
          label: const Text("Password")),
      obscureText: !isPasswordVisible,
      textInputAction: TextInputAction.done,
    );
  }
}
