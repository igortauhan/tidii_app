import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tidii/mock_data/street_safe_mock_data.dart';
import 'package:tidii/mock_data/street_leaking_mock_data.dart';

class StreetPage extends StatefulWidget {
  bool isLeaking;

  StreetPage({Key? key, required this.isLeaking}) : super(key: key);

  @override
  _StreetPageState createState() => _StreetPageState();
}

class _StreetPageState extends State<StreetPage> {
  List<Widget> itemsData = [];

  // get a color to ElevatedButton background
  Color getSituationColor(bool isLeaking) {
    if (isLeaking) {
      return Colors.red;
    }

    return Colors.green;
  }

  void getPostsData() {
    List<dynamic> responseData;
    if (widget.isLeaking) {
      responseData = streetLeakingMockData;
    } else {
      responseData = streetSafeMockData;
    }

    List<Widget> listItems = [];

    for (var item in responseData) {
      Color color = getSituationColor(item['isLeaking']);
      listItems.add(
        SizedBox(
          width: 300,
          height: 120,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              item['street'] + "\n\n" + item['info'],
              style: const TextStyle(fontSize: 16.0),
            ),
            style: ElevatedButton.styleFrom(
              primary: color,
            ),
          ),
        ),
      );
    }
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Optimus Gas'),
        backgroundColor: Colors.grey.shade700,
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
                  'Detalhes dos bairro',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: itemsData.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      const SizedBox(
                        height: 15.0,
                      ),
                      itemsData[index],
                      const SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
              ),
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
