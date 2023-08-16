import 'dart:io'; 

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hivee/screens/EdeteNote.dart';
import 'package:hivee/screens/home.dart';
import 'package:hivee/screens/model/NoteModel.dart';
import 'package:hivee/screens/showNote.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
 //  Directory dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModeAdapter());
 await Hive.openBox('note');
   await Hive.openBox<NoteMode>('khattab');

 
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      routes: {
       'ShowNote':(context) => ShowNote(),
       "edit":(context) => EdeteNote(content:'' ,title:'' ,)
      } ,
      home: Home(), theme: ThemeData.dark());
  }
}
