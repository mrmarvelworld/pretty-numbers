## Pretty Numbers

Pretty Numbers is a Flutter package that formats your numeric input fields beautifully, making them easy to read and visually appealing for your users.

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  pretty_numbers: ^0.0.1
```

# Simple Example

```yaml

import 'package:flutter/material.dart';
import 'package:pretty_numbers/pretty_numbers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pretty Numbers Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ExampleForm(),
        ),
      ),
    );
  }
}

class ExampleForm extends StatefulWidget {
  @override
  _ExampleFormState createState() => _ExampleFormState();
}

class _ExampleFormState extends State<ExampleForm> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrettyNumbers(
          controller: _controller,
          focusNode: _focusNode,
          hintText: 'Enter amount',
          suffixIcon: Icon(Icons.check_circle),
          prefixIcon: Icon(Icons.attach_money),
        ),
      ],
    );
  }
}


```
