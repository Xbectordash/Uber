// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'راف رايد';

  @override
  String get welcomeMessage =>
      '🚗 رحلتك على طريقتك! ✨\nمرحبًا بك في تجربة راف رايد الجديدة! 🎉';

  @override
  String get continueText => 'استمرار';

  @override
  String get enterYour => 'أدخل';

  @override
  String get nameString => 'الاسم';

  @override
  String get firstName => 'الاسم الأول';

  @override
  String get lastName => 'اسم العائلة';

  @override
  String get emailString => 'البريد الإلكتروني';

  @override
  String get phoneString => 'رقم الهاتف';

  @override
  String get passwordString => 'كلمة المرور';

  @override
  String get confirmPasswordString => 'تأكيد كلمة المرور';

  @override
  String get createAccountString => 'إنشاء حساب';

  @override
  String get signupMessage =>
      '👋 مرحبًا أيها الجميل — أنشئ حسابك قبل أن تذهب الرحلة لشخص آخر 😏🚗';

  @override
  String get accountCreationLogic => 'منطق إنشاء الحساب هنا!';

  @override
  String get loginString => 'تسجيل الدخول';

  @override
  String get loginMessage => 'مرحبًا بعودتك! يرجى تسجيل الدخول للمتابعة.';

  @override
  String get loginLogic => 'منطق تسجيل الدخول هنا!';

  @override
  String get welcomePassenger => 'مرحبًا بالراكب! يرجى تسجيل الدخول للمتابعة.';

  @override
  String get welcomeCaptain => 'مرحبًا بالكابتن! يرجى تسجيل الدخول للمتابعة.';

  @override
  String get updateInfo => 'تحديث المعلومات';

  @override
  String get update => 'تحديث';

  @override
  String get updateProfile => 'تحديث الملف الشخصي';

  @override
  String get updateProfileMessage => 'قم بتحديث معلوماتك أدناه.';

  @override
  String get userInfoUpdated => 'تم تحديث معلومات المستخدم!';

  @override
  String get profileUpdated => 'تم تحديث الملف الشخصي!';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get firstNameRequired => 'الاسم الأول مطلوب';

  @override
  String get firstNameMin => 'الاسم الأول يجب أن يكون على الأقل حرفين';

  @override
  String get lastNameRequired => 'اسم العائلة مطلوب';

  @override
  String get lastNameMin => 'اسم العائلة يجب أن يكون على الأقل حرفين';

  @override
  String get emailRequired => 'البريد الإلكتروني مطلوب';

  @override
  String get emailInvalid => 'يرجى إدخال بريد إلكتروني صالح';

  @override
  String get passwordRequired => 'كلمة المرور مطلوبة';

  @override
  String get passwordMin => 'يجب أن تكون كلمة المرور 6 أحرف على الأقل';

  @override
  String get confirmPasswordRequired => 'يرجى تأكيد كلمة المرور';

  @override
  String get passwordsDoNotMatch => 'كلمات المرور غير متطابقة';

  @override
  String get vehicleCapacityInvalid => 'سعة المركبة غير صالحة';

  @override
  String get homeRouteName => 'الصفحة الرئيسية';

  @override
  String get userHomeRouteName => 'صفحة الراكب';

  @override
  String get captainHomeRouteName => 'صفحة الكابتن';

  @override
  String get loginRouteName => 'شاشة تسجيل الدخول';

  @override
  String get signupRouteName => 'شاشة التسجيل';

  @override
  String get updateUserRouteName => 'شاشة تحديث المستخدم';

  @override
  String get captainSignupRouteName => 'تسجيل الكابتن';

  @override
  String get landingRouteName => 'شاشة البداية';

  @override
  String get appStartRouteName => 'شاشة بدء التطبيق';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟ ';

  @override
  String get captainSignupMessage => 'سجل ككابتن وأضف تفاصيل مركبتك للبدء!';

  @override
  String get vehicleDetails => 'تفاصيل المركبة';

  @override
  String get vehicleColor => 'اللون';

  @override
  String get vehicleColorRequired => 'اللون مطلوب';

  @override
  String get vehiclePlate => 'رقم اللوحة';

  @override
  String get vehiclePlateRequired => 'رقم اللوحة مطلوب';

  @override
  String get vehicleCapacity => 'السعة';

  @override
  String get vehicleCapacityRequired => 'السعة مطلوبة';

  @override
  String get vehicleType => 'نوع المركبة';

  @override
  String get vehicleTypeRequired => 'نوع المركبة مطلوب';

  @override
  String get captainSignupLogic => 'منطق تسجيل الكابتن هنا!';

  @override
  String get createCaptainAccountString => 'إنشاء حساب كابتن';

  @override
  String get carSubtitle => 'سيارة اقتصادية للرحلات اليومية';

  @override
  String get taxiSubtitle => 'تاكسي تقليدي للتنقل في المدينة';

  @override
  String get motoSubtitle => 'دراجة نارية اقتصادية للتنقل السريع';

  @override
  String get carType => 'سيارة';

  @override
  String get autoType => 'توك توك';

  @override
  String get motorcycleType => 'دراجة نارية';

  @override
  String get failedToEndRide => 'فشل في إنهاء الرحلة: ';

  @override
  String get unknownError => 'خطأ غير معروف';

  @override
  String get enterOtpToStartRide => 'أدخل رمز التحقق لبدء الرحلة';

  @override
  String get confirmOtpStartRide => 'تأكيد الرمز وبدء الرحلة';

  @override
  String get activeStatus => 'نشط';

  @override
  String get colorLabel => 'اللون: ';

  @override
  String get typeLabel => 'النوع: ';

  @override
  String get plateLabel => 'اللوحة: ';

  @override
  String get rideStarted => '🚕 بدأت الرحلة';

  @override
  String get sourceLabel => 'المصدر:';

  @override
  String get destinationLabel => 'الوجهة:';

  @override
  String get fareLabel => 'الأجرة: ';

  @override
  String get rideCompleted => 'تم إكمال الرحلة';

  @override
  String get driverLabel => 'السائق: ';

  @override
  String get vehicleNoLabel => 'رقم السيارة: ';

  @override
  String get vehicleLabel => 'السيارة: ';

  @override
  String get languageLabel => 'لغة: ';

  @override
  String get selectLanguage => 'اختر اللغة';

  @override
  String get otpLabel => 'رمز التحقق: ';

  @override
  String get makePayment => 'قم بالدفع';

  @override
  String get waitingForDriver => 'في انتظار السائق...';

  @override
  String get cancelRide => 'إلغاء الرحلة';

  @override
  String get startTypingHint => 'ابدأ بالكتابة لرؤية الاقتراحات.';

  @override
  String get pickupHint => 'موقع الانطلاق';

  @override
  String get destinationHint => 'إلى أين؟';

  @override
  String get carName => 'سيارة';

  @override
  String get autoName => 'توك توك';

  @override
  String get motorcycleName => 'دراجة نارية';

  @override
  String get rideCreated => 'تم إنشاء الرحلة!';

  @override
  String get rideIdLabel => 'معرف الرحلة: ';

  @override
  String get panelHandleTapped => 'تم النقر على مقبض اللوحة';

  @override
  String get selectVehicle => 'يرجى اختيار مركبة';

  @override
  String get errorPrefix => 'خطأ: ';

  @override
  String get noSuggestions => 'لم يتم العثور على اقتراحات.';

  @override
  String get startTyping => 'ابدأ في الكتابة لرؤية الاقتراحات.';
}
