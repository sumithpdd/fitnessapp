import 'package:firebase_storage/firebase_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class DeleteandDownloadFiles {
  FirebaseStorage? _ref;
  String? filepath;
  String? fileurl;

  DeleteandDownloadFiles(String filepath) {
    this.filepath = filepath;
    _ref = FirebaseStorage.instance;
  }

  Future<bool> getUrl() async {
    try {
      this.fileurl = await _ref?.ref(filepath).getDownloadURL();
      print('Retrieved download URL: ${this.fileurl}');
      return true;
    } catch (e) {
      print('Failed to get download url with error: $e');
      return false;
    }
  }

  Future<bool> downloadFile() async {
    bool urlStatus = await getUrl();
    if (urlStatus) {
      await launch(fileurl!);
      return true;
    }
    return false;
  }

  Future<bool> deletefromStorage() async {
    try {
      await _ref?.ref(this.filepath).delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
