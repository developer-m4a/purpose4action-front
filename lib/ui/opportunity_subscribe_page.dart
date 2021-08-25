import 'dart:collection';
import 'dart:html';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:purpose4action/components/custom_drawer.dart';
import 'package:purpose4action/components/custom_toolbar.dart';
import 'package:purpose4action/components/header.dart';
import 'package:purpose4action/components/paragraph.dart';
import 'package:purpose4action/components/primary_button.dart';
import 'package:purpose4action/components/secondary_button.dart';
import 'package:purpose4action/model/opportunity.dart';

class OpportunitySubscribePage extends StatefulWidget {
  static const String route = '/opportunities/subscribe';

  @override
  _OpportunitySubscribePageState createState() => _OpportunitySubscribePageState();
}

class _OpportunitySubscribePageState extends State<OpportunitySubscribePage> {
  bool _isActive = true;
  PlatformFile? file;

  late List<Opportunity> opportunities;
  Opportunity _opportunity = Opportunity("Title 1", "Description", "Note", "url", false);

  @override
  void initState() {
    super.initState();
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
                  Header(
                    text: "Apply to ${_opportunity.title}",
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Column(
                      children: [
                        Paragraph(
                          text: "Full Name",
                          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                          textAlign: TextAlign.left,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Eg. Sophia Ferreira",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                        ),
                      ]
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Column(
                      children: [
                        Paragraph(
                          text: "Email",
                          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                          textAlign: TextAlign.left,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Eg. my@email.com",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                        ),
                      ]
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Column(
                      children: [
                        Paragraph(
                          text: "Message",
                          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                          textAlign: TextAlign.left,
                        ),
                        TextField(
                          keyboardType: TextInputType.multiline,
                          minLines: 5,
                          maxLines: 5,
                          maxLength: 250,
                          decoration: InputDecoration(
                            hintText: "Type here...",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                        ),
                      ]
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Column(
                        children: [
                          Paragraph(
                            text: "Upload CV ( Optional )",
                            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            textAlign: TextAlign.left,
                          ),
                          SecondaryButton(text: "Choose File (${(file != null) ? "selected - ${file!.name}" : "no file selected"})", onPressed: loadFile)
                        ]
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: PrimaryButton(text: "Send Application", onPressed: () => {

                    }),
                  ),
                ]
              )
          ),
        ),
      )
    );
  }

  Future<void> loadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );

    if (result != null) {
      setState(() {
        file = result.files.single;
        print(file?.name);
        print(file?.bytes);
        print(file?.size);
        print(file?.extension);
        print(file?.path);
      });
    } else {
      // User canceled the picker
    }
  }

  Widget getLikeStatus(bool status) {
    return (status) ? Icon(Icons.favorite) : Icon(Icons.favorite_border);
  }

}