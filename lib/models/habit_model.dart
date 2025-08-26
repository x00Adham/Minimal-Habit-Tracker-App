import 'package:isar/isar.dart';

part 'habit_model.g.dart';

@Collection()
class HabitModel {
  //id
  Id id = Isar.autoIncrement;

  // name of the habit
  late String name;

  //completed days

  List<DateTime> completedDays = [
    //DateTime(yeas,mothw)
  ];
}
