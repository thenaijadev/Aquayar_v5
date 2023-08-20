class RoutesAndPaths {
  //Base URL
  static const String baseUrl = "https://aquayar.up.railway.app";

//google
  static const String googleAuthSignUp = "/api/auth/sign-up/google/";
  static const String googleAuthSignIn = "/api/auth/sign-in/google/";

//User
  static const String user = "/api/users/me";
  static const String checkOtp = "/api/users/me/check-otp/";
  static const String verifyPhone = "/api/users/me/verify-phone/";
  static const String location = "/api/customers/me/locations";
  static const String getOtp = "/api/users/me/verify-phone";
  static const String userOrders = "/api/users/me/orders";

//auth
  static const String authSignUp = "/api/auth/sign-up/";
  static const String authSignIn = "/api/auth/sign-in/";

  static const String forgotPassword = "/api/auth/forgot-password/";
  static const String verifyOtpToChangePassword = "/api/auth/verify-otp";
  static const String resetPassword = "/api/auth/reset-password/";

//Orders
  static const String orderInit = "/api/orders/drivers";
  static const String getPrice = "/api/orders/price";
  static const String createOrder = "/api/orders";
}
