import 'package:myapp/models/habit_model.dart';

Map<DateTime, int> perpDataSets(List<HabitModel> habits) {
  final Map<DateTime, int> dataset = {};
  for (var habitModel in habits) {
    for (var date in habitModel.completedDays) {
      final normlizedDate = DateTime(date.year, date.month, date.day);
      if (dataset.containsKey(normlizedDate)) {
        dataset[normlizedDate] = dataset[normlizedDate]! + 1;
      } else {
        dataset[normlizedDate] = 1;
      }
      
    }
  }
  return dataset;
}
