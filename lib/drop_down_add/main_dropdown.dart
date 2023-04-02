import 'package:flutter/material.dart';
import 'package:quize/Quiz/add_quiz.dart';
import 'package:quize/drop_down_add/Computer.dart';
import 'package:quize/drop_down_add/chemistry.dart';
import 'package:quize/drop_down_add/english.dart';
import 'package:quize/drop_down_add/general_knowledge.dart';
import 'package:quize/drop_down_add/physics.dart';
class main_add extends StatefulWidget {
  const main_add({Key? key}) : super(key: key);

  @override
  State<main_add> createState() => _main_addState();
}

class _main_addState extends State<main_add> {
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
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      
                    ),
                    title: Text(item),
                  ),
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
                              builder: (context) => chemistry_add()));
                      break;
                    case 'Computer':
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => computer_add()));
                      break;
                    case 'English':
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => english_add()));
                      break;
                    case 'General Knowledge':
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => general_add()));
                      break;
                    case 'Physics':
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => physics_add()));
                      break;
                    case 'Politics':
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => add_quiz()));
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
