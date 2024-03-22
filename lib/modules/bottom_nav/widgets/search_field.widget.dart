

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadmate_products/global/styles/colors.styles.dart';

import '../../../global/config/dimensions.config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    this.onTap,
    this.filled,
    this.maxLines,
    this.fillColor,
    this.onChanged,
    this.maxLength,
    this.focusNode,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText = '',

    this.isBorder = true,
    required this.validator,
    required this.controller,
    this.keyboardType = TextInputType.name,
    this.textCapitalization = TextCapitalization.none,
  });

  final bool? filled;
  final int? maxLines;
  final bool? isBorder;
  final int? maxLength;
  final String? hintText;
  final Color? fillColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
     

        //!---Text form field
        TextFormField(
          onTap: onTap,
          maxLines: maxLines,
          cursorColor: kBlack,
          focusNode: focusNode,
          onChanged: onChanged,
          maxLength: maxLength,
          validator: validator,
          controller: controller,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          style: GoogleFonts.urbanist(
            color: kBlack,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            
            filled: true,
            counterText: '',
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            fillColor: fillColor ?? kWhite,
            contentPadding: EdgeInsets.all(15.h),
            enabledBorder: OutlineInputBorder(
              borderRadius: kRadius10,
              borderSide: BorderSide(
                width: isBorder == true ? 0.8.h : 0,
                color: isBorder == true ? const Color(0XFFABABAB) : kTrans,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: kRadius10,
              borderSide: BorderSide(
                width: isBorder == true ? 0.8.h : 0,
                color: isBorder == true ? const Color(0XFFABABAB) : kTrans,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: kRadius10,
              borderSide: BorderSide(
                width: isBorder == true ? 0.8.h : 0,
                color: isBorder == true ? kRed : kTrans,
              ),
            ),
            hintStyle: GoogleFonts.urbanist(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: kGrey.withOpacity(0.6),
            ),
          ),
        ),
      ],
    );
  }
}
