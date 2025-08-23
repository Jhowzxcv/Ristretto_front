List<String> daysOfWeek=[
  'Domingo',
  'Segunda-Feira',
  'Terca-Feira',
  'Quarta-Feira',
  'Quinta-Feira',
  'Sexta--Feira',
  'Sábado',
];

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

String formatDeadline(DateTime deadline){
  DateTime today=DateTime.now();

  if(today.day==deadline.day)return 'Hoje';
  if(today.add(Duration(days:1)).day==deadline.day)return 'Amanhã';

  int diff=deadline.difference(today).inDays;
  if(diff<=6){
    int offset=today.weekday+diff;
    if(offset>6)return daysOfWeek[offset-6];

    return daysOfWeek[today.weekday];
  }

  if(today.year==deadline.year)return '${deadline.day}/${deadline.month}';

  return '${deadline.day}/${deadline.month}/${deadline.year}';
}
