import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/const/app_strings.dart';
import '../../controllers/note_controller.dart';


class AddNotePage extends StatelessWidget {
  final _controller = Get.put(NoteController());
  final  _titleController = TextEditingController();
  final  _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppString.addNote)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: _titleController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'Title'),

            ),
            SizedBox(height: 20,),
            TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                    labelText: 'Description'
                )),
            SizedBox(height: 16),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  _controller.addNotes(_titleController.text, _descriptionController.text);
                  context.go('/home');
                },
                child: Text('Add Note'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
