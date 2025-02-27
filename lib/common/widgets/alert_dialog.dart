import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class AlertDialogCustom {
  final String? title;
  final String? message;
  final ContentType contentType;

  AlertDialogCustom({
    this.title,
    this.message,
    required this.contentType,
  });

  MaterialBanner getMaterialBanner() {
    return MaterialBanner(
      shadowColor: Colors.transparent,
      dividerColor: Colors.transparent,
      elevation: 0,
      backgroundColor: Colors.transparent,
      forceActionsBelow: true,
      actions: const [SizedBox.shrink()],
      content: AwesomeSnackbarContent(
        inMaterialBanner: true,
        title: title ?? "Berhasil",
        message: message ?? "Berhasil",
        contentType: contentType,
      ),
    );
  }
}
