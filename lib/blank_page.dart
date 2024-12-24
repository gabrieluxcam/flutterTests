import 'package:flutter/material.dart';
import 'package:flutter_uxcam/flutter_uxcam.dart';

class BlankPage extends StatefulWidget {
  const BlankPage({Key? key}) : super(key: key);

  @override
  _BlankPageState createState() => _BlankPageState();
}

class _BlankPageState extends State<BlankPage> {
  @override
  void initState() {
    super.initState();
    FlutterUxcam.tagScreenName("credit card");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blank Page'),
      ),
      body: Column(
        children: [
          // Credit Card Mockup
          Card(
            color: Colors.green,
            elevation: 4,
            margin: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Credit Card Mockup',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Card Number: 1234 5678 9012 3456',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Cardholder Name: John Doe',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Expiry Date: 12/25',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          // Sample Text Cards Below the Mockup
          Expanded(
            child: ListView(
              children: [
                Card(
                  elevation: 4,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Sample text card 1',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Sample text card 2',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Sample text card 3',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
