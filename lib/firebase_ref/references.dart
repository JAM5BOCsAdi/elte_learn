import 'package:elte_learn/packages_barrel/packages_barrel.dart';

final fireStore = FirebaseFirestore.instance;

final questionPaperRef = fireStore.collection("questionPapers");

final userRef = fireStore.collection("users");

Reference get firebaseStorage => FirebaseStorage.instance.ref();

DocumentReference questionRef({
  required String paperId,
  required String questionId,
}) =>
    questionPaperRef.doc(paperId).collection("questions").doc(questionId);
