import 'package:fchat/view/qr_view_example.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QrCodeWidget extends StatelessWidget {
  const QrCodeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(image: AssetImage('assets/qr-code.gif')),
        TextButton(
          onPressed: () => {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const QRViewExample(),
            ))
          },
          child: Text("Scan Code"),
        ),
        TextButton(
          onPressed: null,
          child: Text("Delete ALL and change Code"),
        )
      ],
    );
  }
}
