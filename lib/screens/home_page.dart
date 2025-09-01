import 'package:flutter/material.dart';
import 'package:myapp/database/database.dart';
import 'package:myapp/models/habit_model.dart';
import 'package:myapp/widgets/habit_list_view.dart';
import 'package:myapp/widgets/my_drawer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _habitNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<Database>(context, listen: false).readAllHabits();
  }

  //add habit
  void _addHabit(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Add Habit"),
        content: TextField(
          controller: _habitNameController,
          decoration: InputDecoration(hintText: "Enter the habit name"),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (_habitNameController.text.trim().isNotEmpty) {
                //add the habit
                Provider.of<Database>(
                  context,
                  listen: false,
                ).createNewhabit(_habitNameController.text.trim());
                //close the dialog
                Navigator.pop(context);
                //clear the controller
                _habitNameController.clear();
              } else {
                //show a snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Please enter a valid habit name")),
                );
              }
            },
            child: Text(
              "Add",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //edit habit
  void _editHabit(HabitModel habit) {
    _habitNameController.text = habit.name;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Habit"),
        content: TextField(
          controller: _habitNameController,
          decoration: InputDecoration(hintText: "Enter the habit name"),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (_habitNameController.text.isNotEmpty) {
                Provider.of<Database>(
                  context,
                  listen: false,
                ).updateHabitName(habit.id, _habitNameController.text);
                Navigator.pop(context);
                _habitNameController.clear();
              }
            },
            child: Text(
              "Save",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //delete habit
  void _deleteHabit(HabitModel habit) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Delete Habit"),
        content: Text("Are you sure you want to delete this habit?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Provider.of<Database>(
                context,
                listen: false,
              ).deleteHabit(habit.id);
              Navigator.pop(context);
              _habitNameController.clear();
            },
            child: Text(
              "Delete",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      drawer: MyBrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addHabit(context);
        },
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
          size: 30,
        ),
      ),
      body: HabitListView(onEdit: _editHabit, onDelete: _deleteHabit),
    );
  }
}
