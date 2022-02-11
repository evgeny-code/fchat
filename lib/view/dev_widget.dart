import 'package:flutter/material.dart';

class DevWidget extends StatelessWidget {
  const DevWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.yellowAccent,
      child: new Column(
        children: [
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {

            },
            child: Text('Generate contact'),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {

            },
            child: Text('Generate response'),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {

            },
            child: Text('Clear all'),
          ),
        ],
      ),
    );
  }
}
