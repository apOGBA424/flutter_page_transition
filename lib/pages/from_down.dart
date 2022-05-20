import 'package:flutter/material.dart';

class FromDown extends StatelessWidget {
  final String pageName;
  const FromDown({Key? key, required this.pageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceViewport = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/logo.png'),
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: deviceViewport.height * 0.08),
            Text(
              pageName,
              style: const TextStyle(
                color: Color.fromARGB(255, 50, 49, 56),
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: deviceViewport.height * 0.75),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to home'),
            ),
          ],
        ),
      ),
    );
  }
}
