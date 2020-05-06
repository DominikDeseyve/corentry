import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corentry/models/User.dart';

class Firebase {
  Firestore _firestoreRef;
  Source _source;

  Firebase() {
    this._firestoreRef = Firestore.instance;
    this._source = Source.serverAndCache;
  }

  Future<User> getUserData(String pUID) async {
    DocumentSnapshot pUserSnap = await _firestoreRef.collection('user').document(pUID).get(source: this._source);
    return User.fromFirebase(pUserSnap);
  }
}
