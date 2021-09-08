import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: TaskPage(),
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
                  style: TextStyle(
                    fontSize: 48,
                  ),
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
                leading: Icon(Icons.call),
                title: Text('Confrence Call'),
                subtitle: Text('30 Mins'),
                trailing: Icon(Icons.check_circle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
