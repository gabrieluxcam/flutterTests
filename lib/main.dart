import 'package:flutter/material.dart';
import 'webview_page.dart'; // Import the WebViewPage
import 'blank_page.dart'; // Import the BlankPage
import 'new_screen.dart'; // Import the NewScreen
import 'dart:developer';

// Firebase
// import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

// UXCAM
import 'package:flutter_uxcam/flutter_uxcam.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // try {
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  // } catch (e) {
  //   print('Firebase initialization failed: \$e');
  // }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _initializeUxCam(); // Call the asynchronous method
  }

  Future<void> _initializeUxCam() async {
    // Initialize UXCam
    FlutterUxcam.optIntoSchematicRecordings();
    FlutterUxConfig config = FlutterUxConfig(
        userAppKey: "djazkur7hg5icjx", enableAutomaticScreenNameTagging: false);

    try {
      bool isStarted = await FlutterUxcam.startWithConfiguration(config);
      if (isStarted) {
        String? sessionUrl = await FlutterUxcam.urlForCurrentSession();
        if (sessionUrl != null) {
          FlutterUxcam.logEventWithProperties(
              "sessionURL", {"URL": sessionUrl});
          debugPrint("Session URL: $sessionUrl");
        } else {
          FlutterUxcam.logEvent("Session URL could not be retrieved");
          debugPrint("Session URL could not be retrieved");
        }
      } else {
        debugPrint("UXCam initialization failed");
      }
    } catch (e) {
      debugPrint("Error initializing UXCam: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'Flutter Demo Home Page',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    //required this.analytics,
    //required this.observer,
  });

  final String title;
  // final FirebaseAnalytics analytics;
  // final FirebaseAnalyticsObserver observer;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _openWebView() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewPage(
          url: 'https://developer.uxcam.com/', // Replace with your URL
        ),
      ),
    );
  }

  void _openBlankPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BlankPage(),
      ),
    );
  }

  void _openNewScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NewScreen(),
      ),
    );
  }

  // Sample functions for the Test buttons
  void _handleTest1() {
    print('Test 1 button clicked');
  }

  void _handleTest2() {
    print('Test 2 button clicked');
  }

  void _handleTest3() {
    print('Test 3 button clicked');
  }

  void _handleTest4() {
    print('Test 4 button clicked');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
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
                onPressed: _openWebView,
                child: const Text('Open In-App WebView'),
              ),
              ElevatedButton(
                onPressed: _openBlankPage,
                child: const Text('Open Blank Page'),
              ),
              ElevatedButton(
                onPressed: _openNewScreen,
                child: const Text('Open New Screen'),
              ),
              const SizedBox(height: 30),
              const Text('Test Buttons', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _handleTest1,
                    child: const Text('Test 1'),
                  ),
                  ElevatedButton(
                    onPressed: _handleTest2,
                    child: const Text('Test 2'),
                  ),
                  ElevatedButton(
                    onPressed: _handleTest3,
                    child: const Text('Test 3'),
                  ),
                  ElevatedButton(
                    onPressed: _handleTest4,
                    child: const Text('Test 4'),
                  ),
                ],
              ),
            ],
          ),
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
