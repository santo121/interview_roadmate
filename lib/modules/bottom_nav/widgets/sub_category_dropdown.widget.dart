
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:roadmate_products/global/config/config.dart';
import 'package:roadmate_products/global/config/data_interceptor.config.dart';
import 'package:roadmate_products/global/config/dimensions.config.dart';
import 'package:roadmate_products/global/styles/colors.styles.dart';
import 'package:roadmate_products/modules/bottom_nav/controller/bottom_nav.ctrl.dart';

class SubCategoryDropDown extends StatelessWidget {
  const SubCategoryDropDown({super.key});
final String values = 'A';
  @override
  Widget build(BuildContext context) {
    return 
DropdownButtonHideUnderline(
                child: Container(
                  height: 32.h,
                  // width: 150.w,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: kRadius05,
                    border: Border.all(
                      width: 0.8.w,
                      color: kBlack.withOpacity(0.6),
                    ),
                  ),
                  child: Consumer2<DataInterceptor,BottomNavController>(
                    builder: (context,dataCtrl,bottomCtrl,_) {


                      return 
                      (dataCtrl.subCategory.isEmpty||dataCtrl.subCategory.first.categoryName==null
                      )?Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 150.w,child:  kStyles.reg14(text:'Loading...'),),
                        ],
                      ):
                      DropdownButton(
                        isDense: true,
                        dropdownColor: kWhite,
                        borderRadius: kRadius20,
                        // icon: SvgPicture.asset(drop),
                        value: bottomCtrl.subCategory??dataCtrl.subCategory.first,
                        items:  dataCtrl.subCategory.map(
                          (val) {
                            return DropdownMenuItem(
                              value: val,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // kWidth10,
                                  kStyles.reg14(text: val.categoryName??''),
                                  // kWidth10,
                                ],
                              ),
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          bottomCtrl.callProductList((value?.id??0).toString(), '0', true);
                          bottomCtrl.setSubCategory(value);
                         
                        },
                      );
                    }
                  ),
                ),
              );
  }
}