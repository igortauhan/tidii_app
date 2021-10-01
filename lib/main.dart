import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tidii/pages/district_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Optimus Gas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Optimus Gas'),
        backgroundColor: Colors.grey.shade700,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset('lib/assets/images/app_icon.png'),
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Center(
                child: Text(
                  'Detalhes da cidade',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
              ),
              const DistrictPage(),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                child: const Text(
                  'Sua segurança é tudo',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
