import 'package:flutter/material.dart';
import 'package:dp_stopwatch/dp_stopwatch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'example',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Stop Watch'),
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
  final stopwatchViewModel = DPStopwatchViewModel(
    clockTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 32,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(212, 255, 255, 255),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'The Clock',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            DPStopWatchWidget(
              stopwatchViewModel,
            ),
            const SizedBox(height: 16),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                stopwatchViewModel.start?.call();
              },
              child: const Text('START'),
            ),
            const SizedBox(height: 16),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                stopwatchViewModel.pause?.call();
              },
              child: const Text('STOP'),
            ),
            const SizedBox(height: 16),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                stopwatchViewModel.resume?.call();
              },
              child: const Text('weiter'),
            ),
            const SizedBox(height: 16),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                stopwatchViewModel.stop?.call();
              },
              child: const Text('zurücksetzen'),
            ),
          ],
        ),
      ),
    );
  }
}
