import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetCloudFiles {
  late FirebaseStorage _storage;
  late String idea;
  late FirebaseAuth _auth;
  GetCloudFiles(String idea) {
    _storage = FirebaseStorage.instance;
    this.idea = idea;
    _auth = FirebaseAuth.instance;
  }
  Future<List<String>> getFileNames() async {
    // print('Inside get file names');
    List<String> _files = [];
    String? phonenumber = _auth.currentUser?.phoneNumber!;
    try {
      ListResult result = await _storage.ref('$phonenumber/$idea/').listAll();
      result.items.forEach((Reference ref) {
        //  print('Let\'s see the fileName: ${ref.toString().split('/')[2]}');
        // print('Let\'s see the fileName: ${ref.fullPath.toString()}');
        String filepath = ref.fullPath.toString();
        _files.add(filepath);
        //  print('Found file: $filepath');
      });
    } catch (e) {
      print('Unable to retrieve directories');
      return [];
    }
    return _files;
  }
}
