import 'package:flutter/material.dart';
import 'package:myapp/database/database.dart';
import 'package:myapp/provider/theme_provider.dart';
import 'package:myapp/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Database.initialize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Database()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const HabitTracker(),
    ),
  );
}

class HabitTracker extends StatelessWidget {
  const HabitTracker({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: HomePage(),
    );
  }
}
