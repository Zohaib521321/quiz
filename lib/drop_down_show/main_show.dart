import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:quize/Quiz/show_quiz.dart';
import 'package:quize/drop_down_show/chemistry.dart';
import 'package:quize/drop_down_show/computer.dart';
import 'package:quize/drop_down_show/english.dart';
import 'package:quize/drop_down_show/general_knowledge.dart';
import 'package:quize/drop_down_show/physics.dart';
class main_show extends StatefulWidget {
  const main_show({Key? key}) : super(key: key);

  @override
  State<main_show> createState() => _main_showState();
}

class _main_showState extends State<main_show> {
  String? _selectedItem;
  bool _valid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        title: Text("Select Category"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              style: TextStyle(color: Colors.brown, fontSize: 18),
              items: [
                'Chemistry',
                'Computer',
                'English',
                'General Knowledge',
                'Physics',
                'Politics'
              ].map((String item) {
                return DropdownMenuItem<String>(
                  child: Text(item),
                  value: item,

                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedItem = value;
                });
              },
              value: _selectedItem,
dropdownColor: Colors.red.shade200
,
              elevation: 16,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_selectedItem == null) {
                  setState(() {
                    _valid = false;
                  });
                } else {
                  switch (_selectedItem) {
                    case 'Chemistry':
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => chemistry_show()));
                      break;
                    case 'Computer':
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => computer_show()));
                      break;
                    case 'English':
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => english_show()));
                      break;
                    case 'General Knowledge':
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => general_knowledge_show()));
                      break;
                    case 'Physics':
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => physics_show()));
                      break;
                    case 'Politics':
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => show_quiz()));
                      break;
                  }
                }
              },
              child: Text("Start Quiz"),
            ),
            _valid ? SizedBox() : Text("Please select an item to start quiz",),
          ],
        ),
      ),
    );
  }
}
