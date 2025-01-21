import 'package:flutter/material.dart';
import 'package:vid_fetch/core/utils/extension/extension.dart';
import '../utils/constants/colors.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    this.onSaved,
    this.controller,
    this.focusNode,
    this.pasteLink,
  });

  final FormFieldSetter<String>? onSaved;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function()? pasteLink;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      style: context.textTheme.bodySmall,
      cursorColor: ColorManager.darkGrey,
      keyboardType: TextInputType.url,
      controller: controller,
      onSaved: onSaved,
      validator: _youtubeLinkValidator,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: pasteLink,
          icon: Icon(Icons.paste, color: context.iconTheme.color, size: 20),
        ),
        isCollapsed: true,
        isDense: true,
        filled: true,
        hintText: "Paste YouTube Link",
      ),
    );
  }

  String? _youtubeLinkValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a YouTube link';
    }

    // Regex to validate YouTube links (including Shorts)
    RegExp youtubeRegex = RegExp(
      r'^(https?:\/\/)?(www\.)?(youtube\.com|youtu\.be)\/(watch\?v=|shorts\/|embed\/|v\/|e\/|.+\?v=)?([^&=%\?]{11})',
      caseSensitive: false,
      multiLine: false,
    );

    if (!youtubeRegex.hasMatch(value)) {
      return 'Please enter a valid YouTube link';
    }

    return null;
  }
}
