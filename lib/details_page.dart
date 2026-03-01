import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 15,
              decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(color: Colors.blue, width: 4),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(2, 0, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("title"),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.5,
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(color: Colors.blue, width: 4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
