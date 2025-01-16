import 'package:akw/core/constant/enum_constants.dart';
import 'package:akw/core/custom_widgets/custom_app_bar.dart';
import 'package:akw/core/utils/extensions.dart';
import 'package:akw/features/items/items_page.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/app_constants.dart';
import '../../core/custom_widgets/card_data_widget.dart';


class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late CameraDescription cameraDescription;

  Future<void> init() async {
    cameraDescription = (await availableCameras()).first;
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
        return Scaffold(
          appBar: CustomAppBar(
            title: "Categories",
             fontSize: isLandscape?(StyleConstants.fontSize - 6).sp:(StyleConstants.fontSize + 2).sp,
          ),
          body: ListView.builder(
            itemCount: CategoriesEntity.values.length,
            itemBuilder: (context, index) => Padding(
              padding:  EdgeInsets.symmetric(vertical: 8.h,horizontal: 12.r),
              child: CardDataWidget(
                valueColor: Theme.of(context).primaryColor,
                typeColor: Theme.of(context).primaryColor,
                type:CategoriesEntity.values[index].name.toPascalCase ,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context) => ItemsPage(category: CategoriesEntity.values[index],
                  ),));
                },
              ),
            ),),
        );
      },

    );
  }
}
