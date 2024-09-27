import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:note_app/ui/pages/home_page.dart';

import '../ui/style/app_styles.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final box = GetStorage();

  signUp(name, email, password, context) async {
    AppStyles().progressDialog(context);
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user!.uid.isNotEmpty) {
        CollectionReference collectionReference =
            FirebaseFirestore.instance.collection('users');
        collectionReference
            .doc(email)
            .set({
          'uid': credential.user!.uid,
          'email': email,
          'name': name
            });

        Map user = {
          'uid': credential.user!.uid,
          'email': email,
          'name': name
        };

        box.write('user', user);
        print(box.read('user'));
        context.pop();
        context.go('/home');
        Get.showSnackbar(AppStyles().successSnacBar('SignUp Successfully'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        context.pop();
        Get.showSnackbar(
            AppStyles().failedSnacBar('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        context.pop();
        Get.showSnackbar(AppStyles()
            .failedSnacBar('The account already exists for that email.'));
      }
    } catch (e) {
      context.pop();
      Get.showSnackbar(AppStyles().failedSnacBar(e));
    }
  }

  login(email, password, context) async {
    AppStyles().progressDialog(context);
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user!.uid.isNotEmpty) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(email)
            .get()
            .then((DocumentSnapshot<Map<String, dynamic>> doc) {
          if (doc.exists) {
            var data = doc.data();
            print(data);
            Map user = {
              'uid': data!['uid'],
              'email': data['email'],
              'name': data['name']
            };
            box.write('user', user);
            print(user);
            context.pop();
            context.go('/home');
            Get.showSnackbar(AppStyles().successSnacBar('Login successfull'));
          } else {
            Get.showSnackbar(AppStyles()
                .failedSnacBar('document does not exist on the database.'));
          }
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        context.pop();
        Get.showSnackbar(
            AppStyles().failedSnacBar('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        context.pop();
        Get.showSnackbar(AppStyles()
            .failedSnacBar('Wrong password provided for that user.'));
      }
    }
  }


  logout() async {
    _auth.signOut();
  }
}
