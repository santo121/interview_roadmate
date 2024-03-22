
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../global/styles/colors.styles.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key, required this.isCategory,
  });
final bool isCategory;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        
      child:isCategory?
      
       Shimmer.fromColors(
        baseColor: kWhite,
        highlightColor:const Color(0xFFF3F3F3),
        child: Container(
          height: 67.h,
              decoration: BoxDecoration(
             color: kWhite,
             borderRadius: BorderRadius.circular(10.r),
            ),
         width: 60.w,
    
        )
      ):
     Shimmer.fromColors(
        baseColor: kWhite,
        highlightColor:const Color(0xFFF3F3F3),
        child: Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              
                color: kWhite,
                borderRadius:
                    BorderRadius.circular(12.r)),
            
          ),
      ),
      
    );
  }
}
