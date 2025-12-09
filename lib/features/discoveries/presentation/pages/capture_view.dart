import 'dart:io';
import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/gradient_background.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/widgets/camera_place_holder_widget.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/widgets/capture_button_widget.dart';
import 'package:smart_exploration_notes/core/enums/app_strings_enum.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/widgets/icon_and_title_top_bar.dart.dart';

/// Resim çekme ekranı
class CaptureView extends StatefulWidget {
  const CaptureView({super.key});

  @override
  State<CaptureView> createState() => _CaptureViewState();
}

class _CaptureViewState extends State<CaptureView> {
  /// Çekilen resim
  File? _capturedImage;

  @override
  Widget build(BuildContext context) {
    final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start;
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: crossAxisAlignment,
            children: <Widget>[
              /// Üst bar
              IconAndTitleTopBarWidget(title: AppStringsEnum.capture.value),

              /// İçerik
              Expanded(
                child: _capturedImage == null
                    ? CameraPlaceholderWidget(
                        onImagePicked: (File file) {
                          setState(() {
                            _capturedImage = file;
                          });
                        },
                      )
                    : CapturePreviewWidget(capturedImage: _capturedImage!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
