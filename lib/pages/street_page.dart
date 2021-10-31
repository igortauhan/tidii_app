import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:tidii/models/street.dart';
import 'package:tidii/services/street_service.dart';

class StreetPage extends StatefulWidget {
  final int districtId;
  final String districtName;

  const StreetPage({Key? key, required this.districtId, required this.districtName}) : super(key: key);

  @override
  _StreetPageState createState() => _StreetPageState();
}

class _StreetPageState extends State<StreetPage> {
  late final String districtName;

  late Future<List<Street>> futureStreets;

  List<Widget> itemsData = [];

  // get a color to ElevatedButton background
  Color getSituationColor(bool isLeaking) {
    if (isLeaking) {
      return Colors.red;
    }

    return Colors.green;
  }

  void getPostsData() async {
    List<Street> streets = await futureStreets;

    List<Widget> listItems = [];

    for (var item in streets) {
      Color color = getSituationColor(item.leakingSituation);
      listItems.add(
        SizedBox(
          width: 300,
          height: 120,
          child: ElevatedButton(
            onPressed: () {
              if (item.leakingSituation) {
                showAlertDialog(context);
              }
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
    districtName = widget.districtName;
    futureStreets = StreetService().fetchDistrict(widget.districtId);
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
              Center(
                child: Text(
                  'Detalhe do bairro ' + districtName,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
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

showAlertDialog(BuildContext context) {
  Widget okButton = TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text('Voltar'));

  AlertDialog alert = AlertDialog(
    title: Text('Atenção'),
    content: Text('Hora do vazamento\n20:00:00'),
    actions: [
      okButton,
    ],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
