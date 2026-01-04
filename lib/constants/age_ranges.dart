const List<AgeRangeModel> AGE_RANGES = [
  const AgeRangeModel(
    titleLocaleKey: 'young_adults',
    minAge: 18,
    maxAge: 24,
    stringAge: '18-24',
  ),
  const AgeRangeModel(
    titleLocaleKey: 'adults',
    minAge: 25,
    maxAge: 39,
    stringAge: '25-39',
  ),
  const AgeRangeModel(
    titleLocaleKey: 'middle_aged_adults',
    minAge: 40,
    maxAge: 64,
    stringAge: '40-64',
  ),
  const AgeRangeModel(
    titleLocaleKey: 'other_adults',
    minAge: 65,
    maxAge: 200,
    stringAge: '65+',
  ),
];

class AgeRangeModel {
  const AgeRangeModel({
    required this.titleLocaleKey,
    required this.minAge,
    required this.maxAge,
    required this.stringAge,
  });

  final String titleLocaleKey;
  final int minAge;
  final int maxAge;
  final String stringAge;
}
