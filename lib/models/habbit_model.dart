import 'package:isar/isar.dart';


part 'habbit_model.g.dart';
@Collection()
class HabbitModel {
  //id
  Id id = Isar.autoIncrement;
  
  // name of the habit
  final String name;
  
  //completed days

  List<DateTime> completedDays = [

    //DateTime(yeas,mothw)
  ];


  HabbitModel({required this.name});

}
