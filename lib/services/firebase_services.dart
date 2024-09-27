// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../models/note_model.dart';
//
// class NoteService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   Future<List<NoteModel>> fetchNotes(String userId) async {
//     try {
//       QuerySnapshot snapshot = await _firestore
//           .collection('notes')
//           .where('userId', isEqualTo: userId)
//           .get();
//
//       return snapshot.docs
//           .map((doc) => NoteModel.fromFirestore(doc.data() as Map<String, dynamic>, doc.id))
//           .toList();
//     } catch (e) {
//       print("Error fetching notes: $e");
//       return [];
//     }
//   }
//
//   Future<void> addNote(NoteModel note) async {
//     try {
//       await _firestore.collection('notes').add(note.toFirestore());
//     } catch (e) {
//       print("Error adding note: $e");
//     }
//   }
// }

