class ApiEndPoint {
  static final String baseurl = 'server.pepethesol.com/api';

  static _AuthEndpoints authEndpoints = _AuthEndpoints();
}

class _AuthEndpoints {
  final String registermail = 'authaccount/registration';
  final String loginmail = 'authaccount/login';
}
