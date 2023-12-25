import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:myapp/flask/flask.dart';

class Predictor extends StatefulWidget {
  @override
  _PredictorState createState() => _PredictorState();
}

class _PredictorState extends State<Predictor> {
  TextEditingController urlController = TextEditingController();
  var response;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Predictor'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 70.0, horizontal: 40.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    var data = await getData('http://192.168.1.128:8000/api');
                    var decodedData = jsonDecode(data);
                    showAlertDialog(context, decodedData['query']);
                  },
                  child: Text(
                    'Predict!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, String name) {
    Widget okayButton = TextButton(
      child: Text("Okay!"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Result"),
      content: Text("The result: $name"),
      actions: [
        okayButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
