import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:roadmate_products/global/config/config.dart';
import 'package:roadmate_products/global/config/data_interceptor.config.dart';
import 'package:roadmate_products/global/config/dimensions.config.dart';
import 'package:roadmate_products/global/styles/colors.styles.dart';

import '../../bottom_nav/widgets/featured_product_appbar.widget.dart';
import '../controller/product_details.controller.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});
  final String productId;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsScreen> {
  List<int> list = [1, 2, 3, 4, 5];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductDetailsController>(context, listen: false)
          .callProductDetails(widget.productId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      appBar: const CustomAppBar(
        screenId: 2,
      ),
      body: Consumer2<ProductDetailsController, DataInterceptor>(
          builder: (context, pCtrl, dataCtrl, _) {
        return pCtrl.apiLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: kRed,
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      dataCtrl.productDetailsModel.productdetails?[0].images ==
                              null
                          ? Container(
                              height: 358.h,
                              color: kWhite,
                            )
                          : CarouselSlider(
                              options: CarouselOptions(
                                  padEnds: true,
                                  viewportFraction: 1,
                                  autoPlay: true,
                                  enableInfiniteScroll: false,
                                  aspectRatio: 16 / 14),
                              items: dataCtrl.productDetailsModel
                                  .productdetails?[0].images!
                                  .map((item) => Container(
                                        margin: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: kWhite,
                                            borderRadius: kRadius10),
                                        child: const Center(
                                            child: Icon(
                                          Icons.image,
                                          size: 50,
                                          color: kGrey,
                                        )),
                                      ))
                                  .toList()),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            dataCtrl.productDetailsModel.productdetails?[0]
                                    .images?.length ??
                                0,
                            (index) => const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: CircleAvatar(
                                    radius: 6,
                                  ),
                                )),
                      ),
                      Gap(32.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: size.width * .7,
                              child: kStyles.semiBold23(
                                  text: dataCtrl.productDetailsModel
                                          .productdetails?[0].productName ??
                                      '-')),
                          Row(
                            children: List.generate(
                                4,
                                (index) => const Icon(
                                      Icons.star,
                                      size: 16,
                                      color: kGreen,
                                    )),
                          )
                        ],
                      ),
                      Gap(12.h),
                      Row(
                        children: [
                          SizedBox(
                            width: size.width - 40,
                            child: kStyles.reg14(
                                textAlign: TextAlign.start,
                                text: dataCtrl.productDetailsModel
                                        .productdetails?[0].description ??
                                    '-'),
                          ),
                        ],
                      ),
                      Gap(12.h),
                      Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            kStyles.light12(text: 'Exclusive Launch Offer'),
                            Row(
                              children: [
                                Text(
                                  '₹${dataCtrl.productDetailsModel.productdetails?[0].price ?? '-'} ',
                                  style: GoogleFonts.getFont('Rubik',
                                      color: Colors.black,
                                      fontSize: 20.sp,
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.w400),
                                ),
                                kStyles.med20(
                                    text:
                                        '₹${dataCtrl.productDetailsModel.productdetails?[0].offerPrice ?? '-'}  ${getOffer(dataCtrl.productDetailsModel.productdetails?[0].price ?? '0', dataCtrl.productDetailsModel.productdetails?[0].offerPrice ?? '0')}% off'),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.blinds_closed,
                                  size: 12,
                                  color: kBlack,
                                ),
                                Gap(8.h),
                                kStyles.light12(
                                    text:
                                        'Get assured ${getOffer(dataCtrl.productDetailsModel.productdetails?[0].price ?? '0', dataCtrl.productDetailsModel.productdetails?[0].offerPrice ?? '0')}% cashback for every order'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Gap(8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.blinds_closed,
                                size: 12,
                                color: kBlack,
                              ),
                              kStyles.light12(
                                  text: 'Test Shop, 34/2246 kalamassery'),
                            ],
                          ),
                          kStyles.light12(text: 'Change', color: kRed),
                        ],
                      ),
                      Gap(20.h),
                      Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: kBlack, width: .25)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            kStyles.light12(text: 'Available coupons for you'),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 12,
                              color: kBlack,
                            ),
                          ],
                        ),
                      ),
                      Gap(15.h),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )),
                                onPressed: () {},
                                child: kStyles.med16(text: 'Add to cart')),
                          ),
                          Gap(10.w),
                          Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 201, 181, 0),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onPressed: () {},
                                child: kStyles.med16(
                                    text: 'Buy now', color: kWhite)),
                          ),
                        ],
                      ),
                      const Gap(20)
                    ],
                  ),
                ),
              );
      }),
    );
  }

  String getOffer(String price, String offerPri) {
    double offerPrice = double.parse(offerPri);
    double realPrice = double.parse(price);

    double percent = (((realPrice - offerPrice) / realPrice) * 100);
    return percent.toStringAsFixed(2);
  }
}
