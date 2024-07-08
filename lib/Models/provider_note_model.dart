
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';
import 'package:note_app/Models/note_model.dart';
class Note extends ChangeNotifier{

  bool ? loading  ;
  addNote(NoteModel n) async{
    
    try {
      loading =true;
      var box = Hive.box<NoteModel>('note box');
      await box.add(n);
      notifyListeners();
    } on Exception catch (e) {

      print("exception is $e");
    }
    loading = false ;
    notifyListeners();
  }


  Future<List<NoteModel>> fetchNotes()async{

    try {
      var box = await Hive.openBox<NoteModel>('note box');
      List<NoteModel> notes = box.values.toList();

      return notes ;
    } on Exception catch (e) {
      throw 'something wrong has ocuured$e';
    }



  }

  deleteNote (int i)async{
    var box = await Hive.openBox<NoteModel>('note box');
    box.deleteAt(i);
    notifyListeners();


  }

}