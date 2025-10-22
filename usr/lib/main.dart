import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Workout Generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _generatedWorkout = "Press the button to generate a workout!";

  final List<String> _exercises = [
    'Push-ups',
    'Squats',
    'Pull-ups',
    'Deadlifts',
    'Overhead Press',
    'Rows',
    'Lunges',
    'Plank'
  ];

  final List<String> _variations = [
    'with a pause at the bottom',
    'with explosive movement',
    'with a slow negative',
    'for max reps in 1 minute',
    'with a resistance band',
    'on an unstable surface',
    'with a 1.5 rep scheme',
    'in a superset with another exercise'
  ];

  void _generateWorkout() {
    final random = Random();
    final exercise = _exercises[random.nextInt(_exercises.length)];
    final variation = _variations[random.nextInt(_variations.length)];
    setState(() {
      _generatedWorkout = '$exercise $variation';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Your workout is:',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),
              Text(
                _generatedWorkout,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _generateWorkout,
                child: const Text('Generate Workout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
