import 'package:car_service/core/translation/app_translation.dart';
import 'package:car_service/ui/admin_view/all_order_detiels/all_order_controller.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'all_parking_containet.dart';

class CustomTable extends StatelessWidget {
  CustomTable({Key? key}) : super(key: key);
  AllParkingController controller = Get.put(AllParkingController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.h),
      child: Column(

          children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              textType: TextStyleType.small,
              text: "name",
              fontWeight: FontWeight.bold,
            ),
            CustomText(
              textType: TextStyleType.small,
              text: "parkig name",
              fontWeight: FontWeight.bold,
            ),
            CustomText(
              textType: TextStyleType.small,
              text: "Duration",
              fontWeight: FontWeight.bold,
            ),
            CustomText(
              textType: TextStyleType.small,
              text: "Price",
              fontWeight: FontWeight.bold,
            ),
            CustomText(
              textType: TextStyleType.small,
              text: "Finish Date",
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        (15.h).ph,
        Obx(() {
          return SizedBox(
            height:0.829.sh ,
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return  Divider(
                  thickness: 2, // Adjust the thickness of the divider as needed
                  color: Colors.black, // Set the color of the divider
                );
              },
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: controller.allorderparking.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        textType: TextStyleType.small,
                        text: controller.allorderparking[index].userId!.firstName
                            .toString()),
                    CustomText(
                        textType: TextStyleType.small,
                        text: controller.allorderparking[index].selectedPark!
                            .location!.parkingName
                            .toString()),
                    CustomText(
                      textType: TextStyleType.small,
                      text: controller.allorderparking[index].duration.toString(),
                    ),
                    CustomText(
                      textType: TextStyleType.small,
                      text: controller.allorderparking[index].price.toString(),
                    ),
                    CustomText(
                      textType: TextStyleType.small,
                      text: controller.allorderparking[index].orderFinishDate
                          .toString().substring(11, 19),

                    ),
                  ],
                );
              },
            ),
          );
        })
      ]),
    );
  }
}
// Column(
// children: [
// DataTable(
// columnSpacing: 10.0.h,
// columns: [
// DataColumn(
// label: CustomText(textType: TextStyleType.small, text: "name",
// fontWeight: FontWeight.bold,
//
// ),
// ),
// DataColumn(
// label: CustomText(textType: TextStyleType.small, text: "parkig name",
// fontWeight: FontWeight.bold,
//
//
// )
// ),
// DataColumn(
// label: CustomText(textType: TextStyleType.small, text: "Duration",
// fontWeight: FontWeight.bold,
//
// )),
// DataColumn(
// label: CustomText(textType: TextStyleType.small, text: "Price",
// fontWeight: FontWeight.bold,
// )
// ),
// DataColumn(
// label: CustomText(textType: TextStyleType.small, text: "Finish Date",
// fontWeight: FontWeight.bold,
// )
//
// ),
// ],
//
// rows: [
// DataRow(cells: [
// DataCell(CustomText(textType: TextStyleType.small, text: controller.allorderparking[index].userId!.firstName.toString(),
//
// )
// ),
// DataCell(CustomText(textType: TextStyleType.small, text: controller.allorderparking[index].selectedPark!.location!.parkingName.toString(),
//
// )
// ),
// DataCell(CustomText(textType: TextStyleType.small, text: controller.allorderparking[index].duration.toString(),
//
// )),
// DataCell(CustomText(textType: TextStyleType.small, text: controller.allorderparking[index].price.toString(),
//
// )
// ),
// DataCell(CustomText(textType: TextStyleType.small, text:controller.allorderparking[index].orderFinishDate.toString(), fontSize: 5,
//
// )
// ),
// ])
// ]
// ),
// ],
// );
