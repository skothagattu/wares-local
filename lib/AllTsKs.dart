import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class AllTsKs extends StatefulWidget{
   AllTsKs({Key? key}) : super(key: key);
  void navigateBack(BuildContext ctx){
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
      return MyApp();
    }));
  }
  final formKey = GlobalKey<FormState>();

  @override
  State<AllTsKs> createState() => _AllTsKsState();
}

class _AllTsKsState extends State<AllTsKs> {
  String selectedValue_Rev = 'A';
  List<DropdownMenuItem<String>> get dropdownItems_Rev{
    return[
      DropdownMenuItem(child: Text("A"), value: 'A'),
      DropdownMenuItem(child: Text("B"), value: 'B'),
      DropdownMenuItem(child: Text("C"), value: 'C'),
      DropdownMenuItem(child: Text("D"), value: 'D'),
      DropdownMenuItem(child: Text("E"), value: 'E'),

    ];
  }
  String selectedValue_stat = 'Active';
  List<DropdownMenuItem<String>> get dropdownItems_stat{
    return[
      DropdownMenuItem(child: Text("Active"), value: 'Active'),
      DropdownMenuItem(child: Text("Inactive"), value: 'Inactive'),

    ];
  }
  String selectedValue_type = 'Active';
  List<DropdownMenuItem<String>> get dropdownItems_type{
    return[
      DropdownMenuItem(child: Text("Active"), value: 'Active'),
      DropdownMenuItem(child: Text("Inactive"), value: 'Inactive'),

    ];
  }
  String selectedValue_comp = 'EVSE';
  List<DropdownMenuItem<String>> get dropdownItems_comp{
    return[
      DropdownMenuItem(child: Text("CMI"), value: 'CMI'),
      DropdownMenuItem(child: Text("EVSE"), value: 'EVSE'),

    ];
  }
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (selectedDate != null && selectedDate != DateTime.now()) {
      _dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
    }
  }
  final TextEditingController _dateControllerDue = TextEditingController();

  Future<void> _selectDateDue(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (selectedDate != null && selectedDate != DateTime.now()) {
      _dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/logo_cmi.png'),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            widget.navigateBack(context);
          },
        ),
      ),
        body:
            Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(top:10,left: 40, right: 40, bottom: 50),
                  child: Container(
                      width: screenWidth * 0.8,
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
                    child: Form(
                      key: widget.formKey,
                      child:
                      Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    "T's K's AND A's",
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
                                        decoration: InputDecoration(
                                          labelText: 'PRODUCT NUMBER',
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,  // This makes the labelText bold
                                          ),
                                        ),
                                      ),
                                    ),),
                                    SizedBox(width: screenWidth *0.03),
                                    Flexible(child: SizedBox(
                                        width: screenWidth*0.15,

                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("REV"),
                                            DropdownButton<String>(
                                              value: selectedValue_Rev,
                                              isExpanded: true,

                                              items: dropdownItems_Rev,
                                              onChanged: (value){
                                                setState(() {
                                                  selectedValue_Rev = value!;
                                                });
                                              },

                                            )
                                          ],

                                        )

                                    ),),

                                    SizedBox(width: screenWidth *0.03),
                                    Flexible(
                                        child: SizedBox(
                                            width: screenWidth*0.15,

                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("STATUS"),
                                                DropdownButton<String>(
                                                  value: selectedValue_stat,
                                                  isExpanded: true,

                                                  items: dropdownItems_stat,
                                                  onChanged: (value){
                                                    setState(() {
                                                      selectedValue_stat = value!;
                                                    });
                                                  },

                                                )
                                              ],

                                            )

                                        )


                                    ),

                                    SizedBox(width: screenWidth *0.03),
                                    Flexible(child: SizedBox(
                                        width: screenWidth*0.15,

                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("TYPE"),
                                            DropdownButton<String>(
                                              value: selectedValue_type,
                                              isExpanded: true,

                                              items: dropdownItems_type,
                                              onChanged: (value){
                                                setState(() {
                                                  selectedValue_type = value!;
                                                });
                                              },

                                            )
                                          ],

                                        )

                                    ),),

                                    SizedBox(width: screenWidth *0.03),
                                    Flexible(child: SizedBox(
                                      width: screenWidth*0.15,
                                      child:
                                      TextFormField(
                                        maxLines: null,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                          labelText: 'DESCRIPTION',
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,  // This makes the labelText bold
                                          ),
                                        ),
                                      ),
                                    ),),
                                    SizedBox(width: screenWidth *0.03),

                                  ],
                                ),



                                SizedBox(height: screenWidth *0.01),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: screenWidth *0.03),
                                    Flexible(child: SizedBox(
                                      width: screenWidth*0.15,
                                      child:
                                      TextFormField(
                                        maxLines: null,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                          labelText: 'LABEL_DESC',
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,  // This makes the labelText bold
                                          ),
                                        ),
                                      ),
                                    ),),
                                    SizedBox(width: screenWidth *0.03),
                                    Flexible(child: SizedBox(
                                      width: screenWidth*0.15,
                                      child:
                                      TextFormField(
                                        maxLines: null,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                          labelText: 'CONFIGURATION',
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,  // This makes the labelText bold
                                          ),
                                        ),
                                      ),
                                    ),),

                                    SizedBox(width: screenWidth *0.03),
                                    Flexible(child: SizedBox(
                                      width: screenWidth*0.15,
                                      child:
                                      TextFormField(
                                        maxLines: null,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                          labelText: 'LABEL_CONFIG',
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,  // This makes the labelText bold
                                          ),
                                        ),
                                      ),
                                    ),),

                                    SizedBox(width: screenWidth *0.03),
                                    Flexible(child: SizedBox(
                                      width: screenWidth*0.15,
                                      child:
                                      TextFormField(
                                        maxLines: null,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                          labelText: 'LIST_PRICE',
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,  // This makes the labelText bold
                                          ),
                                        ),
                                      ),
                                    ),),

                                    SizedBox(width: screenWidth *0.03),
                                    Flexible(child: SizedBox(
                                      width: screenWidth*0.15,
                                      child: GestureDetector(
                                        onTap: () => _selectDate(context),
                                        child: AbsorbPointer(
                                          child: TextFormField(
                                            controller: _dateController,
                                            decoration: InputDecoration(
                                                labelText: 'DATE_REQ',
                                                labelStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                )
                                            ),
                                          ),
                                        ),
                                      ),
                                      /*TextFormField(
                                  maxLines: null,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    labelText: 'DATE_REQ',
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,  // This makes the labelText bold
                                    ),
                                  ),
                                ),*/
                                    ),),
                                    SizedBox(width: screenWidth *0.03),
                                  ],
                                ),
                                SizedBox(height: screenWidth *0.01),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: screenWidth *0.03, height: 10,),
                                    Flexible(child: SizedBox(
                                        width: screenWidth*0.15,

                                        child: GestureDetector(
                                          onTap: () => _selectDateDue(context),
                                          child: AbsorbPointer(
                                            child: TextFormField(
                                              controller: _dateControllerDue,
                                              decoration: InputDecoration(
                                                  labelText: 'DATE_DUE',
                                                  labelStyle: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  )
                                              ),
                                            ),
                                          ),
                                        )
                                    ),),
                                    SizedBox(width: screenWidth *0.03),
                                    Flexible(
                                        child: SizedBox(
                                            width: screenWidth*0.15,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("COMPANY"),
                                                DropdownButton<String>(
                                                  value: selectedValue_comp,
                                                  isExpanded: true,

                                                  items: dropdownItems_comp,
                                                  onChanged: (value){
                                                    setState(() {
                                                      selectedValue_comp = value!;
                                                    });
                                                  },

                                                )
                                              ],

                                            )
                                        )


                                    ),

                                    SizedBox(width: screenWidth *0.03),
                                    Flexible(child: SizedBox(
                                      width: screenWidth*0.15,
                                      child:
                                      TextFormField(
                                        maxLines: null,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                          labelText: 'ECR',
                                          contentPadding: EdgeInsets.all(5),
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,  // This makes the labelText bold
                                          ),

                                        ),
                                      ),
                                    ),),

                                    SizedBox(width: screenWidth *0.03),
                                    Flexible(child: SizedBox(
                                      width: screenWidth*0.15,
                                      child:
                                      TextFormField(
                                        maxLines: null,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                          labelText: 'COMMENTS',
                                          contentPadding: EdgeInsets.all(5),
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,  // This makes the labelText bold
                                          ),

                                        ),
                                      ),
                                    ),),
                                  ],
                                ),

                              ],
                            ),

                            Column(
                              children: [
                                Padding(padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.height *0.02,
                                ),
                                  child: Container(
                                    width: screenWidth*0.2,
                                    height: MediaQuery.of(context).size.height *0.05,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Validate the form data here.
                                        if (widget.formKey.currentState!.validate()) {
                                          // Submit the form data here.
                                        }
                                      },
                                      child: Text('Submit'),
                                    ),
                                  ),
                                ),
                              ],
                            ),



                          ],


                        ),



                    ),

                  ),

                ),

              ),
            )

    );
  }
}