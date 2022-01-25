class BackendRoutes {
  BackendRoutes._();

  static const String BACKEND_DOMAIN = "https://blood-backend2.herokuapp.com";

  static const String LOGIN = BACKEND_DOMAIN + "/autenticacao";

  static const String USER = BACKEND_DOMAIN + "/usuario";
  
  static const String USER_BYUSERNAME = USER + "/byusername?username=";

  static const String DONATION_UNIT = BACKEND_DOMAIN + "/unidadedoacao";

  static const String PUBLICATION = BACKEND_DOMAIN + "/publicacao";
}
