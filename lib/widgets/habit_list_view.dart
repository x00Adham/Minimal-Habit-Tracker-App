import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myapp/database/database.dart';
import 'package:myapp/models/habit_model.dart';
import 'package:provider/provider.dart';

class HabitListView extends StatelessWidget {
  const HabitListView({super.key, required this.onEdit, required this.onDelete});
  final Function(HabitModel) onEdit;
  final Function(HabitModel) onDelete;

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);

    final List<HabitModel> currentHabits = database.currentHabits;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: currentHabits.length,
      itemBuilder: (context, index) {
        final habit = currentHabits[index];
        var isCompleted = isCompletedToday(habit.completedDays);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Slidable(
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  label: "Delete",
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  onPressed: (context) {
                    onDelete(habit);
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                ),
                SlidableAction(
                  label: "Edit",
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  onPressed: (context) {
                    onEdit(habit);
                  },
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                ),
              ],
            ),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: isCompleted
                    ? Colors.green
                    : Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: ListTile(
                  onTap: () async {
                    await database.updateHabitCompleted(habit.id, !isCompleted);
                  },
                  title: Text(
                    habit.name,
                    style: TextStyle(
                      fontSize: 20,
                      color: isCompleted
                          ? Colors.white
                          : Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  trailing: Checkbox(
                    value: isCompleted,
                    onChanged: (value) {
                      if (value != null) {
                        database.updateHabitCompleted(habit.id, value);
                      }
                    },
                    activeColor: Colors.green,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

bool isCompletedToday(List<DateTime> completedDays) {
  final today = DateTime.now();
  return completedDays.any(
    (date) =>
        date.day == today.day &&
        date.month == today.month &&
        date.year == today.year,
  );
}
