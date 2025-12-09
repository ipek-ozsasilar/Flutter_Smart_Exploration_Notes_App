enum AppStringsEnum {
  smartExplorationNotes('Smart Exploration Notes'),
  forgotPasswordTitle('Password Reset Made Easy'),
  forgotPasswordDescription('Secure link will be sent to your email'),
  email('Email'),
  password('Password'),
  welcome('Welcome'),
  or('Or'),
  welcomeDescription('Welcome to the Smart Exploration Notes'),
  completed('Completed'),
  phoneVerification('Phone Verification'),
  discoveriesListViewTitle('Discoveries List View Title'),
  phoneVerificationCodeNotReceived('Code not received?'),
  verify('Verify'),
  googleLogin('Google Login'),
  retakePhoto('Retake Photo'),
  savePhoto('Save Photo'),
  discoveriesListViewDescription(
    'View your discoveries grouped by tags as cards.',
  ),
  historicalBuildings('Historical Buildings'),
  historicalBuildingsDescription('Historical Buildings Description'),
  captureLabelRediscover(
    'Capture. Label. Rediscover.\nYour personal discovery journal on the map.',
  ),
  natureAndLandscapeDescription('Nature and Landscape Description'),
  streetArtDescription('Street Art Description'),
  coffeeAndPlacesDescription('Coffee and Places Description'),
  natureAndLandscape('Nature and Landscape'),
  streetArt('Street Art'),
  coffeeAndPlaces('Coffee and Places'),
  homeBottomCardDescription(
    'Are you ready to add your first discovery today? Start from below.',
  ),
  homeBottomCardDescriptionContinue(
    'Did you discover something new today? Continue from below to add it.',
  ),
  homeBottomCardButtonText('Start Your First Discovery'),
  homeBottomCardButtonTextContinue('Continue Discoveries'),
  forgotPassword('I forgot my password'),
  forgotPasswordEmailSent(
    'Password reset link has been sent to your email address',
  ),
  discoveries('Discoveries'),
  targetDiscovery('Target Discovery'),
  forgotPasswordSend('Send Password Reset Link'),
  forgotPasswordEnterEmail(
    'Enter your email address, we will send you a password reset link',
  ),
  forgotPasswordEmailSentDescription(
    'Please check your email and click the password reset link.',
  ),
  noDiscoveries('No discoveries yet'),
  doYouHaveAnAccount('Do you have an account?'),
  aiDiscoveryPreparing('AI is preparing your discovery space...'),
  map('Map'),
  createPersonalDiscoveryNote('Create Personal Discovery Note'),
  locationPhotoAITagsReady('Location + photo + AI tags ready'),
  createAccount('Create Account'),
  alreadyHaveAnAccount('Already have an account?'),
  name('Name'),
  phoneHintText('+90 5XX XXX XX XX'),
  confirmPassword('Confirm Password'),
  capture('Capture'),
  phone('Phone'),
  createAccountDescription('Start your discovery journey'),
  login('Login'),
  register('Register'),
  labels('Labels'),
  notify('Notify'),
  ai('AI'),
  notes('Notes'),
  notifications('Notifications'),
  noNotifications('No notifications'),
  capturePhoto('Take a photo'),
  takePhotoToSaveLocation('Take a photo to save the location'),
  capturePhotoDescription(
    'Take a photo and save the location you want to save',
  ),
  takePhoto('Take a photo'),
  selectFromGallery('Select from gallery');

  final String value;

  const AppStringsEnum(this.value);
}

enum AppErrorStringsEnum {
  cameraError('error while capturing image'),
  galleryError('error while selecting image from gallery');

  final String value;

  const AppErrorStringsEnum(this.value);
}
