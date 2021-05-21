import 'package:flutter/material.dart';
import 'package:flutter_app/model/band_list.dart';
import 'package:flutter_app/screens/new_event_screen.dart';
import 'package:flutter_app/utils/app_colors.dart';
import 'package:flutter_app/widgets/slow_starter_wdiget.dart';
import 'package:flutter_app/widgets/view_with_toggle_switch.dart';

class BandSelectionScreen extends StatefulWidget {
  @override
  _BandSelectionScreenState createState() => _BandSelectionScreenState();
}

class _BandSelectionScreenState extends State<BandSelectionScreen> {
  List<BandList> bandList = [
    BandList(bandName: "The Slowstarters", select: true),
    BandList(bandName: "Blue Moon Band", select: false),
    BandList(bandName: "Rozi Bak Band", select: false),
    BandList(bandName: "Brooks & Dunn", select: false),
    BandList(bandName: "Cultural Band", select: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 12, left: 12, right: 12),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 50,
                color: AppColors.lightPurple,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 32,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Search Band",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                color: AppColors.darkGray,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColors.darkPurple,
                          ),
                          hintText: "Band name",
                          hintStyle: TextStyle(color: AppColors.lightGray),
                        ),
                      ),
                    ),
                    FlatButton(
                        height: 45,
                        color: Colors.white,
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_circle,
                              color: AppColors.darkPurple,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "Add\nNew",
                              style: TextStyle(color: AppColors.darkPurple),
                            ),
                          ],
                        )),
                    SizedBox(
                      width: 4,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Column(
                children: [
                  for (int index = 0; index < bandList.length; index++)
                    Container(
                      margin: EdgeInsets.only(
                        top: index == 0 ? 0 : 12,
                      ),
                      child: SlowStarterWidget(
                        title: bandList[index].bandName,
                        check: bandList[index].select,
                        onClick: (value) {
                          setState(() {
                            for (int ing = 0; ing < bandList.length; ing++) {
                              if (bandList[ing].bandName != value) {
                                bandList[ing].select = false;
                              }
                            }
                            for (int ing = 0; ing < bandList.length; ing++) {
                              if (bandList[ing].bandName == value) {
                                bandList[ing].select = !bandList[ing].select;
                                break;
                              }
                            }
                          });
                        },
                      ),
                    ),
                ],
              ),
              Expanded(
                  child: SizedBox(
                height: 10,
              )),
              Container(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 48, right: 48),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  gradient: new LinearGradient(
                      colors: [
                        AppColors.darkPurple,
                        AppColors.lightPurple,
                      ],
                      begin: const FractionalOffset(1.0, 1.1),
                      end: const FractionalOffset(0.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
