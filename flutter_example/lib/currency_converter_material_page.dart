import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatelessWidget {
  const CurrencyConverterMaterialPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "0",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText: 'Please enter the amount in USD',
              hintStyle: TextStyle(
                color: Colors.white60,
              ),
              prefix: Icon(Icons.monetization_on),
              ),
            )
          ],
        ),
      ),
    );
  }
}
