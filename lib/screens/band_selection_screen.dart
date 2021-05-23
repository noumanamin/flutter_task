import 'package:flutter/material.dart';
import 'package:flutter_app/model/band_model.dart';
import 'package:flutter_app/screens/new_event_screen.dart';
import 'package:flutter_app/utils/app_colors.dart';
import 'package:flutter_app/utils/contants.dart';
import 'package:flutter_app/widgets/slow_starter_wdiget.dart';
import 'package:flutter_app/widgets/view_with_toggle_switch.dart';

class BandSelectionScreen extends StatefulWidget {
  final ValueChanged<String> submit;

  BandSelectionScreen({Key key, this.submit}) : super(key: key);

  @override
  _BandSelectionScreenState createState() => _BandSelectionScreenState();
}

class _BandSelectionScreenState extends State<BandSelectionScreen> {
  int size = 50;

  @override
  Widget build(BuildContext context) {
    size = 50;
    int selectedCount = getCount() + 1;
    size = size * selectedCount;

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: size + (110 * bandList.length).toDouble(),
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
                          check: bandList[index].selected,
                          dateModel: bandList[index].dateModel,
                          onClick: (value) {
                            setState(() {
                              // for (int ing = 0; ing < bandList.length; ing++) {
                              //   if (bandList[ing].bandName != value) {
                              //     bandList[ing].selected = false;
                              //   }
                              // }
                              for (int ing = 0; ing < bandList.length; ing++) {
                                if (bandList[ing].bandName == value) {
                                  bandList[ing].selected =
                                      !bandList[ing].selected;
                                  break;
                                }
                              }
                            });
                          },
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    widget.submit("");
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, left: 48, right: 48),
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
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  int getCount() {
    int count = 0;
    for (int index = 0; index < bandList.length; index++) {
      if (bandList[index].selected) {
        count = count + 1;
      }
    }

    return count - 2 < 0 ? 0 : count - 2;
  }
}
