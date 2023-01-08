String prefix = "customer-api";
class Domain {
  static String devDomain = 'vnpass.emddi.xyz';
}

class Endpoints {
  static String login = prefix + '/auth/sign-in';
  static String signUp = prefix + '/auth/sign-up';
  static String activate = prefix + '/auth/activate';
  static String resendOtp = prefix + '/auth/activate/resend-otp';
  static String changePassword = prefix + '/auth/password';
}