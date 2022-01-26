class Usuario {
  int id;
  String nome;
  String username;
  String password;
  int tipoSanguineo;
  String email;
  String dataNascimento;

  Usuario(
      {required this.id,
      required this.nome,
      required this.username,
      required this.password,
      required this.tipoSanguineo,
      required this.email,
      required this.dataNascimento});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
        id: json['id'],
        nome: json['nome'],
        username: json['username'],
        password: json['password'],
        tipoSanguineo: json['tipoSanguineo'],
        email: json['email'],
        dataNascimento: json['dataNascimento']);
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Nome = " + this.nome;
  }
}
