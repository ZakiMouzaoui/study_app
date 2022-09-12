import 'package:cloud_firestore/cloud_firestore.dart';

final fireStore = FirebaseFirestore.instance;
final questionPaperRef = fireStore.collection("quiz_papers");

DocumentReference questionPaperRF({
  required paperId,
  required questionId
}) => questionPaperRef.doc(paperId).collection("questions").doc(questionId);

final userRef = fireStore.collection("users");