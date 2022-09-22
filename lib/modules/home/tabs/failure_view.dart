import 'package:flutter/material.dart';

class FailureView extends StatelessWidget {
  FailureView({
    this.title = "Error",
    this.message = "Something went wrong",
    required this.onPressed,
  });
  String title, message;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 150,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            ElevatedButton(
              onPressed: onPressed,
              child: Text("Retry"),
            ),
          ],
        ),
      ),
    );
  }
}
