import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class chemistry_add extends StatefulWidget {
  const chemistry_add({Key? key}) : super(key: key);

  @override
  State<chemistry_add> createState() => _chemistry_addState();
}

class _chemistry_addState extends State<chemistry_add> {
  final questioncontroller=TextEditingController();
  final option1controller=TextEditingController();
  final option2controller=TextEditingController();
  final option3controller=TextEditingController();
  final option4controller=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int? _selectedValue;
  @override
  void initState() {
    super.initState();
    _selectedValue = -1;
  }
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async   {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            ///Alert dialog
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
          title: Text("Chemistry"),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.yellow.shade300,Colors.yellowAccent.shade200]
              )
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*.01,),
                  ///Question
                  Card(
                    color: Colors.yellowAccent.shade100,
                    elevation: 2,
                    shadowColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: TextFormField(
                          controller: questioncontroller,
                          decoration: InputDecoration(
                            label: Text("Question"),

                          ),
                          validator: (value){
                            if (value!.isEmpty) {
                              return 'Please enter question';
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  /// option1
                  Card(
                    color: Colors.yellowAccent.shade100,
                    elevation: 2,
                    shadowColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: option1controller,
                        decoration: InputDecoration(
                          label: Text("Option A"),
                        ),
                        validator: (value){
                          if (value!.isEmpty) {
                            return 'Please enter Option A';
                          }
                        },
                      ),
                    ),
                  ),
                  ///option2
                  Card(
                    color: Colors.yellowAccent.shade100,
                    elevation: 2,
                    shadowColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: option2controller,
                        decoration: InputDecoration(
                          label: Text("Option B"),
                        ),
                        validator: (value){
                          if (value!.isEmpty) {
                            return 'Please enter Option B';
                          }
                        },
                      ),
                    ),
                  ),
                  ///option3
                  Card(
                    color: Colors.yellowAccent.shade100,
                    elevation: 2,
                    shadowColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: option3controller,
                        decoration: InputDecoration(
                          label: Text("Option C"),
                        ),
                        validator: (value){
                          if (value!.isEmpty) {
                            return 'Please enter Option C';
                          }
                        },
                      ),
                    ),
                  ),
                  ///option4
                  Card(
                    color: Colors.yellowAccent.shade100,
                    elevation: 2,
                    shadowColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(

                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: option4controller,
                        decoration: InputDecoration(
                          label: Text("Option D"),
                        ),
                        validator: (value){
                          if (value!.isEmpty) {
                            return 'Please enter Option D';
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  ///Text
                  Card(
                    color: Colors.yellowAccent.shade100,
                    elevation: 2,
                    shadowColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          height: MediaQuery.of(context).size.height*.06,
                          child: Text("Select Correct Option",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),)

                      ),
                    ),
                  ),
                  ///RadiolistTile

                  ///Option A
                  Card(
                    color: Colors.yellowAccent.shade100,
                    elevation: 2,
                    shadowColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: RadioListTile(value: 1, groupValue: _selectedValue,
                        title: Text(option1controller.text.toString()),
                        subtitle: Text("Option A"),
                        activeColor: Colors.green,
                        onChanged: (value){
                          setState(() {
                            _selectedValue=value;
                            // if (option1controller.text.toString()==null) {
                            //
                            // }
                          });


                        }
                    ),
                  ),
                  ///Option B
                  Card(
                    color: Colors.yellowAccent.shade100,
                    elevation: 2,
                    shadowColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: RadioListTile(value: 2, groupValue: _selectedValue,
                        title: Text(option2controller.text.toString()),
                        subtitle: Text("Option B"),
                        activeColor: Colors.green,

                        onChanged: (value){
                          setState(() {
                            _selectedValue=value;
                          });

                        }
                    ),
                  ),
                  ///Option C
                  Card(
                    color: Colors.yellowAccent.shade100,
                    elevation: 2,
                    shadowColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: RadioListTile(value: 3, groupValue: _selectedValue,
                        title: Text(option3controller.text.toString()),
                        subtitle: Text("Option C"),
                        activeColor: Colors.green,
                        onChanged: (value){
                          setState(() {
                            _selectedValue=value;
                          });

                        }
                    ),
                  ),
                  ///Option D
                  Card(
                    color: Colors.yellowAccent.shade100,
                    elevation: 2,
                    shadowColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: RadioListTile(value: 4, groupValue: _selectedValue,
                        title: Text(option4controller.text.toString()),
                        subtitle: Text("Option D"),
                        activeColor: Colors.green,
                        onChanged: (value){
                          setState(() {
                            _selectedValue=value;
                          });

                        }
                    ),
                  ),


                  SizedBox(height: 16,),
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
                      child: ElevatedButton(onPressed:(){
                        final id=DateTime.now().microsecondsSinceEpoch.toString();
                        final ref=FirebaseFirestore.instance.collection("chemistry");
                        if (_formKey.currentState!.validate()) {
                          ref.doc(id).set({"id":id,"Question":questioncontroller.text,"Option A":option1controller.text,"Option B":option2controller.text,
                            "Option C":option3controller.text,"Option D":option4controller.text,"Correct":_selectedValue.toString()

                          }).then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Question submitted successfully"),
                              duration: Duration(seconds: 10),
                              dismissDirection: DismissDirection.up,
                            ));
                          }).catchError((e){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("${e.message}"), duration: Duration(seconds: 10),
                              dismissDirection: DismissDirection.up,
                            ));
                          });
                          questioncontroller.clear();
                          option1controller.clear();
                          option3controller.clear();
                          option2controller.clear();
                          option4controller.clear();

                          _selectedValue=-1;
                        }

                      }, child: Text("Submit",style: TextStyle(color: Colors.yellowAccent),)),
                    ),
                  )
                  ,
                  SizedBox(height: 15,)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
