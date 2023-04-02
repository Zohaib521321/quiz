import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quize/Drawer/About_us.dart';
import 'package:quize/Drawer/setting.dart';
import 'package:quize/Quiz/add_quiz.dart';
import 'package:quize/Quiz/show_quiz.dart';
import 'package:quize/drop_down_add/main_dropdown.dart';
import 'package:quize/drop_down_show/main_show.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
        options: const FirebaseOptions(apiKey: "AIzaSyD_yFQOiLUswGlwP1rk7jaQ42uDPh5ApSw",
          appId: "1:794045041983:web:930f71f02ec3617288178a",
          messagingSenderId: "794045041983",
          projectId: "quiz-b839b",
          storageBucket: "quiz-b839b.appspot.com",
          measurementId: "G-TYETD06GT0",

        )
    );
  }else{
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Quiz app'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async   {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            ///Alert dialog
            return AlertDialog(
              title:  Text('Do you want to exit app?'),
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
          title: Text(widget.title),
          centerTitle: true,

        ),
        ///Drawer
        drawer: Drawer(

          elevation: 4,
          child: ListView(
            children: [
              SizedBox(height: 25,),
//Home
              Card(
                color: Colors.white,
                elevation: 4,
                shadowColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListTile(
                  leading: Icon(Icons.home,size: 40,),
                  title: Text("Home",style: TextStyle(fontSize: 21,color: Colors.black54),
                  ),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(height: 29,),
              //Setting
              Card(
                color: Colors.white,
                elevation: 4,
                shadowColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListTile(
                  leading: Icon(Icons.settings,size: 40,),
                  title: Text("Setting",style: TextStyle(fontSize: 21,color: Colors.black54),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>setting()));
                  },
                ),
              ),
              SizedBox(height: 29,),
              //about
              Card(
                color: Colors.white,
                elevation: 4,
                shadowColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListTile(
                  leading: Icon(Icons.account_box,size: 40,),
                  title: Text("About Us",style: TextStyle(fontSize: 21,color: Colors.black54),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>about_us()));
                  },
                ),
              ),

            ],
          ),

        ),
        body:
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.yellow.shade300,Colors.yellowAccent.shade200]
                )
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 18,),
                  ///Start Quiz
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (builder)=>main_show()));
                    },
                    //show quiz
                    child: Card(
                      color: Colors.yellowAccent.shade100,
                      elevation: 4,
                      shadowColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Container(
width: 270,
                        height: 250,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(

                            colors: [Colors.yellow.shade200,Colors.yellowAccent.shade100],

                          ),

                        ),
                        child:Center(child: Text("Start Quiz",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 23),))
                      ),
                    ),
                  ),
                    SizedBox(height: 29,),
                    ///AddQuiz
                    InkWell(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (builder)=>main_add()));
                     },
                      //add quiz
                      child: Card(
                        color: Colors.yellowAccent.shade100,
                        elevation: 4,
                        shadowColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                          width: 270,
                          height: 250,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.yellow.shade200,Colors.yellowAccent.shade100],

                            ),

                          ),
                          child:Center(child: Text("Add Quiz",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 23))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 155,
                    ),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}
