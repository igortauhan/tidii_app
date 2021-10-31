import 'package:flutter/material.dart';

import 'package:tidii/pages/street_page.dart';
import 'package:tidii/models/district.dart';
import 'package:tidii/services/district_service.dart';

class DistrictPage extends StatefulWidget {
  const DistrictPage({Key? key}) : super(key: key);

  @override
  _DistrictPageState createState() => _DistrictPageState();
}

class _DistrictPageState extends State<DistrictPage> {
  late Future<List<District>> futureDistricts;

  List<Widget> itemsData = [];

  // get a color to ElevatedButton background
  Color getSituationColor(bool isLeaking) {
    if (isLeaking) {
      return Colors.red;
    }

    return Colors.green;
  }

  void getPostsData() async {
    List<District> districts = await futureDistricts;

    List<Widget> listItems = [];

    for (var item in districts) {
      Color color = getSituationColor(item.leakingSituation);
      listItems.add(
        SizedBox(
          width: 300,
          height: 120,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StreetPage(
                            isLeaking: item.leakingSituation,
                          )));
            },
            child: Text(
              item.name + "\n\n" + item.info,
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
    futureDistricts = DistrictService().fetchDistrict();
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
