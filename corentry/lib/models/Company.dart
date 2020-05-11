class Company {
  String _companyID;

  String _name;
  int _currentVisitors;
  int _todayVisitors;

  Company.fromFirestore(dynamic pSnap) {
    this._companyID = (pSnap['companyID'] != null ? pSnap['companyID'] : pSnap.documentID);
    this._name = pSnap['name'];
    this._currentVisitors = pSnap['current_visitor'];
    this._todayVisitors = pSnap['today_visitor'];
  }
  Map<String, dynamic> toFirestore() {
    return {
      'companyID': this._companyID,
      'name': this._name,
    };
  }

  //***************************************************//
  //*********   SETTER
  //***************************************************//
  set currentVisitors(int pCurrentVisitors) {
    this._currentVisitors = pCurrentVisitors;
  }

  set todaysVisitors(int pTodaysVisitors) {
    this._todayVisitors = pTodaysVisitors;
  }

  //***************************************************//
  //*********   GETTER
  //***************************************************//
  String get companyID => this._companyID;

  String get name => this._name;

  int get currentVisitors => this._currentVisitors;

  int get todaysVisitors => this._todayVisitors;
}
