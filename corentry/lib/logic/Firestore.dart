import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corentry/logic/Controller.dart';
import 'package:corentry/models/Activty.dart';
import 'package:corentry/models/Company.dart';
import 'package:corentry/models/User.dart';

class Firebase {
  Controller _controller;
  Firestore _firestoreRef;
  Source _source;

  Firebase(Controller pController) {
    this._controller = pController;
    this._firestoreRef = Firestore.instance;
    this._source = Source.serverAndCache;
  }

  Future<User> getUserData(String pUID) async {
    DocumentSnapshot pUserSnap = await _firestoreRef.collection('user').document(pUID).get(source: this._source);
    return User.fromFirebase(pUserSnap);
  }

  Future<List<Company>> getCompanies() async {
    List<Company> companies = [];
    await _firestoreRef.collection('companies').getDocuments(source: this._source).then((QuerySnapshot pQuery) {
      pQuery.documents.forEach((DocumentSnapshot pSnap) {
        companies.add(Company.fromFirestore(pSnap));
      });
    });

    return companies;
  }

  Future<Activity> runScan(String pCode, pUserID) async {
    QuerySnapshot query = await _firestoreRef.collection('companies').where('code', isEqualTo: pCode).getDocuments(source: this._source);
    if (query.documents.length == 0) print("code not found");
    Company company = Company.fromFirestore(query.documents[0]);

    DocumentSnapshot isUserVisiting = await _firestoreRef.collection('companies').document(company.companyID).collection('visitors').document(pUserID).get(source: this._source);
    Activity activity;
    if (isUserVisiting.exists) {
      activity = Activity(company, DateTime.now(), ActivityType.OUT);
      this._controller.companyBLOC.leaveCompany(activity);

      await this._firestoreRef.collection('user').document(pUserID).collection('entries').add(activity.toFirestore());
      await this._firestoreRef.collection('companies').document(activity.company.companyID).collection('visitors').document(pUserID).delete();
    } else {
      activity = Activity(company, DateTime.now(), ActivityType.IN);
      this._controller.companyBLOC.entryCompany(activity);

      await this._firestoreRef.collection('user').document(pUserID).collection('entries').add(activity.toFirestore());
      await this._firestoreRef.collection('companies').document(activity.company.companyID).collection('visitors').document(pUserID).setData({});
    }
    return activity;
  }

  Future<List<Activity>> getActivities(String pUID) async {
    List<Activity> activities = [];
    await _firestoreRef.collection('user').document(pUID).collection('entries').orderBy('date', descending: true).getDocuments(source: this._source).then((QuerySnapshot pQuery) {
      pQuery.documents.forEach((DocumentSnapshot pSnap) {
        activities.add(Activity.fromFirestore(pSnap));
      });
    });
    return activities;
  }

  Future<void> updateCode(String pCompanyID, String pCode) async {
    await this._firestoreRef.collection('companies').document(pCompanyID).setData({'code': pCode});
  }

  Stream<QuerySnapshot> streamGuest(String pCompanyID) {
    print(pCompanyID);
    return this._firestoreRef.collection('companies').document(pCompanyID).collection('visitors').snapshots();
  }

  Future<void> deleteActivity(Activity pActivity) async {
    String userID = Controller().authentificator.user.userID;
    await this._firestoreRef.collection('user').document(userID).collection('entries').document(pActivity.activityID).delete();
  }
}
