import 'package:corentry/logic/Controller.dart';
import 'package:corentry/models/Company.dart';
import 'package:corentry/widgets/EventAvatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  List<Company> _companies = [];

  void initState() {
    super.initState();
    print("### INIT EXPLORE SCREEN");
    Controller().companyBLOC.addListener(_updateData);
    Controller().companyBLOC.fetchCompanies();
  }

  void _updateData() {
    List<Company> companies = Controller().companyBLOC.companies;
    setState(() {
      this._companies = companies;
    });
  }

  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: Controller().theming.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Controller().theming.secondary,
          title: Row(
            children: <Widget>[
              GestureDetector(
                child: new Icon(
                  Icons.home,
                  size: 28,
                  color: Controller().theming.primary,
                ),
                onTap: () {},
              ),
              SizedBox(width: 24.0),
              GestureDetector(
                child: Text(
                  'Home',
                  style: TextStyle(
                    fontFamily: 'Lato light',
                    color: Controller().theming.primary,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              color: Controller().theming.primary,
              icon: Icon(Icons.search, size: 26),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: Controller().companyBLOC.fetchCompanies,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: RaisedButton(
                onPressed: () {},
                color: Controller().theming.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: BorderSide(color: Colors.transparent),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Impuls',
                              style: TextStyle(
                                fontSize: 28,
                                color: Controller().theming.secondary,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Eingang um 12:30 Uhr',
                        style: TextStyle(
                          fontSize: 14,
                          color: Controller().theming.secondary,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Verfügbare Entries',
                  style: TextStyle(
                    color: Controller().theming.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: this._companies.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    EventFeedItem(this._companies[index]),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void dispose() {
    Controller().companyBLOC.removeListener(_updateData);
    super.dispose();
  }

  bool get wantKeepAlive => true;
}

class EventFeedItem extends StatefulWidget {
  final Company _company;

  EventFeedItem(this._company);

  _EventFeedItemState createState() => new _EventFeedItemState();
}

class _EventFeedItemState extends State<EventFeedItem> {
  bool isLiked;

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/entry');
      },
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 180,
                  child: EventAvatar(
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 20,
                    color: Controller().theming.primary,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            this.widget._company.name,
                            style: TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 1),
                          ),
                          Icon(
                            Icons.directions_run,
                            size: 28,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(),
                ),
              ],
            ),
            //start info
            (Controller().authentificator.user.companies.contains(this.widget._company.companyID)
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.group, size: 28, color: Controller().theming.primary),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 4, 0, 0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          this.widget._company.currentVisitors.toString(),
                                          textAlign: TextAlign.left,
                                          style: TextStyle(fontSize: 20, color: Controller().theming.primary),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          'aktuelle Besucher',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Controller().theming.primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.calendar_today, size: 26, color: Controller().theming.primary),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 4, 0, 0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        this.widget._company.todaysVisitors.toString(),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 20, color: Controller().theming.primary),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        'heutige Besucher',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Controller().theming.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : SizedBox.shrink()),
            Divider(),
          ],
        ),
      ),
    );
  }
}
