import 'package:blood_app/app/modules/conteudo/widgets/info_card1_conteudo.dart';
import 'package:blood_app/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConteudoImpedimentosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(32),
          child: ListView(
            children: <Widget>[
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 0, 10),
                        child: GestureDetector(
                          onTap: () {
                            Modular.to
                                .popUntil(ModalRoute.withName('/conteudo'));
                          },
                          child: Icon(Icons.arrow_back_ios),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text(
                      'Impedimentos',
                      style: AppTheme.bold_title,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                    child: Text(
                      'Confira os casos temporários:',
                      style: AppTheme.bold_regular,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Text(
                    '• Doadores com resfriado devem aguardar 7 dias após desaparecimento dos sintomas.',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '• Pessoas grávidas não podem doar sangue.',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '• Puérperas com 90 dias após parto normal e 180 dias após cesariana.',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '• Pessoa que amamenta (se o parto ocorreu há menos de 12 meses).',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '• Ingestão de bebida alcoólica nas 12 horas que antecedem a doação.',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '• Tatuagem, maquiagem definitiva e micropigmentação (sobrancelhas, lábios, etc.) nos últimos 12 meses; se houver condição de avaliação da segurança do procedimento realizado, o prazo é 6 meses.',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '•  Situações nas quais há maior risco de adquirir doenças sexualmente transmissíveis: aguardar 12 meses.',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '• Qualquer procedimento endoscópico (endoscopia digestiva alta, colonoscopia, rinoscopia, etc.): aguardar 6 meses.',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '• Extração dentária (verificar uso de medicação) ou tratamento de canal (verificar medicação): por 7 dias.',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '• Cirurgia odontológica com anestesia geral: por 4 semanas.',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '• Acupuntura: se realizada com material descartável: 24 horas; se realizada com laser ou sementes: apto; se realizada com material sem condições de avaliação: aguardar 12 meses.',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '• Doadores que tomaram vacina contra gripe: por 48 horas.',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '• Herpes labial ou genital: apto após desaparecimento total das lesões.',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '• Herpes Zoster: apto após 6 meses da cura (vírus Varicella Zoster).',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '• Brasil: estados como Acre, Amapá, Amazonas, Rondônia, Roraima, Maranhão, Mato Grosso, Pará e Tocantins são locais onde há alta prevalência de malária. Quem esteve nesses estados deve aguardar 12 meses para doar, após o retorno.',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '• EUA: quem esteve nesse país deve aguardar 30 dias para doar, após o retorno.',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '• Malária: quem esteve em países com alta prevalência de malária deve aguardar 12 meses após o retorno para doar. (critério semelhante ao dos estados brasileiros com prevalência elevada de malária).',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '• Febre Amarela: quem esteve em região onde há surto da doença deve aguardar 30 dias para doar, após o retorno; se tomou a vacina, deve aguardar 04 semanas; se contraiu a doença, deve aguardar 6 meses após recuperação completa (clínica e laboratorial).',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '• Coronavírus: Candidatos que apresentaram diagnóstico ou suspeita de coronavírus estão aptos a doar 10 dias após a completa recuperação; Candidatos assintomáticos com teste positivo estão aptos a doar após 10 dias da data de realização do teste; Candidatos que tiveram contato com casos positivos de contaminação por coronavírus estão aptos a doar após 7 dias do último contato; Candidatos que fizeram isolamento voluntário ou por orientação médica estão aptos a doar após o término do tempo de indicação de isolamento; Profissionais de saúde estão aptos a doar, desde que estejam fazendo uso correto de EPI; Candidatos que foram vacinados contra Covid-19 só podem doar:',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '- 48 horas após cada dose (vacina Coronavac, da Sinovac/Butantan);',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '- 7 dias após cada dose (vacina da Oxford/AstraZeneca/Fiocruz);',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '- 7 dias após cada dose (vacina da Pfizer/BioNtec/Fosun Pharma); ',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '- 7 dias após cada dose (vacina da Janssen-Cilag);',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '- 7 dias após cada dose (vacina Sputinik V, da Gamaleya National Center);',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '- 48 horas após cada dose (vacina Covaxin, da Bharat Biotech); e',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '- 7 dias após cada dose (vacina da Moderna/Instituto Nacional de Alergia e Doenças Infecciosas).',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: height * 0.035,
                  ),
                  Image.asset(
                    'assets/images/blood_drop.png',
                    width: 50,
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                    child: Text(
                      'Confira os casos definitivos:',
                      style: AppTheme.bold_regular,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Text(
                    '• Hepatite após os 11 anos de idade.',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '• Evidência clínica ou laboratorial das seguintes doenças infecciosas transmissíveis pelo sangue: Hepatites B e C, AIDS (vírus HIV), doenças associadas aos vírus HTLV I e II e Doença de Chagas.',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '• Doadores que fazem uso de drogas ilícitas injetáveis.',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '• Doadores com Malária e/ou Mal de Parkinson.',
                    style: AppTheme.medium_regular,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
