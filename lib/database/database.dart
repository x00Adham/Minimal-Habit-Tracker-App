import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:myapp/models/appsetting_mode.dart';
import 'package:myapp/models/habit_model.dart';
import 'package:path_provider/path_provider.dart';

class Database extends ChangeNotifier {
  static late Isar isar;

  //intilize the database
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([
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
      await isar.writeTxn(() async {
        final today = DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
        );

        if (isCompleted) {
          // Add today to the completed days if not already present
          if (!habit.completedDays.contains(today)) {
            habit.completedDays.add(today);
          }
        } else {
          // Remove today from the completed days
          habit.completedDays.removeWhere(
            (date) =>
                date.year == today.year &&
                date.month == today.month &&
                date.day == today.day,
          );
        }

        // Save the updated habit to the database
        await isar.habitModels.put(habit);
      });
    }

    await readAllHabits();
  }

  //UPDATE =>  update the habit name
  Future<void> updateHabitName(Id id, String newName) async {
    //get the habit
    final habit = await isar.habitModels.get(id);
    if (habit != null) {
      // update name
      habit.name = newName;
      //save to the database
      await isar.writeTxn(() => isar.habitModels.put(habit));
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
