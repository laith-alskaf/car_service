import 'dart:io';
import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:car_service/core/data/models/api/user_info_model.dart';
import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/ui/admin_view/add_park/add_park_view.dart';
import 'package:car_service/ui/admin_view/admin_dashboard/admin_dashboard_widget/container_action_admin.dart';
import 'package:car_service/ui/admin_view/admin_dashboard/admin_dashboard_widget/custom_appbar_admin.dart';
import 'package:car_service/ui/admin_view/admin_profile_view/profile_widget/custom_info_admin.dart';
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

import '../../../core/data/models/api/amin_info_model.dart';
import '../../views/home/profile_view/profile_view.dart';
import 'admin_profile_controller.dart';
import 'edit_profile_view/admin_edit_profile_view.dart';

class AdminProfileView extends StatefulWidget {
  const AdminProfileView({super.key});

  @override
  State<AdminProfileView> createState() => _AdminProfileViewState();
}

class _AdminProfileViewState extends State<AdminProfileView> {
  @override
  Widget build(BuildContext context) {
    AdminProfileController controller = Get.put(AdminProfileController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBarCustom(
          title: 'Admin Profile',
        ),
        body: ListView(children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    GetBuilder<AdminProfileController>(builder: (c) {
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
                                            child:
                                                controller.selectedFile.path ==
                                                        ''
                                                    ? controller.selectedFile
                                                                .path !=
                                                            ''
                                                        ? null
                                                        : Icon(
                                                            Icons.person,
                                                            size: 50.h,
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
                                              backgroundColor:
                                                  AppColors.whiteColor,
                                              child: Icon(
                                                Icons.edit,
                                                color: AppColors.blackColor,
                                                size: 30.h,
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                const SizedBox(
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
                                    text: '${controller.admin.username}',
                                    textType: TextStyleType.subtitle),
                                (10.h).ph,
                                CustomText(
                                    text: 'Your iD : ${controller.admin.sId}',
                                    fontWeight: FontWeight.normal,
                                    textType: TextStyleType.bodyBig),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: CustomContainerDashAndroid(
                                      textSize: 20.sp,
                                      onTap: () {
                                        Get.to(() => AddParkView());
                                      },
                                      width: 120.w,
                                      height: 50.w,
                                      titleAction: 'New Park',
                                      numberInAction: ''),
                                )
                                // CustomDropMenu(
                                //   validator:(value) {
                                //     if (value == null) {
                                //       return 'Please select Type';
                                //     }
                                //     else{
                                //       controller.parkname.value=value;
                                //     }
                                //     return null;
                                //   },
                                //   hint: "parking",
                                //   items: controller.parks,
                                //   onSaved: (value) {
                                //     controller.parkname.value = value!;
                                //   },
                                // ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                    (20.h).ph,
                    GetBuilder<AdminProfileController>(builder: (c) {
                      return CustomInfoAdmin(
                        onTap: () {
                          controller.expandedContainer[0] = true;
                          controller.expandedContainer[1] = false;
                          Get.to(() => const AdminEditProfileView());
                        },
                        index: 0,
                        title: 'Personal Info',
                        textBody: [
                          'Name : ${controller.admin.username}',
                          'Email : ${controller.admin.email} ',
                        ],
                        suffixText: 'Edit',
                      );
                    }),
                    (20.h).ph,
                    GetBuilder<AdminProfileController>(builder: (c) {
                      return Column(
                          children: List.generate(
                              controller.adminparks == null
                                  ? 0
                                  : controller.adminparks!.length, (index) {
                        return Column(
                          children: [
                            CustomInfoAdmin(
                              onTap: () {
                                controller.expandedContainer[0] = false;
                                controller.expandedContainer[1] = true;
                                Get.to(() => AdminEditProfileView(
                                      parkname: controller.adminparks![index]
                                          .location!.parkingName,
                                      price: controller
                                          .adminparks![index].location!.price,
                                    ));
                              },
                              index: 1,
                              title: 'parking Info',
                              textBody: [
                                'Prking name : ${controller.adminparks![index].location!.parkingName}',
                                'price :${controller.adminparks![index].location!.price} ',
                              ],
                              suffixText: 'Edit',
                            ),
                            (20.h).ph,
                          ],
                        );
                      }));
                    }),
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
