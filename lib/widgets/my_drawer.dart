import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class MyBrawer extends StatelessWidget {
  const MyBrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: CupertinoSwitch(
        value: Provider.of<ThemeProvider>(context).isDrarkMode,
        onChanged: (value) {
          Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
        },
      ),
    );
  }
}
