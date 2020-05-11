import 'package:corentry/logic/Controller.dart';
import 'package:corentry/models/Activty.dart';
import 'package:flutter/foundation.dart';

class ActivitiesBLOC extends ChangeNotifier {
  Controller _controller;
  List<Activity> _activities = [];

  ActivitiesBLOC(this._controller);

  Future<void> fetchAtivities() async {
    this._activities = await this._controller.firebase.getActivities(Controller().authentificator.user.userID);
    notifyListeners();
  }

  void add(Activity pActivity) {
    this._activities.add(pActivity);
    this._sort();
    notifyListeners();
  }

  void delete(Activity pActivity) {
    Controller().firebase.deleteActivity(pActivity);
    this._activities.removeWhere((activity) => activity.activityID == pActivity.activityID);
    notifyListeners();
  }

  void _sort() {
    this._activities.sort((a, b) {
      return b.date.compareTo(a.date);
    });
  }

  //***************************************************//
  //*********   GETTER
  //***************************************************//
  List<Activity> get activities => this._activities;
}
