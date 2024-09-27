import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/const/app_strings.dart';
import 'package:note_app/controllers/auth_controller.dart';
import 'package:note_app/ui/pages/add_note_screen.dart';
import '../../controllers/note_controller.dart';

class HomePage extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());
  final NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.appName),
        actions: [
          IconButton(
              onPressed: () {
                Get.off(_authController.logout());
              },
              icon: Icon(Icons.logout)),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(AddNotePage());
        },
        label: Row(
          children: [Icon(Icons.add), Text("Add Note")],
        ),
      ),
      body: Obx(() {
        if (noteController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (noteController.notesList.isEmpty) {
          return Center(child: Text("No notes available."));
        }
        return ListView.builder(
          itemCount: noteController.notesList.length,
          itemBuilder: (context, index) {
            final note = noteController.notesList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: ListTile(
                  title: Text(note['title']),
                  subtitle: Text(note['description']),
                  leading: CircleAvatar(
                    child: Text(note['title'][0]),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
