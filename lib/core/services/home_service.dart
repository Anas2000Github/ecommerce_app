
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService{

  final CollectionReference _collectionReferenceCategory =
  FirebaseFirestore.instance.collection('Categories');

  final CollectionReference _collectionReferenceProduct =
  FirebaseFirestore.instance.collection('Products');

  final CollectionReference _collectionReferenceShoes =
  FirebaseFirestore.instance.collection('shoes');

  final CollectionReference _collectionReferenceGlasses =
  FirebaseFirestore.instance.collection('glasses');

  final CollectionReference _collectionReferenceWristwatch =
  FirebaseFirestore.instance.collection('wristwatch');


  Future<List<QueryDocumentSnapshot>> getCategory()async{
  var value = await  _collectionReferenceCategory.get();

  return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBesSelling()async{
    var value = await  _collectionReferenceProduct.get();

    return value.docs;
  }
  Future<List<QueryDocumentSnapshot>> getShoes()async{
    var value = await  _collectionReferenceShoes.get();

    return value.docs;
  }  Future<List<QueryDocumentSnapshot>> getGlasses()async{
    var value = await  _collectionReferenceGlasses.get();

    return value.docs;
  }
  Future<List<QueryDocumentSnapshot>> getWristwatch()async{
    var value = await  _collectionReferenceWristwatch.get();

    return value.docs;
  }
}

