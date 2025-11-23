class DayModel{
  final String day;
  final int date;

  DayModel({required this.day,required this.date});

  String get banglaDate => convertToBanglaNumber(date);

}

String convertToBanglaNumber(int number) {

  const english = ['0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15'];
  const bangla = ['০','১','২','৩','৪','৫','৬','৭','৮','৯','১০','১১','১২','১৩','১৪','১৫'];

  String numberString = number.toString();
  for(int i=0 ;i<english.length ;i++){
    numberString = numberString.replaceAll(english[i], bangla[i]);
  }
  return numberString;
}