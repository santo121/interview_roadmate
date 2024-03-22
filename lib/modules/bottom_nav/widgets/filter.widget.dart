import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:roadmate_products/global/config/config.dart';
import 'package:roadmate_products/global/config/data_interceptor.config.dart';
import 'package:roadmate_products/global/styles/colors.styles.dart';
import 'package:roadmate_products/modules/bottom_nav/controller/bottom_nav.ctrl.dart';


class FilterWidget extends StatelessWidget {
   const FilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Gap(30),
              SizedBox(
                width: size.width - 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    kStyles.reg19(text: 'Choose your brands'),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const CircleAvatar(
                          maxRadius: 10,
                          backgroundColor: kRed,
                          child: Icon(
                            Icons.close,
                            color: kWhite,
                            size: 15,
                          ),
                        ))
                  ],
                ),
              ),
              const Gap(30),
              Expanded(
                flex: 9,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: size.width - 100,
                        child: Consumer2<BottomNavController,DataInterceptor>(
                          builder: (context,btCtrl,dataCtrl,_) {
                            return 
                            btCtrl.brandLoading?const Center(child:  CircularProgressIndicator(color: kRed,)):
                            ListView.builder(
                              shrinkWrap: true,
                            physics:const NeverScrollableScrollPhysics(),
                            itemCount: dataCtrl.brandList.length,
                            itemBuilder: (context,int index){
                              return CheckboxListTile(
                                        contentPadding: EdgeInsets.zero,
                                        activeColor: kRed,
                                        controlAffinity: ListTileControlAffinity.leading,
                                        title:  Text(dataCtrl.brandList[index].brandName??'-'),
                                        value: dataCtrl.brandList[index].checkMark,
                                        onChanged: (bool? value) {
                                            dataCtrl.upDateBrandListModel(index,value);
                                        },
                                      );
                            },
                                    // children: dataCtrl.brandList.map((BrandList key) {
                                    //   return  
                                    // }).toList(),
                                  );
                          }
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Gap(20),
              Consumer2<BottomNavController,DataInterceptor>(
                          builder: (context,btCtrl,dataCtrl,_) {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kRed,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                  
                        btCtrl.callFilterBrand();
                      },
                      child: SizedBox(
                          width: size.width - 100,
                          child: Center(
                              child: kStyles.med16(
                                  text: 'Apply filters', color: kWhite))));
                }
              ),
              const Gap(20),
            ],
          ),
        ],
      ),
    );
  }
}
