import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PasswordField extends StatefulWidget {
  final String judul;

  final void Function(String value) onChanged;

  const PasswordField({super.key, required this.judul, this.onChanged = _emptyFunction});

  static void _emptyFunction(String value) {}

  @override
  State<PasswordField> createState() => _PasswordFieldState();

}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscure = true;

  void _toggleVisibility() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.judul),
        SizedBox(height: 5),
        TextFormField(
          obscureText: _obscure,
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility,),
              onPressed: () => {_toggleVisibility()},
            ),
          ),
          onChanged: widget.onChanged,
        )
      ],
    );
  }
}