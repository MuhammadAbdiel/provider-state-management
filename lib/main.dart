import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'application_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApplicationColor>(
      create: (context) => ApplicationColor(),
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<ApplicationColor>(
            builder: (context, applicationColor, _) => Text(
              'Provider State Management',
              style: TextStyle(
                color: applicationColor.color,
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<ApplicationColor>(
                builder: (context, applicationColor, _) => AnimatedContainer(
                  width: 100,
                  height: 100,
                  color: applicationColor.color,
                  duration: const Duration(milliseconds: 500),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('AB'),
                  Consumer<ApplicationColor>(
                    builder: (context, applicationColor, _) => Switch(
                      value: applicationColor.isBlack,
                      onChanged: (value) {
                        applicationColor.isBlack = value;
                      },
                    ),
                  ),
                  const Text('BK'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
