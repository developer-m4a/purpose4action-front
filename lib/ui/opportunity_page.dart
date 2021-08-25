import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:purpose4action/components/custom_drawer.dart';
import 'package:purpose4action/components/custom_toolbar.dart';
import 'package:purpose4action/components/primary_button.dart';
import 'package:purpose4action/model/opportunity.dart';

class OpportunityPage extends StatefulWidget {
  static const String route = '/opportunities';

  @override
  _OpportunityPageState createState() => _OpportunityPageState();
}

class _OpportunityPageState extends State<OpportunityPage> {
  bool _isActive = true;

  late List<Opportunity> opportunities;

  @override
  void initState() {
    super.initState();

    opportunities = [
      Opportunity("Title 1", "Description", "Note", "url", false),
      Opportunity("Title 2", "Description", "Note", "url", true),
      Opportunity("Title 3", "Description", "Note", "url", false),
      Opportunity("Title 4", "Description", "Note", "url", false),
      Opportunity("Title 5", "Description", "Note", "url", false),
      Opportunity("Title 6", "Description", "Note", "url", false),
      Opportunity("Title 7", "Description", "Note", "url", false),
      Opportunity("Title 8", "Description", "Note", "url", false),
      Opportunity("Title 9", "Description", "Note", "url", false),
      Opportunity("Title 10", "Description", "Note", "url", false),
      Opportunity("Title 11", "Description", "Note", "url", false),
      Opportunity("Title 12", "Description", "Note", "url", false),
      Opportunity("Title 13", "Description", "Note", "url", false),
      Opportunity("Title 14", "Description", "Note", "url", false),
      Opportunity("Title 15", "Description", "Note", "url", false)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
          appBar: CustomToolbar().build(context),
          drawer: CustomDrawer().build(context),
          body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 8),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Job titles, initiatives, keywords",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () => {},
                            icon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Location",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () => {},
                            icon: Icon(Icons.location_on_outlined),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        children: [
                          Switch(
                            value: _isActive,
                            onChanged: (value) {
                              setState(() {
                                _isActive = value;
                              });
                            },
                            activeColor: Theme.of(context).primaryColor,
                          ),
                          Text("Remote Work")
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xFFD4D4D4),
                    ),
                    TextButton(
                        onPressed: () {
                          /*...*/
                        },
                        child: Row(
                          children: [
                            Icon(Icons.sort),
                            Align(
                              alignment: Alignment.center,
                              child: Text("Most Recent",
                                  style: TextStyle(fontSize: 20.0),
                                  textAlign: TextAlign.center),
                            ),
                          ],
                        )),
                    Divider(
                      color: Color(0xFFD4D4D4),
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: opportunities.length,
                      itemBuilder: (context, index) {
                        return Card(
                            elevation: 4.0,
                            margin: EdgeInsets.only(top: 8, bottom: 8),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 16, bottom: 16, left: 8, right: 8),
                              child: Row(children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 16),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                    child: Image.asset('landing_1.png',
                                        width: 61,
                                        height: 61,
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        opportunities[index].title,
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(opportunities[index].description),
                                      Text(opportunities[index].note)
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () => {
                                        setState(() {
                                          opportunities[index].loved = !opportunities[index].loved;
                                        })
                                      },
                                      child: getLikeStatus(
                                          opportunities[index].loved),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(right: 20.0),
                                        child: PrimaryButton(
                                          text: "Apply",
                                          minHeight: 16.0,
                                          minWidth: 64.0,
                                          padding: EdgeInsets.only(
                                              top: 8.0, bottom: 8.0),
                                        )),
                                  ],
                                ),
                              ]),
                            ));
                      },
                    ),
                  ],
                )),
          ),
        ));
  }

  Widget getLikeStatus(bool status) {
    return (status) ? Icon(Icons.favorite) : Icon(Icons.favorite_border);
  }
}
