class StringConstant {
  // App/Brand
  static const String appName = "Rave Ride";

  // Landing Page
  static const String welcomeMessage =
      "🚗 Your ride, your way! ✨\nWelcome to the new Rave Ride experience! 🎉";
  static const String continueText = "Continue";

  // Auth - Common
  static const String enterYour = "Enter your";

  // Auth - Signup
  static const String nameString = "Name";
  static const String firstName = "First Name";
  static const String lastName = "Last Name";
  static const String emailString = "Email";
  static const String phoneString = "Phone";
  static const String passwordString = "Password";
  static const String confirmPasswordString = "Confirm Password";
  static const String createAccountString = "Create Account";
  static const String signupMessage =
      "👋 Hey there, good lookin’ — create your account before this ride finds someone hotter 😏🚗";
  static const String accountCreationLogic =
      "Account creation logic goes here!";

  // Auth - Login
  static const String loginString = "Login";
  static const String loginMessage = "Welcome back! Please login to continue.";
  static const String loginLogic = "Login logic goes here!";
  static const String welcomePassenger =
      "Welcome Passenger! Please login to continue.";
  static const String welcomeCaptain =
      "Welcome Captain! Please login to continue.";

  // Auth - Update
  static const String updateInfo = "Update Info";
  static const String update = "Update";
  static const String updateProfile = "Update Profile";
  static const String updateProfileMessage =
      "Update your profile information below.";
  static const String userInfoUpdated = "User info updated!";
  static const String profileUpdated = "Profile updated!";

  // Auth - Logout
  static const String logout = "Logout";

  // Validation messages
  static const String firstNameRequired = "First name is required";
  static const String firstNameMin = "First name must be at least 2 characters";
  static const String lastNameRequired = "Last name is required";
  static const String lastNameMin = "Last name must be at least 2 characters";
  static const String emailRequired = "Email is required";
  static const String emailInvalid = "Enter a valid email address";
  static const String passwordRequired = "Password is required";
  static const String passwordMin = "Password must be at least 6 characters";
  static const String confirmPasswordRequired = "Please confirm your password";
  static const String passwordsDoNotMatch = "Passwords do not match";
  static const String vehicleCapacityInvalid = 'Invalid vehicle capacity';

  // Router names
  static const String homeRouteName = "home-screen";
  static const String userHomeRouteName = "user-home";
  static const String captainHomeRouteName = "captain-home";
  static const String loginRouteName = "login-screen";
  static const String signupRouteName = "signup-screen";
  static const String updateUserRouteName = "update-user-screen";
  static const String captainSignupRouteName = "captain-signup";
  static const String landingRouteName = "landing-screen";


  // Auth - Login/Signup prompt
  static const String dontHaveAccount = "Don't have an account? ";

  // Captain Signup
  static const String captainSignupMessage =
      'Register as a Captain and add your vehicle details to get started!';

  // Captain Signup - Vehicle
  static const String vehicleDetails = 'Vehicle Details';
  static const String vehicleColor = 'Color';
  static const String vehicleColorRequired = 'Color required';
  static const String vehiclePlate = 'Plate';
  static const String vehiclePlateRequired = 'Plate required';
  static const String vehicleCapacity = 'Capacity';
  static const String vehicleCapacityRequired = 'Capacity required';
  static const String vehicleType = 'Vehicle Type';
  static const String vehicleTypeRequired = 'Vehicle type required';
  static const String captainSignupLogic = 'Captain signup logic goes here!';
  static const String createCaptainAccountString = "Create Captain Account";

  // Vehicle subtitles
  static const String carSubtitle = 'Affordable car for daily rides';
  static const String taxiSubtitle = 'Classic taxi for city travel';
  static const String motoSubtitle = 'Affordable moto for quick trips';

  // Vehicle types
  static const String carType = 'car';
  static const String autoType = 'auto';
  static const String motorcycleType = 'motorcycle';
}
