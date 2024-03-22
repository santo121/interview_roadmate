import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:roadmate_products/global/config/config.dart';
import 'package:roadmate_products/global/config/data_interceptor.config.dart';
import 'package:roadmate_products/global/styles/colors.styles.dart';
import 'package:roadmate_products/modules/bottom_nav/controller/bottom_nav.ctrl.dart';
import 'package:roadmate_products/modules/bottom_nav/widgets/category_card.widget.dart';
import 'package:roadmate_products/modules/bottom_nav/widgets/filter.widget.dart';
import 'package:roadmate_products/modules/bottom_nav/widgets/loading.widget.dart';
import 'package:roadmate_products/modules/product_details/view/product_details.view.dart';

import '../widgets/featured_product_appbar.widget.dart';
import '../widgets/product_card.widget.dart';
import '../widgets/sub_category_dropdown.widget.dart';

class FeaturedProducts extends StatefulWidget {
  const FeaturedProducts({super.key});

  @override
  State<FeaturedProducts> createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final ctrl = Provider.of<BottomNavController>(context, listen: false);
      ctrl.callCategoryDetails();
      ctrl.callProductList("22", '0', true);
      //? consider 22 as all products
    });
  }

  Radius filterButtonRadius = const Radius.circular(20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBg,
      appBar: const CustomAppBar(
        screenId: 1,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Consumer2<DataInterceptor, BottomNavController>(
                builder: (context, dataCtrl, navCtrl, _) {
              return ListView.builder(
                  itemCount: navCtrl.apiLoading
                      ? 6
                      : (dataCtrl.categoryModel.categoryList?.length ?? 0) + 1,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, int index) {
                    return CategoryCard(
                      isLoading: navCtrl.apiLoading,
                      isAllProducts: index == 0,
                      isSelected: navCtrl.selectedCategory == index,
                      onTap: () {
                        navCtrl.callProductList(
                            index == 0
                                ? "22"
                                : (dataCtrl.categoryModel
                                            .categoryList?[index - 1].id ??
                                        0)
                                    .toString(),
                            '0',
                            index == 0);
                        navCtrl.changeSelectedCategory(
                            index,
                            (index - 1) == -1
                                ? 'All products'
                                : dataCtrl
                                        .categoryModel
                                        .categoryList?[index - 1]
                                        .categoryName ??
                                    '');
                      },
                    );
                  });
            }),
          ),
          Expanded(
            flex: 8,
            child: Column(
              children: [
                Consumer<BottomNavController>(
                    builder: (context, bottomCtrl, _) {
                  return Column(
                    children: [
                      if (bottomCtrl.selectedCategory == 0) Gap(20.h),
                      if (bottomCtrl.selectedCategory != 0)
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    kStyles.reg19(text: 'Shop by subcategory'),
                                    //*---------------------------------------------------------------- (dropdown)
                                    const SubCategoryDropDown()
                                  ],
                                ),
                              ),
                              //*---------------------------------------------------------------- (filter)
                              const Gap(10),
                              GestureDetector(
                                onTap: () {
                                  bottomCtrl.callBrandApiList(
                                      (bottomCtrl.subCategory?.id ?? 0)
                                          .toString());
                                  showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const FilterWidget();
                                    },
                                  );
                                },
                                child: Container(
                                    width: 100,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                        color: kRed,
                                        borderRadius: BorderRadius.only(
                                            topLeft: filterButtonRadius,
                                            bottomLeft: filterButtonRadius)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Icon(
                                          Icons.sort_rounded,
                                          color: kWhite,
                                        ),
                                        kStyles.reg14(
                                            text: 'Filter', color: kWhite),
                                      ],
                                    )),
                              ),
                              //*---------------------------------------------------------------- (filter)
                            ],
                          ),
                        ),
                      Consumer<DataInterceptor>(
                          builder: (context, dataCtrl, _) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              //?--- product name

                              kStyles.reg18(text: bottomCtrl.categoryName),
                              //?--- item count
                              kStyles.reg10(
                                  text:
                                      'Showing ${dataCtrl.productListModel.productList?.length ?? 0} results',
                                  color: kRed),
                            ],
                          ),
                        );
                      }),
                    ],
                  );
                }),
                Gap(10.h),
                //*----- all products
                Consumer2<BottomNavController, DataInterceptor>(
                    builder: (context, navCtrl, dataLayer, _) {
                  int length =
                      (dataLayer.productListModel.productList?.length ?? 0);
                  return Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: navCtrl.apiLoadingProduct
                            //!----- loading
                            ? GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 17,
                                        mainAxisSpacing: 17,
                                        crossAxisCount: 2),
                                itemCount: 7,
                                itemBuilder: (context, int index) {
                                  return const LoadingWidget(
                                    isCategory: false,
                                  );
                                })
                            //!----- data

                            :
                            navCtrl.isFilterGrid?
                             GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 17,
                                    mainAxisSpacing: 17,
                                    crossAxisCount: 2
                        ),
                            itemCount: length,
                            itemBuilder: (context, int index) {
                              final dataSnap =
                                  dataLayer.productListModel.productList;
                              return ProductsCardWidget(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetailsScreen(
                                              productId:
                                                  (dataSnap?[index].id ?? 0)
                                                      .toString(),
                                            )),
                                  );
                                },
                                ratting: 4.5.toString(),
                                price: (dataSnap?[index].price ?? "-")
                                    .toString(),
                                offerPrice:
                                    (dataSnap?[index].offerPrice ?? "-")
                                        .toString(),
                                productName:
                                    dataSnap?[index].productName ?? "-",
                                isLoading: navCtrl.apiLoadingProduct,
                              );
                            })

                            : PagewiseGridView.count(
                                pageSize: 20,
                                crossAxisSpacing: 17,
                                mainAxisSpacing: 17,
                                crossAxisCount: 2,

                                itemBuilder: (context, entry, index) {
                                  return ProductsCardWidget(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailsScreen(
                                                  productId: (entry?.id ?? 0)
                                                      .toString(),
                                                )),
                                      );
                                    },
                                    ratting: 4.5.toString(),
                                    price: (entry?.price ?? "-").toString(),
                                    offerPrice:
                                        (entry?.offerPrice ?? "-").toString(),
                                    productName: entry?.productName ?? "-",
                                    isLoading: navCtrl.apiLoadingProduct,
                                  );
                                },
                                loadingBuilder: (context){
                                  return GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 17,
                                        mainAxisSpacing: 17,
                                        crossAxisCount: 2),
                                itemCount: 2,
                                itemBuilder: (context, int index) {
                                  return const LoadingWidget(
                                    isCategory: false,
                                  );
                                });
                                },

                                pageFuture: (int? pageIndex) =>
                                    (navCtrl.callProductList(
                                        navCtrl.categoryIds,
                                        pageIndex.toString(),
                                        true))

                                // return a Future that resolves to a list containing the page's data

                                )

                        ),
                  );
                }),
                const Gap(90)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
