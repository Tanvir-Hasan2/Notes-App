// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../models/note_model.dart';
//
// class NoteController extends GetxController {
//   final notes = <NoteModel>[].obs;
//
//   Future<void> fetchNotes(String userId) async {
//     var snapshot = await FirebaseFirestore.instance
//         .collection('notes')
//         .where('userId', isEqualTo: userId)
//         .get();
//
//     var noteList = snapshot.docs
//         .map((doc) => NoteModel.fromFirestore(doc.data(), doc.id))
//         .toList();
//
//     notes.assignAll(noteList);
//   }
//
//   Future<void> addNote(NoteModel note) async {
//     await FirebaseFirestore.instance.collection('notes').add(note.toFirestore());
//     fetchNotes(note.userId);
//     onInit();
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class NoteController extends GetxController {
  final notes = FirebaseFirestore.instance.collection('notes');
  var isLoading = true.obs;
  var notesList = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotes();
  }

  Future<void> addNotes(String title, String description) async {
    await notes.add({
      'title': title,
      'description': description,
    }).then((val) {
      Get.snackbar('Success', "Notes added successfully");
    }).catchError((e) {
      print('Failed to add notes: $e');
    });
  }

  void fetchNotes() {
    isLoading(true);
    notes.snapshots().listen((QuerySnapshot snapshot) {
      notesList.clear();
      for (var doc in snapshot.docs) {
        notesList.add(doc.data());
      }
      isLoading(false);
    });
  }

}
