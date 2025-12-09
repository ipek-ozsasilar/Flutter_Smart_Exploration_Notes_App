import 'dart:io';
import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';

class CapturePreviewImageWidget extends StatelessWidget {
  const CapturePreviewImageWidget({super.key, required this.image});

  final File image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizesRadius.button.value),
        boxShadow: <BoxShadow>[_boxShadowMethod()],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizesRadius.button.value),
        child: Image.file(image, fit: BoxFit.cover),
      ),
    );
  }

  BoxShadow _boxShadowMethod() {
    final double blurRadius = 10;
    final double spreadRadius = 2;
    final Color color = AppColors.black.withOpacity(0.3);
    return BoxShadow(
      color: color,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
    );
  }
}
