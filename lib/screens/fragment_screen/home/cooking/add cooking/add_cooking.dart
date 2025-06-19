import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_checker/screens/widget/common_button.dart';
import 'package:food_checker/screens/widget/text_field.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/Constrants/color.dart';
import '../../../../../generated/assets.dart';
import '../../../../widget/card.dart';
import '../../../../widget/text.dart';
import 'add_cooking_controller.dart';

class AddCooking extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => addCooking();
}

List<String> temperature = ["18°C", "19°C", "20°C", "21°C", "22°C"];
late String Selected = temperature[2]; // Default to 20°C
List<String> employees = [
  "Nikhil Raj",
  "Priya Sharma",
  "Amit Kumar",
  "Sara Lee",
];
late String selectedEmployee = employees[0]; // Default selection

class addCooking extends State<AddCooking> {
  late final add_cooking_controller _controller;

  Future<void> pickImage() async {
    showModalBottomSheet(
      context: context,
      builder:
          (BuildContext) => SafeArea(
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Gallery'),
              onTap: () async {
                Navigator.pop(context);
                await _controller.PickedImage(ImageSource.gallery);
                setState(() {});
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text("Camera"),
              onTap: () async {
                Navigator.pop(context);
                await _controller.PickedImage(ImageSource.camera);
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }

  void addNewCooking() {
    if (_controller.isValid) {
      final newCooking = fragmentCommCard(
        imagePath:
        _controller.UploadedImage != null
            ? _controller.UploadedImage!.path
            : Assets.imagesBydefaultUser,
        subText: _controller.Recipe.text,
        temp: _controller.Temperature.text,
        titalText: _controller.DishName.text,
      );
      Navigator.pop(context, newCooking);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Fill All The Details Prpperly")));
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = add_cooking_controller();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 90,
              width: ScreenWight,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: graycol.withOpacity(0.3),
                    blurRadius: 5,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 105),
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                        commonText(
                          text: "Add Cooking",
                          txtSize: 20,
                          color: black,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 18, right: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonText(text: "Image", txtSize: 14),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 16),
                    child: GestureDetector(
                      onTap: pickImage,
                      child: DottedBorder(
                        color: green,
                        strokeWidth: 1.5,
                        borderType: BorderType.RRect,
                        radius: Radius.circular(12),
                        dashPattern: [8, 4],
                        child: Container(
                          width: double.infinity,
                          height: 140,
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child:
                          _controller.UploadedImage == null
                              ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_circle_outline,
                                color: green,
                                size: 30,
                              ),
                              SizedBox(height: 8),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: green,
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ),
                                ),
                                child: Text(
                                  "Add Image",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          )
                              : ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              _controller.UploadedImage!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  commonText(text: "Dish Name", txtSize: 14),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 16),
                    child: commonTextField(
                      hintText: "Didh Name0",
                      controller: _controller.DishName,
                    ),
                  ),
                  commonText(text: "Recipe", txtSize: 14),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 16),
                    child: SizedBox(
                      height: 120,
                      child: TextField(
                        controller: _controller.Recipe,
                        maxLines: 5, // important for multiline to work
                        expands: false, // makes it fill the SizedBox height
                        decoration: InputDecoration(
                          hintText: "Enter Recipe",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),

                  commonText(text: "Temperature", txtSize: 14),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: GestureDetector(
                      onTap: () => _showTemperaturePicker(context),
                      child: Container(
                        height: 60,
                        width: ScreenWight * 0.9069,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: black.withOpacity(0.5)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16, left: 16),
                          child: Row(
                            children: [
                              Text(Selected, style: TextStyle(fontSize: 16)),
                              Spacer(),
                              Icon(Icons.arrow_downward),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Temperature
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: commonText(text: "Inspected By ", txtSize: 14),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                      height: 60,
                      width: ScreenWight * 0.9069,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: black.withOpacity(0.5)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16, left: 16),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedEmployee,
                            isExpanded: true,
                            icon: Icon(Icons.arrow_downward),
                            style: TextStyle(
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedEmployee = newValue!;
                              });
                            },
                            items:
                            employees.map<DropdownMenuItem<String>>((
                                String value,
                                ) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 24),
                  SizedBox(
                    height: 60,
                    width: ScreenWight * 0.9069,
                    child: commonButton(text: "Add", onPress: addNewCooking),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showTemperaturePicker(BuildContext context) async {
    int selectedIndex = temperature.indexOf(Selected);
    String? selectedTemp = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
              content: Container(
                width: 302,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: ScreenWight * 0.2069),
                            commonText(
                              text: "Temperature",
                              txtSize: 20,
                              color: black,
                              fontWeight: FontWeight.w600,
                            ),
                            Spacer(),
                            IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                        Container(height: 0.5, color: black.withOpacity(0.5)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 260,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: temperature.length,
                        itemBuilder: (context, index) {
                          bool isSelected = index == selectedIndex;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 24,
                              ),
                              padding: EdgeInsets.symmetric(vertical: 8),
                              decoration:
                              isSelected
                                  ? BoxDecoration(
                                color: Colors.green.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                              )
                                  : null,
                              child: Center(
                                child: Text(
                                  temperature[index],
                                  style: TextStyle(
                                    fontSize: isSelected ? 20 : 16,
                                    color:
                                    isSelected
                                        ? Colors.green
                                        : black.withOpacity(0.5),
                                    fontWeight:
                                    isSelected
                                        ? FontWeight.w600
                                        : FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: ScreenWight * 0.553,
                      child: commonButton(
                        text: "Select",
                        onPress: () {
                          _controller.Temperature.text =
                          temperature[selectedIndex];
                          Navigator.pop(context, temperature[selectedIndex]);
                        },
                      ),
                    ),
                    // ElevatedButton(
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.green,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(24),
                    //     ),
                    //     minimumSize: Size(160, 44),
                    //   ),
                    //   onPressed: () {
                    //     Navigator.pop(context, temperature[selectedIndex]);
                    //   },
                    //   child: Text(
                    //     "Select",
                    //     style: TextStyle(color: Colors.white, fontSize: 16),
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
