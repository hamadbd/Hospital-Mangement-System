import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonehospital/providers/medication_provider.dart';
import 'package:provider/provider.dart';
import '../../constant/sizedbox.dart';

class MedicationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MedicationProvider>(
      create: (_) => MedicationProvider(),
      child: Consumer<MedicationProvider>(
        builder: (_, provObj, __) => provObj.loading == true
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ))
            : Scaffold(
          body: provObj.isAny?SingleChildScrollView(
            child: Container(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeightSizedBox(h: 0.2),
                    Text("    Medication Prescribed", style: TextStyle(fontSize: 16)),
                    Divider(
                      thickness: 1,
                      indent: 10,
                      endIndent: 60,
                      color: Colors.black,
                    ),
                    HeightSizedBox(h: 0.1),
                    Text("  Full Name"),
                    Padding(
                      padding: EdgeInsets.all(13.0),
                      child: TextField(
                        enabled: false,
                        style: TextStyle(
                            fontSize: 15, height: 0.6, color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: provObj.listPatient[0].fullName,
                        ),
                      ),
                    ),
                    Text("  ID"),
                    Padding(
                      padding: EdgeInsets.all(13.0),
                      child: TextField(
                        enabled: false,
                        style: TextStyle(
                            fontSize: 15, height: 0.6, color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: provObj.listPatient[0].natId,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text("BirthDate"),
                            Padding(
                              padding: EdgeInsets.all(13.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: TextField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  enabled: false,
                                  style: TextStyle(
                                      fontSize: 15,
                                      height: 0.6,
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: provObj.listPatient[0].birthDate,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text("Age"),
                            Padding(
                              padding: EdgeInsets.all(13.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: TextField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  enabled: false,
                                  style: TextStyle(
                                      fontSize: 15,
                                      height: 0.6,
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: provObj.listPatient[0].age,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Text("  Prescribed"),
                    Padding(
                      padding: EdgeInsets.all(13.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        enabled: false,
                        style:
                        TextStyle(fontSize: 15, height: 2, color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: provObj.listMedication[0].prescribed,
                        ),
                      ),
                    ),


                    Center(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),),
                        onPressed: () {
                          provObj.updateMedicationStatus(provObj.listMedication[0].id.toString(), context);
                        },
                        icon: Icon(LineAwesomeIcons.share, size: 23),
                        label: Text("Approve Prescribed"),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ):Container(child: Center(child: Text("No Any Requests")),
        ),
      ),
    ));
  }
}
