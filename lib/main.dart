import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/Models/note_model.dart';
import 'package:provider/provider.dart';

import 'EditNote.dart';
import 'home page.dart';



void main() async{

  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('note box');

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=>p())
    ],
      child: const MyApp()));

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      routes: {
        'EditePage' :  (context)=>EditeNotes(),
      },
      theme:Provider.of<p>(context).theme,
      home: HomePage(),);
  }
}






class ThemeStyle {

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Colors.black,
      secondary: Colors.white70,
      background: Colors.white70
    )
  );


  static ThemeData dark = ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
          primary: Colors.orangeAccent,
          secondary: Colors.grey.shade900,
          background: Colors.white10
      )
  );
}



class p extends ChangeNotifier{

  ThemeData theme = ThemeStyle.light;

   changetheme(){

    if(theme==ThemeStyle.light)
      theme = ThemeStyle.dark;

    else{
      theme =ThemeStyle.light;
    }
    notifyListeners();
  }


}