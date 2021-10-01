import 'package:flutter/material.dart';
import 'package:tidii/mock_data/district_mock_data.dart';

class DistrictPage extends StatefulWidget {
  const DistrictPage({Key? key}) : super(key: key);

  @override
  _DistrictPageState createState() => _DistrictPageState();
}

class _DistrictPageState extends State<DistrictPage> {
  List<Widget> itemsData = [];

  // get a color to ElevatedButton background
  Color getSituationColor(bool isLeaking) {
    if (isLeaking) {
      return Colors.red;
    }

    return Colors.green;
  }

  void getPostsData() {
    List<dynamic> responseList = districtMockData;
    List<Widget> listItems = [];
    for (var item in responseList) {
      Color color = getSituationColor(item['isLeaking']);
      listItems.add(
        SizedBox(
          width: 300,
          height: 120,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              item['district'] + "\n\n" + item['info'],
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
    return Expanded(
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
              )),
    );
  }
}
