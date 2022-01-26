class Token {
  String jwt;

  Token({required this.jwt});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      jwt: "BLOOD " + json['jwt'],
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Token = " + this.jwt;
  }
}
