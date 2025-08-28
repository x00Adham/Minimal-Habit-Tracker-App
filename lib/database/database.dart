import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:myapp/models/appsetting_mode.dart';
import 'package:myapp/models/habit_model.dart';
import 'package:path_provider/path_provider.dart';

class Database extends ChangeNotifier {
  late Isar isar;

  //intilize the database
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    await Isar.open([
      AppsettingsSchema,
      HabitModelSchema,
    ], directory: dir.path);
  }

  //save firstday launch
  Future<void> saveFirstDay() async {
    //query all the collection of the appsettings and find the frist day 
    final extistingSetting = await isar.appsettings.where().findFirst();

    //if not exist add the time now to  the collection
    if (extistingSetting == null) {
      //set the first launch time to model
      final setting = Appsettings()..firstlaunch = DateTime.now();
      //save to the database
      await isar.writeTxn(() => isar.appsettings.put(setting));
    }
  }

  //get the frist day launch
  Future<DateTime?> getFirstDay() async {
    final settings = await isar.appsettings.where().findFirst();
    return settings?.firstlaunch;
  }

  //list of habits
  List<HabitModel> currentHabits = [];

  //CREATE => create a new habit

  Future<void> createNewhabit(String habitName) {
    //create a habit
    final newhabit = HabitModel()..name = habitName;

    //save the habit
    return isar.writeTxn(() => isar.habitModels.put(newhabit));
  }

  //READ => read the all happits

  Future<void> readAllHabits() async {
    //fetch all the habits
    List<HabitModel> fetchedHabits = await isar.habitModels.where().findAll();

    //give it to the current habit
    currentHabits.clear();
    currentHabits.addAll(fetchedHabits);

    //UPDATE UI
    notifyListeners();
  }

  //UPDATE => Toggle the habit
  Future<void> updateHabitCompleted(Id id, bool isCompleted) async {
    //get the habit
    final habit = await isar.habitModels.get(id);

    //update completion status
    if (habit != null) {
      isar.writeTxn(() async {
        //
        if (isCompleted && !habit.completedDays.contains(DateTime.now())) {
          //add today to the completed days
          final today = DateTime.now();

          habit.completedDays.add(DateTime(today.year, today.month, today.day));
          //if the habit is not completed
        } else {
          //remove today from the completed days
          habit.completedDays.removeWhere(
            (date) =>
                date.year == DateTime.now().year &&
                date.month == DateTime.now().month &&
                date.day == DateTime.now().day,
          );

          //save in the DB that is not completed
          isar.habitModels.put(habit);
        }
      });
    }

    readAllHabits();
  }

  //UPDATE =>  update the habit name
  Future<void> updateHabitName(Id id, String newName) async {
    //get the habit
    final habit = await isar.habitModels.get(id);
    if (habit != null) {
      // update name
      habit.name = newName;
      //savve to the database
      await isar.habitModels.put(habit);
    }
    readAllHabits();
  }

  //DELETE => habit

  Future<void> deleteHabit(Id id) async {
    //delete the habit
    await isar.writeTxn(() => isar.habitModels.delete(id));
    readAllHabits();
  } 
}
