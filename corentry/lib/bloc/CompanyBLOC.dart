import 'package:corentry/logic/Controller.dart';
import 'package:corentry/models/Activty.dart';
import 'package:corentry/models/Company.dart';
import 'package:flutter/foundation.dart';

class CompanyBLOC extends ChangeNotifier {
  Controller _controller;
  List<Company> _companies = [];

  CompanyBLOC(this._controller);

  Future<void> fetchCompanies() async {
    this._companies = await this._controller.firebase.getCompanies();
    notifyListeners();
  }

  void entryCompany(Activity pActivity) {
    print(pActivity.company.name);
    int index = this._companies.indexWhere((company) => company.companyID == pActivity.company.companyID);
    this._companies[index].currentVisitors++;
    this._companies[index].todaysVisitors++;
    notifyListeners();

    Controller().activitiesBLOC.add(pActivity);
  }

  void leaveCompany(Activity pActivity) {
    int index = this._companies.indexWhere((company) => company.companyID == pActivity.company.companyID);

    this._companies[index].currentVisitors--;
    notifyListeners();

    Controller().activitiesBLOC.add(pActivity);
  }

  //***************************************************//
  //*********   GETTER
  //***************************************************//
  List<Company> get companies => this._companies;
}
