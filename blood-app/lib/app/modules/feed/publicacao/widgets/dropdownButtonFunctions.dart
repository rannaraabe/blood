String getDonationCenterIdx(String dropdownDonationCenterValue) {
  if (dropdownDonationCenterValue == 'Hemonorte')
    return '1';
  else
    return '2';
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
