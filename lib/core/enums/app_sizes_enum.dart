enum AppSizesEnum {
  /// Splash ekranındaki küp animasyonunun dış kapsayıcı boyutu
  splashViewCubeOuterSize(170),
  splashViewCubeSize(150),
  sliderColorfulContainerHeight(4),
  splashViewCubeInnerSize(120),
  homeAnimationInnerDotSize(96),
  homeAnimationOrbitDotSize(8),
  phoneCodeInputContainerWidth(52),
  phoneCodeInputContainerHeight(64),
  notificationCardIconSize(40),
  notificationCardMessageSize(12);

  const AppSizesEnum(this.value);

  final double value;
}

/// Uygulama genelinde kullanılan standart border radius değerleri.
enum AppSizesRadius {
  full(999),
  homeAnimationOrbitDotRadius(60),
  homeAnimationOrbitDotRadius2(52),
  homeAnimationOrbitDotRadius3(56),
  heroStatCard(24),
  card(32),
  button(16),
  cube(20),
  chip(8),
  cameraPlaceholderIconSize(96);

  const AppSizesRadius(this.value);

  final double value;
}

enum AppSizesIcon {
  homeAnimationCenterIconSize(28),
  splashCubixAnimationIcon(40),
  loginDoorIconSize(48),
  cameraPlaceholderIconSize(56),
  inputTextFormIconSize(20),
  flagIconSize(18),
  homeBottomCardFlagIconSize(30),
  categoryCardIconSize(24),
  categoryCardIconContainerSize(56),
  categoryCardArrowIconSize(20);

  const AppSizesIcon(this.value);

  final double value;
}

enum AppSizesText {
  phoneCodeInputItemFontSize(28),
  loginAndGoogleLoginButtonTextFontSize(16),
  bottomNavTextFontSize(10),
  homeDiscoveriesValuesFontSize(22),
  headlineSmallFontSize(24);

  const AppSizesText(this.value);

  final double value;
}
