import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_gradients.dart';

/// Uygulama genelinde kullanılan ortak gradyan arka plan widget'ı.
///
/// - Tüm ekranı doldurur (`BoxConstraints.expand`).
/// - İsteğe bağlı `padding` ile içeriği içten boşluklu verebilirsin.
class GradientBackground extends StatelessWidget {
  const GradientBackground({required this.child, super.key, this.padding});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    Widget content = child;
    if (padding != null) {
      content = Padding(padding: padding!, child: child);
    }

    return Container(
      /// Tüm ekranı doldurur
      constraints: const BoxConstraints.expand(),

      /// Gradyan arka planı
      decoration:  BoxDecoration(gradient: AppGradients.instance.appBackgroundGradient),
      child: content,
    );
  }
}
