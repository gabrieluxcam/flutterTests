import 'package:flutter/material.dart';
import 'webview_page.dart'; // Import the WebViewPage

// Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

// UXCAM
import 'package:flutter_uxcam/flutter_uxcam.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late FirebaseAnalytics analytics;
  late FirebaseAnalyticsObserver observer;

  @override
  void initState() {
    super.initState();
    analytics = FirebaseAnalytics.instance;
    observer = FirebaseAnalyticsObserver(analytics: analytics);
  }

  @override
  Widget build(BuildContext context) {
    FlutterUxcam.optIntoSchematicRecordings();
    FlutterUxConfig config = FlutterUxConfig(
        userAppKey: "djazkur7hg5icjx", enableAutomaticScreenNameTagging: false);
    FlutterUxcam.startWithConfiguration(config);

    return MaterialApp(
      title: 'Flutter Firebase Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorObservers: <NavigatorObserver>[observer],
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        analytics: analytics,
        observer: observer,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.analytics,
    required this.observer,
  });

  final String title;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // Function to send events to Firebase Analytics
  Future<void> _sendTestEvent1() async {
    await widget.analytics.logEvent(
      name: 'test_event_1',
      parameters: {'value': 'test_value_1'},
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Test Event 1 Sent!')),
    );
  }

  Future<void> _sendTestEvent2() async {
    await widget.analytics.logEvent(
      name: 'test_event_2',
      parameters: {'value': 'test_value_2'},
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Test Event 2 Sent!')),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _openWebView() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const WebViewPage(
          url: 'https://developer.uxcam.com/', // Replace with your URL
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendTestEvent1,
              child: const Text('Send Test Event 1'),
            ),
            ElevatedButton(
              onPressed: _sendTestEvent2,
              child: const Text('Send Test Event 2'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _openWebView,
              child: const Text('Open In-App WebView'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
