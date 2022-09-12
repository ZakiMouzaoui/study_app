import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class FirebaseStorageService extends GetxService{
  Reference get firebaseStorage => FirebaseStorage.instance.ref();

  Future<String?> getImage(String? imageUrl)async{
    if(imageUrl == null){
      return null;
    }
    try{
      final urlRef = firebaseStorage.child('question_paper_images').child('${imageUrl.toLowerCase()}.png');
      final urlPath = await urlRef.getDownloadURL();
      return urlPath;
    }
    catch(e){
      return null;
    }
  }
}
