import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quize/Quiz/show_result.dart';
import 'dart:math';
import 'package:timer_count_down/timer_count_down.dart';
class computer_show extends StatefulWidget {
  const computer_show({Key? key}) : super(key: key);

  @override
  State<computer_show> createState() => _computer_showState();
}

class _computer_showState extends State<computer_show> {
  int num=1;
  int qno=1;
  int correctAnswers = 0;
  final PageController _pageController = PageController();
  int? Selectedvalue;
  @override
  void initState() {
    super.initState();
    Selectedvalue=0;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async   {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Do you want to go back?'),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text('No')
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },

                  child: const Text('Yes'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Computer"),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.yellow.shade300,Colors.yellowAccent.shade200]
              )
          ),
          child: StreamBuilder(
              stream:FirebaseFirestore.instance.collection("computer").snapshots(),
              builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                List<int> randomIndexes = [];
                List<int> usedIndexes = [];
                for (int i = 0; i<=min(2000,snapshot.data!.docs.length); i++) {
                  int random = Random().nextInt(snapshot.data!.docs.length);
                  if (!usedIndexes.contains(random)) {
                    randomIndexes.add(random);
                    usedIndexes.add(random);
                  }
                  if(randomIndexes.length == 10) break;
                }
                return GestureDetector(
                  onTap: (){

                  },
                  child:   PageView.builder(

                    physics: NeverScrollableScrollPhysics(),

                    controller: _pageController,

                    itemCount:randomIndexes.length,

                    itemBuilder: (context,index){

                      return

                        SingleChildScrollView(

                          child:   Column(

                            children: [

                              SizedBox(

                                height: MediaQuery.of(context).size.height*.01,

                              ),

                              ///number of pages

                              Container(

                                width: MediaQuery.of(context).size.width*6,

                                height: MediaQuery.of(context).size.height*.09,

                                child: Card(

                                    color: Colors.yellowAccent.shade100,

                                    elevation: 4,

                                    shadowColor: Colors.red,

                                    child: Align(

                                        alignment: Alignment.center,

                                        child: Text("$num/10",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27,color: Colors.red),))),

                              ),

                              SizedBox(

                                height: MediaQuery.of(context).size.height*.03,

                              ),

                              ///Count_down Timer

                              Container(

                                width: MediaQuery.of(context).size.width*6,

                                height: MediaQuery.of(context).size.height*.09,

                                child: Card(

                                  color: Colors.yellowAccent.shade100,

                                  elevation: 4,

                                  shadowColor: Colors.red,

                                  child: Align(

                                    alignment: Alignment.center,

                                    child: Countdown(seconds: 30, build: (context,time){

                                      ///audio error

                                      // if (time<=5) {

                                      //

                                      // AudioCache().play("assets/music/danger.mp3");

                                      // AudioPlayer().setUrl("https://2u039f-a.akamaihd.net/downloads/ringtones/files/mp3/danger-alarm-23793.mp3");



                                      return Text("Time remaining is="+time.toString(),



                                        style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,color: Colors.purple),);

                                    }

                                      ,onFinished: (){

                                        qno++;

                                        num++;

                                        _pageController.nextPage(

                                          duration: Duration(milliseconds: 300),

                                          curve: Curves.easeIn,

                                        );

                                      },

                                    ),

                                  ),

                                ),

                              ),

                              SizedBox(

                                height: MediaQuery.of(context).size.height*.03,

                              ),

                              ///Question

                              Container(

                                width: MediaQuery.of(context).size.width*6,

                                height: MediaQuery.of(context).size.height*.14,

                                child: Card(

                                  color: Colors.yellowAccent.shade100,

                                  elevation: 4,

                                  shadowColor: Colors.red,

                                  shape: RoundedRectangleBorder(

                                    borderRadius: BorderRadius.circular(12.0),

                                  ),

                                  child: Padding(

                                    padding: const EdgeInsets.all(8.0),

                                    child:   Text("Q.No.$qno-  "+snapshot.data!.docs[randomIndexes[index]]["Question"]+"?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),

                                  ),



                                ),



                              ),

                              ///Option A
                              StatefulBuilder(
                                builder: (BuildContext context, StateSetter setState) {
                                  return Column(
                                    children: [
                                      ///Option A
                                      Container(
                                        width: MediaQuery.of(context).size.width*6,
                                        height: MediaQuery.of(context).size.height*.10,
                                        child: Card(
                                          color: Colors.yellowAccent.shade100,
                                          elevation: 4,
                                          shadowColor: Colors.red,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12.0),),
                                          child: RadioListTile(
                                            value: 1,
                                            groupValue: Selectedvalue,
                                            title: Text(snapshot.data!.docs[randomIndexes[index]]["Option A"],style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                            activeColor: Colors.green,
                                            onChanged: (value) {
                                              setState(() {
                                                Selectedvalue = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      ///Option B
                                      Container(
                                        width: MediaQuery.of(context).size.width*6,
                                        height: MediaQuery.of(context).size.height*.10,
                                        child: Card(
                                          color: Colors.yellowAccent.shade100,
                                          elevation: 4,
                                          shadowColor: Colors.red,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12.0),),
                                          child: RadioListTile(
                                            value: 2,
                                            groupValue: Selectedvalue,
                                            title: Text(snapshot.data!.docs[randomIndexes[index]]["Option B"],style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                            activeColor: Colors.green,
                                            onChanged: (value) {
                                              setState(() {
                                                Selectedvalue = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      ///Option C
                                      Container(
                                        width: MediaQuery.of(context).size.width*6,
                                        height: MediaQuery.of(context).size.height*.10,
                                        child: Card(
                                          color: Colors.yellowAccent.shade100,
                                          elevation: 4,
                                          shadowColor: Colors.red,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12.0),),
                                          child: RadioListTile(
                                            value: 3,
                                            groupValue: Selectedvalue,
                                            title: Text(snapshot.data!.docs[randomIndexes[index]]["Option C"],style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                            activeColor: Colors.green,
                                            onChanged: (value) {
                                              setState(() {
                                                Selectedvalue = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      ///Option D
                                      Container(
                                        width: MediaQuery.of(context).size.width*6,
                                        height: MediaQuery.of(context).size.height*.10,
                                        child: Card(
                                          color: Colors.yellowAccent.shade100,

                                          elevation: 4,

                                          shadowColor: Colors.red,

                                          shape: RoundedRectangleBorder(

                                            borderRadius: BorderRadius.circular(12.0),),
                                          child: RadioListTile(
                                            value: 4,
                                            groupValue: Selectedvalue,
                                            title: Text(snapshot.data!.docs[randomIndexes[index]]["Option D"],style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                            activeColor: Colors.green,
                                            onChanged: (value) {
                                              setState(() {
                                                Selectedvalue = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              SizedBox(height: 15,),
                              ///Submit button
                              Card(
                                color: Colors.yellowAccent.shade100,
                                elevation: 19,
                                shadowColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                  width: 150,
                                  height: 50,
                                  child: ElevatedButton(onPressed:  (){
                                    if(Selectedvalue==int.parse(snapshot.data!.docs[randomIndexes[index]]["Correct"])){
                                      correctAnswers++;
                                      print("correct");
                                      print(Selectedvalue);
                                    }
                                    else{
                                      print("incorrect");
                                      print("Selected value:$Selectedvalue");
                                      print("Correct:${snapshot.data!.docs[randomIndexes[index]]["Correct"]}");

                                    }
                                    Selectedvalue=0;
                                    num++;
                                    qno++;
                                    _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                                    if (index == randomIndexes.length-1) {
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>show_result(result: correctAnswers.toString())));
                                    }
                                  },
                                      child: Text("Submit",style: TextStyle(color: Colors.yellowAccent),)),
                                ),
                              ),
                            ],
                          ),
                        );
                    },
                  ),
                );
              }
          ),
        ),
      ),
    );
  }
}
