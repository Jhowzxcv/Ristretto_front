List<String> daysOfWeek=[
  'Domingo',
  'Segunda-Feira',
  'Terca-Feira',
  'Quarta-Feira',
  'Quinta-Feira',
  'Sexta-Feira',
  'Sábado',
];

String formatDeadline(DateTime today,DateTime deadline){
  // Verify close deadline
  if(today.day==deadline.day)return 'Hoje';
  if(today.add(Duration(days:1)).day==deadline.day)return 'Amanhã';

  // Verify deadline within a week and
  // return corresponding day of the week
  int diff=deadline.difference(today).inDays;
  if(diff<=6){
    int offset=today.weekday+diff;
    if(offset>6)return daysOfWeek[offset-6];

    return daysOfWeek[today.weekday];
  }

  // Format for too far deadline
  if(today.year==deadline.year)return '${deadline.day}/${deadline.month}';

  return '${deadline.day}/${deadline.month}/${deadline.year}';
}

List<String> months=[
  'Janeiro',
  'Fevereiro',
  'Março',
  'Abril',
  'Maio',
  'Junho',
  'Julho',
  'Agosto',
  'Setembro',
  'Outubro',
  'Novembro',
  'Dezembro',
];

String getCurrentMonth(DateTime today)=>months[today.month-1];

String formatDay(DateTime today,DateTime targetDay){
  // Verify close deadline
  if(today.add(Duration(days:-1)).day==targetDay.day)return 'Ontem';
  if(today.day==targetDay.day)return 'Hoje';
  if(today.add(Duration(days:1)).day==targetDay.day)return 'Amanhã';

  // Verify deadline within a week and
  // return corresponding day of the week
  int diff=targetDay.difference(today).inDays;
  if(diff<=6){
    int offset=today.weekday+diff;
    if(offset>6)return daysOfWeek[offset-6];

    return daysOfWeek[today.weekday];
  }

  // Format for too far deadline
  if(today.year==targetDay.year)return '${targetDay.day}/${targetDay.month}';

  return '${targetDay.day}/${targetDay.month}/${targetDay.year}';
}
