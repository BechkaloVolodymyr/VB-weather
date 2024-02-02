import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberFieldWidget extends StatelessWidget {
  const NumberFieldWidget({
    super.key,
    this.error,
    required this.labelText,
    this.onChanged,
    this.controller,
    this.onClear,
  });

  final String? error;
  final String labelText;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final void Function()? onClear;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            // cursorColor: AppColors.c707070,
            controller: controller,
            keyboardType: TextInputType.number,
            onChanged: onChanged,
            style: TextStyle(
              height: 1.35,
              color:
                  error == null || error!.isEmpty ? Colors.black : Colors.red,
            ),
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              filled: false,
              border: InputBorder.none,
              labelText: labelText,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              suffixIcon: onClear != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.abc)),
                    )
                  : null,
              suffixIconConstraints: onClear != null
                  ? const BoxConstraints(maxHeight: 24, maxWidth: 32)
                  : null,
            ),
          ),
          if (error != null && error!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                error!,
                style: TextStyle(color: Colors.red),
              ),
            ),
        ],
      );
}
