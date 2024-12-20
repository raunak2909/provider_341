import 'package:flutter/widgets.dart';

class ListProvider extends ChangeNotifier{

  //DbHelper dbHelper = DbHelper();

  List<Map<String, dynamic>> _mData = [];

  ///add
  addData({required String mTitle, required String mDesc}){
    _mData.add({
      "title" : mTitle,
      "desc" : mDesc
    });

   /* bool check = await dbHelper.addNote(Model);

    if(check){
      var allNotes = await dbHelper.getNotes();
      _mData = allNotes;
      notifyListeners();
    } */

    notifyListeners();
  }

  ///fetch
  List<Map<String, dynamic>> getData() => _mData;

  ///update
  void updateData({required String mTitle, required String mDesc, required int index}){
    _mData[index] = {
      "title" : mTitle,
      "desc" : mDesc
    };
    notifyListeners();
  }


  ///delete
  void deleteData({required int index}){
    _mData.removeAt(index);
    notifyListeners();
  }

}