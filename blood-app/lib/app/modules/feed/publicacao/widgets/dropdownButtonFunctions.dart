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

String getUrgencyLevelIdx(String dropdownUrgencyLevelValue) {
  if (dropdownUrgencyLevelValue == 'Urgente')
    return '1';
  else if (dropdownUrgencyLevelValue == 'Prioridade Média')
    return '2';
  else
    return '3';
}