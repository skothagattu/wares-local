import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteKitForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double formWidth = screenWidth * 0.6;
    return /*Container(
      child: Text("Delete Kit"),
    );*/Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.only(top:10,left: 40, right: 40, bottom: 50),
                child: Container(
                  width: formWidth,
                  /* height: screenWidth* 0.25,*/
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0,3),
                      )
                    ],borderRadius: BorderRadius.circular(12),
                  ),

                  child:  Form(
                    child:
                    Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  "CREATE KIT",
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                              SizedBox(height: screenWidth *0.06),
                            ],

                          ),

                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: screenWidth *0.03),
                                  Flexible(child: SizedBox(
                                    width: screenWidth*0.15,

                                    child:
                                    TextFormField(
                                      /*controller: productNoController,*/

                                      decoration: InputDecoration(
                                        labelText: 'PRODUCT NUMBER',
                                        labelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,  // This makes the labelText bold
                                        ),

                                      ),
                                    ),
                                  ),),
                                  SizedBox(height: screenWidth *0.03),
                                ],


                              ),
                            ],
                          ),
                        ]
                    ),
                  ),
                )
            )
        ),
      ],
    );
  }
}
