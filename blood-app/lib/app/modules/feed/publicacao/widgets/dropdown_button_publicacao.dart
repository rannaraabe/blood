import 'package:blood_app/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

String getDonationCenterIdx(String dropdownDonationCenterValue) {
  if (dropdownDonationCenterValue == 'Hemonorte')
    return '1';
  else if (dropdownDonationCenterValue == 'Hemovida')
    return '2';
  else
    return '3';
}

String getBloodTypeIdx(String dropdownBloodTypeValue) {
  if (dropdownBloodTypeValue == 'A+')
    return '1';
  else if (dropdownBloodTypeValue == 'B+')
    return '2';
  else if (dropdownBloodTypeValue == 'AB+')
    return '3';
  else if (dropdownBloodTypeValue == 'O+')
    return '4';
  else if (dropdownBloodTypeValue == 'A-')
    return '5';
  else if (dropdownBloodTypeValue == 'B-')
    return '6';
  else
    return '7';
}

String getBloodType(String dropdownBloodTypeValue) {
  if (dropdownBloodTypeValue == '1')
    return 'A+';
  else if (dropdownBloodTypeValue == '2')
    return 'B+';
  else if (dropdownBloodTypeValue == '3')
    return 'AB+';
  else if (dropdownBloodTypeValue == '4')
    return 'O+';
  else if (dropdownBloodTypeValue == '5')
    return 'A-';
  else if (dropdownBloodTypeValue == '6')
    return 'B-';
  else
    return 'O-';
}

String getUrgencyLevelIdx(String dropdownUrgencyLevelValue) {
  if (dropdownUrgencyLevelValue == 'Urgente')
    return '1';
  else if (dropdownUrgencyLevelValue == 'Prioridade Média')
    return '2';
  else
    return '3';
}

String getUrgencyLevel(String dropdownUrgencyLevelValue) {
  if (dropdownUrgencyLevelValue == '1')
    return 'Urgente';
  else if (dropdownUrgencyLevelValue == '2')
    return 'Prioridade Média';
  else
    return 'Sem Prioridade';
}

class DropdownButtonPublicacao extends StatefulWidget {
  DropdownButtonPublicacao({
    Key? key,
    required this.dropdownValue,
    required this.padding,
    required this.dropdownMenuItems,
    required this.width,
    required this.height,
  }) : super(key: key);

  String dropdownValue;
  final EdgeInsets padding;
  final List<String> dropdownMenuItems;
  final double width;
  final double height;

  @override
  State<DropdownButtonPublicacao> createState() =>
      _DropdownButtonPublicacaoState();
}

class _DropdownButtonPublicacaoState extends State<DropdownButtonPublicacao> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height * 0.06,
      width: widget.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50)),
        border: Border.all(color: Colors.black26),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 7.0,
            offset: Offset(2.0, 3.0),
          ),
        ],
      ),
      child: DropdownButton<String>(
        value: widget.dropdownValue,
        icon: Padding(
          padding: widget.padding,
          child: Icon(
            IconData(0xf82b, fontFamily: 'MaterialIcons'),
            color: AppTheme.grey,
            size: widget.width * 0.1,
          ),
        ),
        style: const TextStyle(color: Colors.black26),
        borderRadius: BorderRadius.all(Radius.circular(30)),
        underline: SizedBox(),
        onChanged: (String? newValue) {
          setState(() {
            widget.dropdownValue = newValue!;
          });
        },
        items: widget.dropdownMenuItems
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(value),
            ),
          );
        }).toList(),
      ),
    );
  }
}
