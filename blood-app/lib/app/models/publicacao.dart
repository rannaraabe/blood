class Publicacao {
  int id;
  int unidadeDoacao;
  int usuario;
  String nomeDonatario;
  int imageCode;
  int doador;
  String idadeDonatario;
  String dataCriacao;
  int prioridade;
  int tipoSanguineo;

  Publicacao(
      {required this.id,
      required this.unidadeDoacao,
      required this.usuario,
      required this.nomeDonatario,
      required this.imageCode,
      required this.doador,
      required this.idadeDonatario,
      required this.dataCriacao,
      required this.prioridade,
      required this.tipoSanguineo});

  factory Publicacao.fromJson(Map<String, dynamic> json) {
    return Publicacao(
        id: json['id'],
        unidadeDoacao: json['unidadeDoacao'],
        usuario: json['usuario'],
        nomeDonatario: json['nomeDonatario'],
        imageCode: json['imageCode'],
        doador: json['doador'],
        idadeDonatario: json['idadeDonatario'],
        dataCriacao: json['dataCriacao'],
        prioridade: json['prioridade'],
        tipoSanguineo: json['tipoSanguineo']);
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Donatario = " + this.nomeDonatario;
  }
}
