import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../global/config/config.dart';
import '../../../global/styles/colors.styles.dart';

class ProductsCardWidget extends StatelessWidget {
  const ProductsCardWidget({
    super.key,
    required this.isLoading,
    required this.productName,
    required this.price,
    required this.offerPrice,
    required this.ratting,required this.onTap,
  });
  final bool isLoading;
  final String productName;
  final String price;
  final String offerPrice;
  final String ratting;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return 
      GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: const Color(0xFF616161).withOpacity(0.19),
                  offset: const Offset(0, 5),
                  blurRadius: 5,
                  spreadRadius: 0,
                ),
              ], color: kWhite, borderRadius: BorderRadius.circular(12.r)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const Center(child: Icon(Icons.image,size:30,color: kGrey,)),
                 const Gap(20),
                  kStyles.reg14(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: productName,
                      textAlign: TextAlign.start),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            price,
                            style: GoogleFonts.getFont('Rubik',
                                color: Colors.black,
                                fontSize: 12.sp,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w400),
                          ),
                          const Gap(5),
                          kStyles.reg12(text: '₹$offerPrice'),
                        ],
                      ),
                      Row(
                        children: [
                          kStyles.reg12(text: ratting),
                          const Icon(
                            Icons.star,
                            size: 12,
                            color: kGreen,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
