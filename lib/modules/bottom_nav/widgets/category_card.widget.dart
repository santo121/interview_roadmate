import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadmate_products/global/config/config.dart';
import 'package:roadmate_products/global/styles/colors.styles.dart';
import 'package:roadmate_products/modules/bottom_nav/widgets/loading.widget.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key, required this.isSelected, this.onTap,  this.isAllProducts = false, required this.isLoading,
  });
final bool isSelected;
final Function()? onTap;
final bool isAllProducts;
final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: GestureDetector(
        onTap:onTap ,
        child: Column(
          children: [
            Column(
              children: [
               isLoading?const LoadingWidget(
                isCategory: true,
               ):
                Container(
                    height: 67.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow:isSelected? [
                          BoxShadow(
                            color: const Color(0xFF616161)
                                .withOpacity(0.19),
                            offset: const Offset(0, 5),
                            blurRadius: 5,
                            spreadRadius: 0,
                          ),
                        ]:null),
                    child: isAllProducts?
                    Center(child: kStyles.reg12(text: 'All Products',textAlign: TextAlign.center))
                    :
                    const Center(
                        child: Center(child: Icon(Icons.image,size:20,color: kGrey,)),)),
                Gap(8.h),
                if(isSelected)
                CircleAvatar(
                  radius: 2.5.r,
                  backgroundColor: kRed,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
