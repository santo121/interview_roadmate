import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:roadmate_products/global/config/assets.config.dart';
import 'package:roadmate_products/global/config/config.dart';
import 'package:roadmate_products/global/config/dependency_injection.config.dart';
import 'package:roadmate_products/modules/bottom_nav/controller/bottom_nav.ctrl.dart';
import 'package:roadmate_products/modules/bottom_nav/widgets/icon_button.widget.dart';
import 'package:roadmate_products/modules/bottom_nav/widgets/search_field.widget.dart';

import '../../../global/styles/colors.styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.screenId});
  final int screenId;
//?--- 1 => product page
//?--- 2 => product details page
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (screenId == 2)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kStyles.reg12(text: 'Deliver to:'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: kRed,
                            size: 20,
                          ),
                          kStyles.med20(text: 'My Shop'),
                          const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: kBlack,
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                if (screenId == 1) kStyles.med20(text: 'Featured Products'),
                Row(
                  children: [
                    CustomIconButton(
                      asset: getIt<AssetsUrl>().heartIcon,
                      onPressed: () {},
                    ),
                    CustomIconButton(
                      asset: getIt<AssetsUrl>().cartIcon,
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
            if (screenId == 1)
              Column(
                children: [
                  Gap(20.h),
                  SearchField(
                    hintText: 'Search',
                    suffixIcon: const Icon(Icons.search),
                    controller: TextEditingController(),
                    onChanged: (String val) {
                      Provider.of<BottomNavController>(context, listen: false)
                          .callSearchProduct(val);
                    },
                    validator: (String? data) {
                      return null;
                    },
                  )
                ],
              )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(size.width, screenId == 1 ? 130 : 80);
}
