class RemoteUrls {
  /// Base url for the api
  static const String baseUrl = 'https://probread.neop.co/';

  /// Base url for the images
  static const String imagesUrl = '';

  // shared
  static const String uploadFile = 'upload-file';
  static String deleteFile(String id) => 'delete-file/$id';

  // Registration
  static const String register = 'register';
  static const String phoneRegister = '$register/step1';
  static const String verifyPhone = '$phoneRegister/verify-otp';
  static const String setPassword = '$register/step2';
  static const String currentUser = 'get-auth-user';

  // login
  static const String login = 'login';
  static const String loginCredentials = '$login/normal';
  static const String loginBiometrics = '$login/biometric';
  static const String logout = 'logout';

  // forget password
  static const String forgetPassword = 'forgot-password';
  static const String forgetPasswordSendOtp = '$forgetPassword/send-otp';
  static const String forgetPasswordVerify = '$forgetPassword/verify-otp';
  static const String forgetPasswordSetPassword = '$forgetPassword/reset';

  // personal info
  static const String completeData = 'complete-data';
  static const String enterEmail = '$completeData//enter-email';
  static const String verifyEmail = '$completeData/verify-email';
  static const String enterPersonalInfo = '$completeData/enter-personal-info';
  static const String confirmFiles = '$completeData/confirm-files';
  static const String loadData = '$completeData/load-required-data';
  static String cities(String countryId) => 'countries/$countryId/cities';

  // training
  static const String training = 'trainings';
  static String startTraining(String trainingId) => '$training/$trainingId/start';

  // lessons
  static const String lessons = 'lessons';
  static String lessonDetails(String lessonId) => '$lessons/$lessonId';

  // contracts
  static const String contracts = 'contracts';
  static String contractDetails(String contractId) => '$contracts/$contractId';
  static String respondToContract(String contractId) => '$contracts/$contractId/approve';

  // home
  static const String home = 'home';

  // check in
  static String checkIn(guardContractId) => 'contracts/guard/$guardContractId/check-in';
  static String nextActiveContract = 'contracts/guard/next';

  // tickets
  static const String tickets = 'tickets';
  static const String ticketsDropdowns = '$tickets/load-required-data';
  static String ticketsDetails(String ticketId) => '$tickets/$ticketId';
  static String sendTicketMessage(String ticketId) => '$tickets/$ticketId/send-message';

  // settings
  static const String deleteAccount = 'profile/delete';
}

class ParamsKeys {
  static const String phone = 'phone';
  static const String phoneCode = 'phone_code';
}
