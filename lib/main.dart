import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Login'),
          ),
          body: Container(
            color: Theme.of(context).primaryColorDark,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 8,
                  margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        const TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(labelText: 'Email'),
                        ),
                        const TextField(
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(labelText: 'Password'),
                        ),
                        ElevatedButton(
                          onPressed: () => print('Login clicked'),
                          child: const Text('Login'),
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 36)),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
