class AppAssetsUtil {
  AppAssetsUtil._(); // prevent from creating constructor
  
  // Base paths
  static const String _assetsPath = "assets";
  
  // Images
  static const String uberLanding = "$_assetsPath/taxis.jpg";
  
  // Vehicle images
  static const String vechiclePath = "$_assetsPath/vechicle";
  static const String car = "$vechiclePath/car.gif";
  static const String taxi = "$vechiclePath/taxi.gif";
  static const String moto = "$vechiclePath/moto.jpeg";
  static const String confirmRide = "$_assetsPath/taxi.gif";
  
  // Animations
  static const String animationsPath = "$_assetsPath/animations";
  static const String waitingAnimation = "$animationsPath/waiting.json";
  
  // External URLs
  static const String rideAnimationUrl = 'https://assets2.lottiefiles.com/packages/lf20_touohxv0.json';
}
