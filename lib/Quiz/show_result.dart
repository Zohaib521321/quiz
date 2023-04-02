import 'package:flutter/material.dart';
import 'package:quize/drop_down_show/main_show.dart';
class show_result extends StatefulWidget {
String result;
   show_result({Key? key,required this.result}) : super(key: key);

  @override
  State<show_result> createState() => _show_resultState();
}

class _show_resultState extends State<show_result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Center(
        child: Container(
          width: 300,
          height: 400,
          child: Card(

            elevation: 19,
            shadowColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Your marks are :",style: TextStyle(fontSize: 25))),
                  ),
                  SizedBox(height: 18,),
                  Text("${widget.result}/10",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  SizedBox(height: 29,),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (builder)=>main_show()));
                  }, child: Text("Try again"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
