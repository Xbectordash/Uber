// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => '레이브 라이드';

  @override
  String get welcomeMessage =>
      '🚗 당신의 방식으로 즐기는 라이딩! ✨\n새로운 레이브 라이드 경험에 오신 것을 환영합니다! 🎉';

  @override
  String get continueText => '계속';

  @override
  String get enterYour => '입력하세요';

  @override
  String get nameString => '이름';

  @override
  String get firstName => '이름';

  @override
  String get lastName => '성';

  @override
  String get emailString => '이메일';

  @override
  String get phoneString => '전화번호';

  @override
  String get passwordString => '비밀번호';

  @override
  String get confirmPasswordString => '비밀번호 확인';

  @override
  String get createAccountString => '계정 생성';

  @override
  String get signupMessage => '👋 안녕하세요! 누군가 타기 전에 계정을 만드세요 😏🚗';

  @override
  String get accountCreationLogic => '계정 생성 로직이 여기에 들어갑니다!';

  @override
  String get loginString => '로그인';

  @override
  String get loginMessage => '다시 오신 것을 환영합니다! 계속하려면 로그인하세요.';

  @override
  String get loginLogic => '로그인 로직이 여기에 들어갑니다!';

  @override
  String get welcomePassenger => '승객님 환영합니다! 계속하려면 로그인하세요.';

  @override
  String get welcomeCaptain => '캡틴님 환영합니다! 계속하려면 로그인하세요.';

  @override
  String get updateInfo => '정보 업데이트';

  @override
  String get update => '업데이트';

  @override
  String get updateProfile => '프로필 업데이트';

  @override
  String get updateProfileMessage => '아래에서 정보를 업데이트하세요.';

  @override
  String get userInfoUpdated => '사용자 정보가 업데이트되었습니다!';

  @override
  String get profileUpdated => '프로필이 업데이트되었습니다!';

  @override
  String get logout => '로그아웃';

  @override
  String get firstNameRequired => '이름은 필수입니다';

  @override
  String get firstNameMin => '이름은 최소 2자 이상이어야 합니다';

  @override
  String get lastNameRequired => '성은 필수입니다';

  @override
  String get lastNameMin => '성은 최소 2자 이상이어야 합니다';

  @override
  String get emailRequired => '이메일은 필수입니다';

  @override
  String get emailInvalid => '유효한 이메일 주소를 입력하세요';

  @override
  String get passwordRequired => '비밀번호는 필수입니다';

  @override
  String get passwordMin => '비밀번호는 최소 6자 이상이어야 합니다';

  @override
  String get confirmPasswordRequired => '비밀번호 확인이 필요합니다';

  @override
  String get passwordsDoNotMatch => '비밀번호가 일치하지 않습니다';

  @override
  String get vehicleCapacityInvalid => '잘못된 차량 정원 수';

  @override
  String get homeRouteName => '홈 화면';

  @override
  String get userHomeRouteName => '사용자 홈';

  @override
  String get captainHomeRouteName => '캡틴 홈';

  @override
  String get loginRouteName => '로그인 화면';

  @override
  String get signupRouteName => '회원가입 화면';

  @override
  String get updateUserRouteName => '사용자 정보 수정 화면';

  @override
  String get captainSignupRouteName => '캡틴 가입';

  @override
  String get landingRouteName => '랜딩 화면';

  @override
  String get appStartRouteName => '앱 시작 화면';

  @override
  String get dontHaveAccount => '계정이 없으신가요? ';

  @override
  String get captainSignupMessage => '캡틴으로 등록하고 차량 정보를 추가하세요!';

  @override
  String get vehicleDetails => '차량 정보';

  @override
  String get vehicleColor => '색상';

  @override
  String get vehicleColorRequired => '색상은 필수입니다';

  @override
  String get vehiclePlate => '번호판';

  @override
  String get vehiclePlateRequired => '번호판은 필수입니다';

  @override
  String get vehicleCapacity => '정원';

  @override
  String get vehicleCapacityRequired => '정원은 필수입니다';

  @override
  String get vehicleType => '차량 종류';

  @override
  String get vehicleTypeRequired => '차량 종류는 필수입니다';

  @override
  String get captainSignupLogic => '캡틴 가입 로직이 여기에 들어갑니다!';

  @override
  String get createCaptainAccountString => '캡틴 계정 생성';

  @override
  String get carSubtitle => '일상 이동에 적합한 저렴한 차량';

  @override
  String get taxiSubtitle => '도시 이동에 적합한 전통적인 택시';

  @override
  String get motoSubtitle => '빠른 이동에 적합한 저렴한 오토바이';

  @override
  String get carType => '자동차';

  @override
  String get autoType => '오토';

  @override
  String get motorcycleType => '오토바이';

  @override
  String get failedToEndRide => '라이드 종료 실패: ';

  @override
  String get unknownError => '알 수 없는 오류';

  @override
  String get enterOtpToStartRide => '라이드를 시작하려면 OTP를 입력하세요';

  @override
  String get confirmOtpStartRide => 'OTP 확인 및 라이드 시작';

  @override
  String get activeStatus => '활성';

  @override
  String get colorLabel => '색상: ';

  @override
  String get typeLabel => '종류: ';

  @override
  String get plateLabel => '번호판: ';

  @override
  String get rideStarted => '🚕 라이드 시작됨';

  @override
  String get sourceLabel => '출발지:';

  @override
  String get destinationLabel => '도착지:';

  @override
  String get fareLabel => '요금: ';

  @override
  String get rideCompleted => '라이드 완료됨';

  @override
  String get driverLabel => '기사: ';

  @override
  String get vehicleNoLabel => '차량 번호: ';

  @override
  String get vehicleLabel => '차량: ';

  @override
  String get languageLabel => 'Language: ';

  @override
  String get selectLanguage => '언어 선택';

  @override
  String get otpLabel => 'OTP: ';

  @override
  String get makePayment => '결제하기';

  @override
  String get waitingForDriver => '기사님을 기다리는 중...';

  @override
  String get cancelRide => '라이드 취소';

  @override
  String get startTypingHint => '제안을 보려면 입력을 시작하세요.';

  @override
  String get pickupHint => '픽업 위치';

  @override
  String get destinationHint => '어디로 가시나요?';

  @override
  String get carName => '자동차';

  @override
  String get autoName => '오토';

  @override
  String get motorcycleName => '오토바이';

  @override
  String get rideCreated => '라이드가 생성되었습니다!';

  @override
  String get rideIdLabel => '라이드 ID: ';

  @override
  String get panelHandleTapped => '패널 핸들이 탭되었습니다';

  @override
  String get selectVehicle => '차량을 선택하세요';

  @override
  String get errorPrefix => '오류: ';

  @override
  String get noSuggestions => '추천을 찾을 수 없습니다.';

  @override
  String get startTyping => '추천을 보려면 입력을 시작하세요.';
}
