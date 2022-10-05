import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

/// FireBase References -> Refers to the collections in FireStore
final fireStore = FirebaseFirestore.instance;

/// Creates questionPapers collection
final questionPaperRef = fireStore.collection("questionPapers");

/// Creates questions collection in each document
// New collection
DocumentReference questionRef({
  required String paperId,
  required String questionId,
}) =>
    questionPaperRef.doc(paperId).collection("questions").doc(questionId);

/// Reference to FirebaseStorageService
Reference get firebaseStorage => FirebaseStorage.instance.ref();
