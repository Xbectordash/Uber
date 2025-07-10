// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => '雷舞出行';

  @override
  String get welcomeMessage => '🚗 随心出行，畅享每一程！✨\n欢迎来到全新的雷舞出行体验！🎉';

  @override
  String get continueText => '继续';

  @override
  String get enterYour => '请输入您的';

  @override
  String get nameString => '姓名';

  @override
  String get firstName => '名字';

  @override
  String get lastName => '姓氏';

  @override
  String get emailString => '邮箱';

  @override
  String get phoneString => '手机号';

  @override
  String get passwordString => '密码';

  @override
  String get confirmPasswordString => '确认密码';

  @override
  String get createAccountString => '创建账户';

  @override
  String get signupMessage => '👋 嗨，帅哥/美女，赶紧注册吧，不然这趟车要被别人抢走啦 😏🚗';

  @override
  String get accountCreationLogic => '账户创建逻辑在此！';

  @override
  String get loginString => '登录';

  @override
  String get loginMessage => '欢迎回来！请登录继续。';

  @override
  String get loginLogic => '登录逻辑在此！';

  @override
  String get welcomePassenger => '乘客您好！请登录继续使用。';

  @override
  String get welcomeCaptain => '司机您好！请登录继续使用。';

  @override
  String get updateInfo => '更新信息';

  @override
  String get update => '更新';

  @override
  String get updateProfile => '更新资料';

  @override
  String get updateProfileMessage => '请在下方更新您的个人信息。';

  @override
  String get userInfoUpdated => '用户信息已更新！';

  @override
  String get profileUpdated => '资料已更新！';

  @override
  String get logout => '退出登录';

  @override
  String get firstNameRequired => '名字不能为空';

  @override
  String get firstNameMin => '名字至少需要两个字符';

  @override
  String get lastNameRequired => '姓氏不能为空';

  @override
  String get lastNameMin => '姓氏至少需要两个字符';

  @override
  String get emailRequired => '邮箱不能为空';

  @override
  String get emailInvalid => '请输入有效的邮箱地址';

  @override
  String get passwordRequired => '密码不能为空';

  @override
  String get passwordMin => '密码至少需要6个字符';

  @override
  String get confirmPasswordRequired => '请确认您的密码';

  @override
  String get passwordsDoNotMatch => '两次输入的密码不一致';

  @override
  String get vehicleCapacityInvalid => '车辆容量无效';

  @override
  String get homeRouteName => '首页';

  @override
  String get userHomeRouteName => '乘客首页';

  @override
  String get captainHomeRouteName => '司机首页';

  @override
  String get loginRouteName => '登录页面';

  @override
  String get signupRouteName => '注册页面';

  @override
  String get updateUserRouteName => '更新用户页面';

  @override
  String get captainSignupRouteName => '司机注册页面';

  @override
  String get landingRouteName => '欢迎页面';

  @override
  String get appStartRouteName => '应用启动页';

  @override
  String get dontHaveAccount => '还没有账户？ ';

  @override
  String get captainSignupMessage => '注册为司机并添加您的车辆信息即可开始！';

  @override
  String get vehicleDetails => '车辆信息';

  @override
  String get vehicleColor => '颜色';

  @override
  String get vehicleColorRequired => '颜色不能为空';

  @override
  String get vehiclePlate => '车牌号';

  @override
  String get vehiclePlateRequired => '车牌号不能为空';

  @override
  String get vehicleCapacity => '载客数';

  @override
  String get vehicleCapacityRequired => '载客数不能为空';

  @override
  String get vehicleType => '车辆类型';

  @override
  String get vehicleTypeRequired => '请选择车辆类型';

  @override
  String get captainSignupLogic => '司机注册逻辑在此！';

  @override
  String get createCaptainAccountString => '创建司机账户';

  @override
  String get carSubtitle => '适合日常通勤的经济型汽车';

  @override
  String get taxiSubtitle => '城市出行的传统出租车';

  @override
  String get motoSubtitle => '适合快速出行的经济型摩托';

  @override
  String get carType => '汽车';

  @override
  String get autoType => '三轮车';

  @override
  String get motorcycleType => '摩托车';

  @override
  String get failedToEndRide => '结束行程失败：';

  @override
  String get unknownError => '未知错误';

  @override
  String get enterOtpToStartRide => '请输入验证码以开始行程';

  @override
  String get confirmOtpStartRide => '确认验证码并开始行程';

  @override
  String get activeStatus => '在线';

  @override
  String get colorLabel => '颜色：';

  @override
  String get typeLabel => '类型：';

  @override
  String get plateLabel => '车牌：';

  @override
  String get rideStarted => '🚕 行程已开始';

  @override
  String get sourceLabel => '起点：';

  @override
  String get destinationLabel => '终点：';

  @override
  String get fareLabel => '费用：';

  @override
  String get rideCompleted => '行程已完成';

  @override
  String get driverLabel => '司机：';

  @override
  String get vehicleNoLabel => '车牌号：';

  @override
  String get vehicleLabel => '车辆：';

  @override
  String get languageLabel => 'Language: ';

  @override
  String get selectLanguage => '选择语言';

  @override
  String get otpLabel => '验证码：';

  @override
  String get makePayment => '付款';

  @override
  String get waitingForDriver => '正在等待司机接单...';

  @override
  String get cancelRide => '取消行程';

  @override
  String get startTypingHint => '开始输入以查看建议。';

  @override
  String get pickupHint => '上车地点';

  @override
  String get destinationHint => '您要去哪里？';

  @override
  String get carName => '汽车';

  @override
  String get autoName => '三轮车';

  @override
  String get motorcycleName => '摩托车';

  @override
  String get rideCreated => '行程已创建！';

  @override
  String get rideIdLabel => '行程ID：';

  @override
  String get panelHandleTapped => '面板手柄被点击';

  @override
  String get selectVehicle => '请选择一辆车辆';

  @override
  String get errorPrefix => '错误：';

  @override
  String get noSuggestions => '未找到建议。';

  @override
  String get startTyping => '开始输入以查看建议。';
}
