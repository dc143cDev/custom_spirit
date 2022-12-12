class API {
  //호스트 접속 주소. 추후에 배포시 배포 서버 ip로 변경.
  // static const hostConnect = "http://172.30.1.27/api_new_users";

  static const hostConnect = "http://192.168.0.150/api_new_users";

  static const hostConnectUser = "$hostConnect/user";

  static const login = "$hostConnect/user/login.php";
  static const signup = "$hostConnect/user/signup.php";
  static const validateEmail = "$hostConnect/user/validate_email.php";

  static const getProduct = "$hostConnect/user/";
}
