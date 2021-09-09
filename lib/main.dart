import 'package:base_app_with_dark_theme/app_state.dart';
import 'package:base_app_with_dark_theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<AppState>(
      child: MyApp(),
      create: (context) => AppState(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: TaskPage(),
        );
      },
    );
  }
}

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(16),
          child: Icon(
            Icons.menu,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 32,
              top: 32,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Icon(Icons.add_circle_outline)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
            ),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: ListTile(
                leading: Icon(
                  Icons.call,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: Text(
                  'Confrence Call',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                subtitle: Text(
                  '30 Mins',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                trailing: Icon(
                  Icons.check_circle,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  'Dark Mode',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Spacer(),
                Switch(
                  value: Provider.of<AppState>(context).isDarkMode,
                  onChanged: (value) {
                    Provider.of<AppState>(context, listen: false)
                        .updateTheme(value);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
