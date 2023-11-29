import 'dart:io';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wares/screens/compatibility.dart';
import 'package:wares/theme/theme_constants.dart';
import 'package:wares/theme/theme_manager.dart';
import 'AllProducts.dart';
import 'AllTsKs.dart';
class MyHttpOverrides extends HttpOverrides{
  @override
HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
        ..badCertificateCallback = (X509Certificate cert, String host, int port){
      return true;
        };
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const ProviderScope(child: MyApp()));
}
ThemeManager _themeManager = ThemeManager();
class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  _MyAppState createState() => _MyAppState();
}
// This widget is the root of your application.
class _MyAppState extends State<MyApp>{

  @override
  void dispose() {
    _themeManager.removeListener(themeListner);
    super.dispose();
  }
  @override
  void initState() {
    _themeManager.addListener(themeListner);
    super.initState();
  }

  themeListner(){
    if(mounted){
      setState(() {

      });
    }
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: Colors.lightBlueAccent,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            toolbarHeight: 100,
            color: Colors.blue,

          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.black,
                primary: Colors.white38,
              )
          )
      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            toolbarHeight: 100,

          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white60,
                primary: Colors.white38,
              )
          )
      ),
      themeMode: _themeManager.themeMode,
      home: const CustomForm(),
    );
  }
}

class CustomForm extends StatelessWidget {
  const CustomForm({super.key});

  void navigateAllProds(BuildContext ctx){
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
      return AllProducts();
    }));
  }
  void navigateAllTsKs(BuildContext ctx){
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
      return AllTsKs();
    }));
  }
  void navigateCompat(BuildContext ctx){
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
      return CompatForm();
    }));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(

        title: Image.asset('images/logo_cmi.png'),
        centerTitle: true,
        /* leading: BackButton(
            onPressed: () {},
          ),*/


        /*Center(

          child: SizedBox(
            width:400,

            *//*child:

            Image.asset('images/logo_cmi.png'),*//*


          ),


        ),*/
        actions: [Switch(value: _themeManager.themeMode ==ThemeMode.dark, onChanged: (newValue){ _themeManager.toggleTheme(newValue);})],
      ),


      body:SingleChildScrollView(
        child: Column(
            children: [
              // Centered row with title

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    /*  width: 400,
                height: 100,*/
                    child: Text(
                      'THE NEW WARES',
                      style: TextStyle(fontSize: 50, fontFamily: 'Oswald-VariableFont_wght', ),
                    ),
                  ),

                ],
              ),

              // Centered row with author name
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    /* width: 200,
                height: 80,*/
                    child: Text(
                      'BY SURYATEJA',
                      style: TextStyle(fontSize: 20, fontFamily: 'Lato'),

                    ),

                  ),

                ],

              ),
              const SizedBox(height: 100),
              // Column with two rows of buttons
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Top row of buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: screenWidth *0.05),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            navigateAllTsKs(context);
                          },
                          style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(25)),
                          child: const Text("T's, K's AND A's"),
                        ),
                      ),
                      SizedBox(width: screenWidth *0.05),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            navigateAllProds(context);
                          },
                          style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(25)),
                          child: const Text("ALL PRODUCTS"),
                        ),
                      ),
                      SizedBox(width: screenWidth *0.05),

                    ],
                  ),
                  const SizedBox(height: 80),
                  SingleChildScrollView(child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Top row of buttons
/*                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: screenWidth *0.3),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(15)),
                                child: const Text("FIND 'T' BY ENTERING MODEL AND READER"),
                              ),
                            ),
                            SizedBox(width: screenWidth *0.3),
                    ]
                            ),*/
                        SizedBox(height: screenWidth *0.01),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(width: screenWidth *0.3),
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            navigateCompat(context);
                                          },
                                          style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(5)),
                                          child: const Text("COMPATIBILITY"),
                                        ),
                                      ),
                                      SizedBox(width: screenWidth *0.3),
                                    ],
                                  ),
                        /*SizedBox(height: screenWidth *0.01),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(width: screenWidth *0.3),
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(5)),
                                          child: const Text("WHERE USED QUERY"),
                                        ),
                                      ),
                                      SizedBox(width: screenWidth *0.3),
                                    ],
                                  ),*/
/*                        SizedBox(height: screenWidth *0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: screenWidth *0.3),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(15)),
                                    child: const Text("FIND 'K' BY ENTERING 'T'.COM MOD AND 1 OTHER"),
                                  ),
                                ),
                                SizedBox(width: screenWidth *0.3),
                              ],
                            )*/
                          ],
                  )),

                ],

              ),



            ]

        ),
      ),
      // Bottom row of buttons

    );
  }
}