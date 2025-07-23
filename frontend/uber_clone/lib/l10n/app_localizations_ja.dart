// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'レイヴライド';

  @override
  String get welcomeMessage => '🚗 あなたの乗り方、あなたのスタイルで！✨\n新しいレイヴライド体験へようこそ！🎉';

  @override
  String get continueText => '続ける';

  @override
  String get enterYour => '入力してください';

  @override
  String get nameString => '名前';

  @override
  String get firstName => '名';

  @override
  String get lastName => '姓';

  @override
  String get emailString => 'メールアドレス';

  @override
  String get phoneString => '電話番号';

  @override
  String get passwordString => 'パスワード';

  @override
  String get confirmPasswordString => 'パスワードを確認';

  @override
  String get createAccountString => 'アカウントを作成';

  @override
  String get signupMessage => '👋 こんにちは、美しい人 — 誰か他の人が乗る前にアカウントを作成しよう 😏🚗';

  @override
  String get accountCreationLogic => 'アカウント作成のロジックはこちらです！';

  @override
  String get loginString => 'ログイン';

  @override
  String get loginMessage => 'おかえりなさい！続けるにはログインしてください。';

  @override
  String get loginLogic => 'ログインロジックはこちら！';

  @override
  String get welcomePassenger => '乗客の皆様、ログインして続行してください。';

  @override
  String get welcomeCaptain => 'キャプテンの皆様、ログインして続行してください。';

  @override
  String get updateInfo => '情報を更新';

  @override
  String get update => '更新';

  @override
  String get updateProfile => 'プロフィールを更新';

  @override
  String get updateProfileMessage => '以下の情報を更新してください。';

  @override
  String get userInfoUpdated => 'ユーザー情報が更新されました！';

  @override
  String get profileUpdated => 'プロフィールが更新されました！';

  @override
  String get logout => 'ログアウト';

  @override
  String get firstNameRequired => '名は必須です';

  @override
  String get firstNameMin => '名は2文字以上である必要があります';

  @override
  String get lastNameRequired => '姓は必須です';

  @override
  String get lastNameMin => '姓は2文字以上である必要があります';

  @override
  String get emailRequired => 'メールアドレスは必須です';

  @override
  String get emailInvalid => '有効なメールアドレスを入力してください';

  @override
  String get passwordRequired => 'パスワードは必須です';

  @override
  String get passwordMin => 'パスワードは6文字以上である必要があります';

  @override
  String get confirmPasswordRequired => 'パスワードの確認が必要です';

  @override
  String get passwordsDoNotMatch => 'パスワードが一致しません';

  @override
  String get vehicleCapacityInvalid => '無効な車両容量';

  @override
  String get homeRouteName => 'ホーム画面';

  @override
  String get userHomeRouteName => 'ユーザーホーム';

  @override
  String get captainHomeRouteName => 'キャプテンホーム';

  @override
  String get loginRouteName => 'ログイン画面';

  @override
  String get signupRouteName => 'サインアップ画面';

  @override
  String get updateUserRouteName => 'ユーザー更新画面';

  @override
  String get captainSignupRouteName => 'キャプテンサインアップ';

  @override
  String get landingRouteName => 'ランディング画面';

  @override
  String get appStartRouteName => 'アプリ開始画面';

  @override
  String get dontHaveAccount => 'アカウントをお持ちでないですか？ ';

  @override
  String get captainSignupMessage => 'キャプテンとして登録して、車両情報を追加しましょう！';

  @override
  String get vehicleDetails => '車両の詳細';

  @override
  String get vehicleColor => '色';

  @override
  String get vehicleColorRequired => '色は必須です';

  @override
  String get vehiclePlate => 'ナンバープレート';

  @override
  String get vehiclePlateRequired => 'プレートは必須です';

  @override
  String get vehicleCapacity => '定員';

  @override
  String get vehicleCapacityRequired => '定員は必須です';

  @override
  String get vehicleType => '車種';

  @override
  String get vehicleTypeRequired => '車種は必須です';

  @override
  String get captainSignupLogic => 'キャプテンサインアップのロジックはこちらです！';

  @override
  String get createCaptainAccountString => 'キャプテンアカウントを作成';

  @override
  String get carSubtitle => '毎日の移動に適したお手頃な車';

  @override
  String get taxiSubtitle => '市内移動に便利なクラシックタクシー';

  @override
  String get motoSubtitle => '短距離に適したお手頃なバイク';

  @override
  String get carType => '車';

  @override
  String get autoType => 'オート';

  @override
  String get motorcycleType => 'バイク';

  @override
  String get failedToEndRide => 'ライドの終了に失敗しました: ';

  @override
  String get unknownError => '不明なエラー';

  @override
  String get enterOtpToStartRide => 'ライドを開始するにはOTPを入力してください';

  @override
  String get confirmOtpStartRide => 'OTPを確認してライドを開始';

  @override
  String get activeStatus => 'アクティブ';

  @override
  String get colorLabel => '色: ';

  @override
  String get typeLabel => 'タイプ: ';

  @override
  String get plateLabel => 'プレート: ';

  @override
  String get rideStarted => '🚕 ライド開始';

  @override
  String get sourceLabel => '出発地:';

  @override
  String get destinationLabel => '目的地:';

  @override
  String get fareLabel => '料金: ';

  @override
  String get rideCompleted => 'ライド完了';

  @override
  String get driverLabel => 'ドライバー: ';

  @override
  String get vehicleNoLabel => '車両番号: ';

  @override
  String get vehicleLabel => '車両: ';

  @override
  String get languageLabel => 'Language: ';

  @override
  String get selectLanguage => '言語を選択';

  @override
  String get otpLabel => 'OTP: ';

  @override
  String get makePayment => '支払いをする';

  @override
  String get waitingForDriver => 'ドライバーを待機中...';

  @override
  String get cancelRide => 'ライドをキャンセル';

  @override
  String get startTypingHint => '入力を開始すると候補が表示されます。';

  @override
  String get pickupHint => '乗車場所';

  @override
  String get destinationHint => 'どこに行きますか？';

  @override
  String get carName => '車';

  @override
  String get autoName => 'オート';

  @override
  String get motorcycleName => 'バイク';

  @override
  String get rideCreated => 'ライドが作成されました！';

  @override
  String get rideIdLabel => 'ライドID: ';

  @override
  String get panelHandleTapped => 'パネルハンドルがタップされました';

  @override
  String get selectVehicle => '車両を選択してください';

  @override
  String get errorPrefix => 'エラー: ';

  @override
  String get noSuggestions => '提案が見つかりませんでした。';

  @override
  String get startTyping => '提案を見るには入力を開始してください。';
}
