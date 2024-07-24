import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:car_service/core/data/models/api/user_info_model.dart';
import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_service/ui/shared/custom_widget/custom_button.dart';
import 'package:car_service/ui/shared/custom_widget/custom_container.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/home/profile_view/profile_widget/custom_info.dart';
import 'package:car_service/ui/views/home/profile_view/edit_profile_view/edit_profile_view.dart';
import 'package:car_service/ui/views/home/profile_view/profile_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    UserInfo userInfo = storage.getUserInfo()!;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: ListView(children: [
          CustomAppBar(
            title: 'Profile',
            onTapBack: () {
              Get.back();
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    GetBuilder<ProfileController>(builder: (c) {
                      return CustomContainer(
                        height: 300.h,
                        child: ZoomIn(
                          duration: const Duration(milliseconds: 800),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Stack(
                                    alignment: AlignmentDirectional.bottomEnd,
                                    children: [
                                      InkWell(
                                        onTap: controller.selectedFile.path ==
                                                ''
                                            ? () {
                                                controller.setShowOPtion(true);
                                              }
                                            : null,
                                        child: CircleAvatar(
                                            backgroundImage:
                                                controller.selectedFile.path ==
                                                        ''
                                                    ? null
                                                    : FileImage(File(controller
                                                        .selectedFile.path)),
                                            radius: 50,
                                            backgroundColor:
                                                AppColors.mainColor,
                                            child: controller
                                                        .selectedFile.path ==
                                                    ''
                                                ? controller
                                                            .selectedFile
                                                            .path !=
                                                        ''
                                                    ? null
                                                    : Icon(
                                                        Icons.person,
                                                        size: 120,
                                                      )
                                                : null),
                                      ),
                                      //     CircleAvatar(
                                      //     backgroundImage: controller.image == null ? null : FileImage(controller.image!),
                                      //     backgroundColor: controller.image == null &&controller. fileupload == null
                                      //         ? AppColors.mainOrangeColor
                                      //         : null,
                                      //     radius: 80,
                                      //     child:controller. image == null  controller.fileupload == null
                                      // ? InkWell(
                                      // onTap: controller.image != null  controller.fileupload != null
                                      // ? null
                                      //     : () {
                                      // controller. image == null && controller.fileupload == null
                                      // ? controller.dialogImage()
                                      //     : null;
                                      // },
                                      //     child: controller.image != null
                                      //         ? null
                                      //         : Icon(
                                      //       controller.fileupload != null
                                      //           ? Icons.file_copy
                                      //           : Icons.person,
                                      //       size: 120,
                                      //     ))
                                      //       : null),
                                      Visibility(
                                          visible:
                                              controller.selectedFile != null &&
                                                  controller.selectedFile.path
                                                      .isNotEmpty,
                                          child: InkWell(
                                            onTap: () {
                                              controller.setShowOPtion(true);
                                            },
                                            child: CircleAvatar(
                                              radius: 15,
                                              child:Icon(
                                                Icons.edit,
                                                color: AppColors.blackColor,
                                                size: 30.h,
                                              ) ,
                                              backgroundColor:
                                                  AppColors.whiteColor,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Visibility(
                                  visible: controller.showOptions,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomButton(
                                        buttonTypeEnum: ButtonTypeEnum.small,
                                        text: 'Gallery',
                                        onPressed: () {
                                          controller
                                              .pickFile(FileTypeEnum.GALLERY)
                                              .then((value) {
                                            if (value.path != '') {
                                              controller.selectedFile = value;
                                              storage.setGallary(value.path);
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                (10.h).ph,
                                CustomText(
                                    fontWeight: FontWeight.bold,
                                    text:
                                        '${storage.getUserInfo()!.firstName} ${storage.getUserInfo()!.lastName}',
                                    textType: TextStyleType.subtitle),
                                (2.h).ph,
                                const CustomText(
                                    text: 'Your iD : 0988999888',
                                    fontWeight: FontWeight.normal,
                                    textType: TextStyleType.bodyBig)
                              ],
                            ),
                          ),
                        ),
                      );
                    }),

                    (20.h).ph,
                    CustomInfo(
                      index: 0,
                      title: 'Personal Info',
                      textBody: [
                        'Name : ${userInfo.username}',
                        'Email : ${userInfo.email} ',
                      ],
                      suffixText: 'Edit',
                      onTap: () {
                        controller.expandedContainer[0] = true;
                        controller.expandedContainer[1] = false;
                        Get.to(() => const EditProfileView());
                      },
                    ),
                    (20.h).ph,
                    CustomInfo(
                      index: 1,
                      title: 'Car Info',
                      textBody: [
                        'Car Number : ${userInfo.car!.carNumber!}',
                        'Car Type : ${userInfo.car!.carType} ',
                        'Car Model : ${userInfo.car!.carModel} ',
                      ],
                      suffixText: 'Edit',
                      onTap: () {
                        controller.expandedContainer[0] = false;
                        controller.expandedContainer[1] = true;
                        Get.to(() => const EditProfileView());
                      },
                    ),
                    (20.h).ph,
                    // CustomInfo(
                    //   title: tr('key_favourite'),
                    //   suffixText: tr('key_showInfo'),
                    //   onTap: () {},
                    // ),
                    // (20.h).ph,
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class FileModel {
  FileTypeEnum type;
  String path;

  FileModel(this.path, this.type);
}

enum FileTypeEnum { CAMERA, GALLERY, FILE }
