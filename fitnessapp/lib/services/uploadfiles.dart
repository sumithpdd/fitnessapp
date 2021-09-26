import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:path/path.dart' as p;

class UploadFiles {
  late FirebaseStorage storage;
  String? phonenumber;
  String idea;
  String id;
  bool? _filesent;
  UploadFiles(this.id, this.idea) {
    storage = FirebaseStorage.instance;
    final FirebaseAuth auth = FirebaseAuth.instance;
    phonenumber = auth.currentUser?.phoneNumber!;
    _filesent = false;
  }
  Future<bool> getPdfAndUpload() async {
    print('Inside Upload PDF method');
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result != null) {
      File? file = File(result.files.single.path!);
      String fileName = p.basename(file.path);
      print('Filename is $fileName');
      // Upload file
      try {
        await storage.ref('$phonenumber/$idea/$fileName').putFile(file);
        _filesent = true;
      } on firebase_core.FirebaseException catch (e) {
        print(e);
        _filesent = false;
      }
    }
    return _filesent!;
  }
}
