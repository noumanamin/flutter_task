import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/band_selection_screen.dart';
import 'package:flutter_app/screens/new_event_screen.dart';
import 'package:flutter_app/utils/app_colors.dart';
import 'package:flutter_app/utils/contants.dart';
import 'package:flutter_app/widgets/date_time_selection_widget.dart';
import 'package:flutter_app/widgets/selected_band_widget.dart';
import 'package:flutter_app/widgets/slow_starter_wdiget.dart';
import 'package:flutter_app/widgets/view_with_toggle_switch.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class NewEventScreen extends StatefulWidget {
  @override
  _NewEventScreenState createState() => _NewEventScreenState();
}

class _NewEventScreenState extends State<NewEventScreen> {
  int _currentIndex = 0;

  List<File> fileList = [null, null, null];
  File _image;
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  String startDate = "Event Start Date";
  String endDate = "Event End Date";
  String startTime = "Event Start Time";
  String endTime = "Event End Time";

  TimeOfDay selectedStartTime = TimeOfDay(hour: 00, minute: 00);
  TimeOfDay selectedEndTime = TimeOfDay(hour: 00, minute: 00);

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
      fileList[_currentIndex] = _image;
    });
  }

  _imgFromGallery() async {
    _image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      fileList[_currentIndex] = _image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          margin: EdgeInsets.only(top: 12, left: 12, right: 12),
          color: Colors.white,
          child: SingleChildScrollView(
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
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.darkGray,
                  padding: EdgeInsets.only(top: 0),
                  child: CarouselSlider(
                      items: [1, 2, 3].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return checkNull()
                                ? Image.file(
                                    fileList[_currentIndex],
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                  )
                                : Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Upload 3 cover size pictures for event",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          _showPicker(context);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 6,
                                              bottom: 6,
                                              left: 16,
                                              right: 16),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 2,
                                                  color: AppColors.darkPurple)),
                                          child: Text(
                                            "Upload",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 150,
                        aspectRatio: 16 / 5,
                        viewportFraction: 1.0,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        reverse: false,
                        autoPlay: false,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        onPageChanged: (index, value) {
                          print("");
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        scrollDirection: Axis.horizontal,
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [1, 2, 3].map((url) {
                    int index = [1, 2, 3].indexOf(url);
                    return Container(
                      width: 12.0,
                      height: 12.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? AppColors.darkPurple
                            : AppColors.lightGray,
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 24,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Event Name",
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        color: AppColors.darkPurple,
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Event Description",
                      prefixIcon: Icon(
                        Icons.description,
                        color: AppColors.darkPurple,
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Venue",
                      prefixIcon: Icon(
                        Icons.location_pin,
                        color: AppColors.darkPurple,
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Select a location",
                      suffixIcon: Icon(
                        Icons.gps_fixed,
                        color: AppColors.darkPurple,
                      )),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          DateSelect((value) {
                            setState(() {
                              startDate = value;
                            });
                          }, selectedStartDate);
                        },
                        child: DateTimeSelectionWidget(
                          prefixIcon: Icon(
                            Icons.calendar_today_sharp,
                            color: AppColors.darkPurple,
                          ),
                          title: Text(startDate),
                          sufixIcon: SvgPicture.asset(
                            "assets/icons/down_arrow_button.svg",
                            color: AppColors.darkPurple,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          await DateSelect((value) {
                            setState(() {
                              endDate = value;
                            });
                          }, selectedEndDate);
                        },
                        child: DateTimeSelectionWidget(
                          prefixIcon: Icon(
                            Icons.calendar_today_sharp,
                            color: AppColors.darkPurple,
                          ),
                          title: Text(endDate),
                          sufixIcon: SvgPicture.asset(
                            "assets/icons/down_arrow_button.svg",
                            color: AppColors.darkPurple,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _selectTime((value) {
                            setState(() {
                              startTime = value;
                            });
                          }, selectedStartTime);
                        },
                        child: DateTimeSelectionWidget(
                          prefixIcon: SvgPicture.asset(
                            "assets/icons/wall_clock.svg",
                            color: AppColors.darkPurple,
                            width: 24,
                            height: 24,
                          ),
                          title: Text(startTime),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          await _selectTime((value) {
                            setState(() {
                              endTime = value;
                            });
                          }, selectedEndTime);
                        },
                        child: DateTimeSelectionWidget(
                          prefixIcon: SvgPicture.asset(
                            "assets/icons/wall_clock.svg",
                            color: AppColors.darkPurple,
                            width: 24,
                            height: 24,
                          ),
                          title: Text(endTime),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BandSelectionScreen(submit: (value) {
                          setState(() {});
                        }),
                      ),
                    );
                  },
                  child: DateTimeSelectionWidget(
                    hide: getList().isEmpty ? false : true,
                    prefixIcon: SvgPicture.asset(
                      "assets/icons/microphone_with_wire.svg",
                      color: AppColors.darkPurple.withOpacity(getOpacity()),
                      width: 24,
                      height: 24,
                    ),
                    title: Text(
                      getList().isEmpty ? "Band" : "Your selected bands",
                      style: TextStyle(
                          color: AppColors.darkPurple.withOpacity(getOpacity()),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                getList().isEmpty
                    ? Container(
                        width: 0,
                        height: 0,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (int index = 0; index < getLength(); index++)
                            SelectedBandWidget(index: index)
                        ],
                      ),
                if (getList().isNotEmpty)
                  SizedBox(
                    height: 12,
                  ),
                if (getList().isNotEmpty && getList().length > 3)
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.topRight,
                    child: Text(
                      "...View all",
                      style: TextStyle(color: AppColors.dartGrayOne),
                    ),
                  ),
                DateTimeSelectionWidget(
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/ticket.svg",
                    color: AppColors.darkPurple,
                    width: 24,
                    height: 24,
                  ),
                  hide: false,
                  title: Text(
                    "Ticket Url",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
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

  bool checkNull() {
    return fileList.isEmpty
        ? false
        : fileList[_currentIndex] == null
            ? false
            : true;
  }

  // ignore: non_constant_identifier_names
  Future<void> DateSelect(ValueChanged<String> select, DateTime initial) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: initial,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      final format = DateFormat('dd MMM yyyy');
      final clockString = format.format(picked);
      select(clockString);
    }
  }

  Future<Null> _selectTime(
      ValueChanged<String> select, TimeOfDay initial) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: initial,
    );
    if (picked != null) {
      print("");
      String time = picked.hour.toString().padLeft(2, "0") +
          ":" +
          picked.minute.toString().padLeft(2, "0");
      String dateTimeString = '2020-07-17T' + time;
      final dateTime = DateTime.parse(dateTimeString);

      final format = DateFormat('HH:mm a');
      final clockString = format.format(dateTime);

      select(clockString == "00:00 AM" ? "12:00 AM" : clockString);

      print(clockString);
    }
  }

  double getOpacity() {
    return getList().isEmpty ? 1 : 0.35;
  }

  int getLength() {
    return getList().length <= 3 ? getList().length : 3;
  }
}
