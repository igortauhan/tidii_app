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
    return Container();
  }
}
