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
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          // Simple example

          PrettyNumbers(
            controller: _controller,
            focusNode: _focusNode,
            hintText: 'Enter amount',
            suffixIcon: const Icon(Icons.check_circle),
            prefixIcon: const Icon(Icons.attach_money),
          ),
          //Example with custom property
          PrettyNumbers(
            controller: _controller,
            focusNode: _focusNode,
            hintText: 'Enter amount',
            suffixIcon: Icon(Icons.check_circle),
            prefixIcon: Icon(Icons.attach_money),
            style: TextStyle(color: Colors.blue, fontSize: 18),
            hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
            filled: true,
            decoration: InputDecoration(
              fillColor: Colors.lightBlue[50],
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black, width: 1.0),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
