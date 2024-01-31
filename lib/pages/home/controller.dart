import 'package:belajar_local_database/db/db_helper.dart';
import 'package:belajar_local_database/models/note.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class HomeController extends GetxController {
  Database? db = DbHelper.getDb();

  RxBool isLoading = false.obs;
  late List<Note> notes;

  @override
  void onInit() {
    super.onInit();
    getNotes();
  }

  void getNotes() async {
    isLoading.value = true;
    List<Map<String, dynamic>> mapNotes = await db!.query("Notes");
    notes = mapNotes.map((e) => Note.fromMap(map: e)).toList();
    isLoading.value = false;
  }

  void createNote() async {
    var newnote = await Get.toNamed("/create");
    newnote = newnote as Note?;
    if (newnote != null) {
      await db!.insert("Notes", newnote.toMap());
      getNotes();
    }
  }

  void deleteNote(int id) async {
    await db!.delete("Notes", where: "id = ?", whereArgs: [id]);
    getNotes();
  }

  void editNoteFromPopupMenu(Note notes) async {
    var newNote = await Get.toNamed("/create", arguments: notes);
    newNote = newNote as Note?;
    if (newNote != null) {
      print(notes.toMap().toString());
      print("terupdate");
      await db!.update("Notes", newNote.toMap(),
          where: "id = ?", whereArgs: [newNote.id]);
      getNotes();
    }
  }
}
