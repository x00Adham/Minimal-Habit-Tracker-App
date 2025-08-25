import 'package:isar/isar.dart';

part 'appsetting_mode.g.dart';

@collection
class Appsettings {
  Id id = Isar.autoIncrement;
  DateTime? firstlaunch;
}
