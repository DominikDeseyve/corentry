import 'package:corentry/models/Company.dart';

enum ActivityType { IN, OUT }

class Activity {
  String _activityID;
  DateTime _date;
  Company _company;
  ActivityType _activityType;

  Activity(this._company, this._date, this._activityType);

  Activity.fromFirestore(dynamic pSnap) {
    this._activityID = pSnap.documentID;
    this._date = DateTime.fromMillisecondsSinceEpoch(pSnap['date'].seconds * 1000);
    this._company = Company.fromFirestore(pSnap['company']);
    this._activityType = (pSnap['type'] == 'ActivityType.IN' ? ActivityType.IN : ActivityType.OUT);
  }

  Map<String, dynamic> toFirestore() {
    return {
      'date': this._date,
      'company': company.toFirestore(),
      'type': this._activityType.toString(),
    };
  }

  //***************************************************//
  //*********   GETTER
  //***************************************************//
  String get activityID => this._activityID;

  Company get company => this._company;

  DateTime get date => this._date;

  ActivityType get activityType => this._activityType;
}
