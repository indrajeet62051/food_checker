import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_checker/api/Services/edit_profile_service.dart';
import 'package:food_checker/generated/assets.dart';
import 'package:food_checker/screens/fragment_screen/profile/Sub_Profile_Screens/edit%20profile/edit_profile_controller.dart';
import 'package:food_checker/screens/widget/common_button.dart';
import 'package:food_checker/screens/widget/text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

import '../../../../../core/Constrants/color.dart';
import '../../../../widget/card.dart';
import '../../../../widget/text.dart';
import '../../profile_screen2.dart';

class EditProfileScreen extends StatefulWidget {
  final String fullName;

  EditProfileScreen({required this.fullName});

  @override
  State<StatefulWidget> createState() => edit_screen();
}


String email_ = "";
String auth_Token_ = "";
String profileImage_ = "";


class edit_screen extends State<EditProfileScreen> {
  late final EditProfileController controller;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    controller = EditProfileController();
    _loaddata();

  }

  Future<void> _loaddata() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email') ?? '';
    final auth_token = prefs.getString('auth_token');
    final profileImage = prefs.getString('userProfilePhoto') ?? '';
    setState(() {
      email_ = '$email';
      auth_Token_ = '$auth_token';
      profileImage_ = '$profileImage';
      controller.nameController.text = widget.fullName;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose(); // Always call super.dispose()
  }

  Future<void> pickImage() async {
    showModalBottomSheet(
      context: context,
      builder:
          (BuildContext context) => SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Gallery'),
                  onTap: () async {
                    Navigator.pop(context);
                    await controller.pickImage(ImageSource.gallery);
                    setState(() {});
                  },
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text('Camera'),
                  onTap: () async {
                    Navigator.pop(context);
                    await controller.pickImage(ImageSource.camera);
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              commAppBar(
                app_bar: "Edit Profile",
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              SizedBox(
                width: ScreenWight * 0.9069,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 35, bottom: 35),
                      child: Stack(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: green,
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              child: Center(
                                child:
                                    controller.uploadedImage == null
                                        ? CircleAvatar(
                                          radius: 56,
                                          backgroundImage:
                                              profileImage_.isNotEmpty
                                                  ? NetworkImage(profileImage_)
                                                  : AssetImage(
                                                        'assets/images/bydefault_user.jpg',
                                                      )
                                                      as ImageProvider,
                                        )
                                        : ClipOval(
                                          child: Image.file(
                                            controller.uploadedImage!,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                          ),
                                        ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: pickImage,
                              child: Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: green,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Text(
                    //     "Profile Picture (Optional)",
                    //     style: TextStyle(
                    //       fontSize: 12,
                    //       fontFamily: 'PlusJakartaSans',
                    //       color: graycol,
                    //       fontWeight: FontWeight.w400,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'PlusJakartaSans',
                          color: graycol,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    commonTextField(
                      Svg_Path: Assets.iconsUser,
                      controller: controller.nameController,
                    ), //Email id
                    SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'PlusJakartaSans',
                          color: graycol,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    commonTextField(
                      hintText: '$email_',
                      Svg_Path: 'assets/icons/Mail.svg',
                      controller: controller.emailController,
                      readOnly: true,
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      width: ScreenWight * 0.9069,
                      height: 60,
                      child: commonButton(
                        text: "Save Changes",
                        onPress: () async {
                          String fullName =
                              controller.nameController.text.trim();
                          List<String> nameParts = fullName.split(" ");

                          // Input validation (you can make this more detailed)
                          final ValidationError = controller.validateInput();
                          if (ValidationError != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(ValidationError)),
                            );
                            return;
                          }

                          String firstName = nameParts[0];
                          String lastName =
                              nameParts.length > 1
                                  ? nameParts.sublist(1).join(" ")
                                  : "";

                          setState(() => isLoading = true);
                          bool hasNewImage = controller.uploadedImage != null;

                          final user = await EditProfileService()
                              .EditProfileUser(
                                firstName: firstName,
                                lastName: lastName,
                                profileimage:
                                    hasNewImage
                                        ? controller.uploadedImage!
                                        : null,
                              );

                          setState(() => isLoading = false);

                          if (!mounted) return;

                          if (user != null && user.status == 1) {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setBool('isLoggedIn', true);
                            await prefs.setString(
                              'fullName',
                              "$firstName $lastName",
                            );
                            if (user.data?.userProfilePhoto != null &&
                                user.data!.userProfilePhoto!.isNotEmpty) {
                              String url = user.data!.userProfilePhoto!;
                              url =
                                  'https://codonnier.tech/flutterapp/food_hygine/app_images/profile_images/' +
                                  url;
                              await prefs.setString('userProfilePhoto', url);
                            }
                            Navigator.pop(context);



                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(user?.msg ?? "Update failed"),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          if (isLoading)
            Center(
              child: Container(
                color: Colors.white.withOpacity(
                  0.2,
                ), // semi-transparent background
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

Widget commAppBar({required String app_bar, VoidCallback? onTap}) {
  return Container(
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
                padding: const EdgeInsets.only(right: 0),
                child: GestureDetector(
                  onTap: onTap,
                  child: Icon(Icons.arrow_back),
                ),
              ),

              Spacer(),

              commonText(
                text: app_bar,
                txtSize: 20,
                color: black,
                fontWeight: FontWeight.w600,
              ),
              Spacer(),
            ],
          ),
          SizedBox(height: 15),
        ],
      ),
    ),
  );
}
