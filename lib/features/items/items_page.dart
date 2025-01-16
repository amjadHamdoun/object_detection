import 'package:akw/core/constant/enum_constants.dart';
import 'package:akw/core/custom_widgets/card_data_widget.dart';
import 'package:akw/core/custom_widgets/custom_animated_list.dart';
import 'package:akw/core/utils/extensions.dart';
import 'package:akw/features/items/bloc/items_state.dart';
import 'package:akw/features/object_detection/object_detection_page.dart';
import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/constant/app_constants.dart';
import '../../core/custom_colors/my_colors.dart';
import '../../core/custom_widgets/custom_app_bar.dart';
import '../../injection.dart';
import 'bloc/items_bloc.dart';
import 'methods/check_permissions.dart';


class ItemsPage extends StatefulWidget {
  final CategoriesEntity category;
  const ItemsPage({super.key,required this.category});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  late CameraDescription cameraDescription;
  ItemsBloc bloc = sl<ItemsBloc>();

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
          appBar:  CustomAppBar(
            title:  "Select object",
            fontSize: isLandscape?(StyleConstants.fontSize - 6).sp:(StyleConstants.fontSize + 2).sp,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            },
                icon: Icon(Icons.arrow_back_ios,size: 22.r,)),
          ),
          body: Column(
            children: [
              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Container(
                  color: MyColors.white,
                  child: TextField(
                    maxLines: 1,
                    onChanged: (va) {
                      bloc.add(SearchEvent(va));
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: MyColors.colorPrimary, width: 1.0.w),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: MyColors.colorPrimary, width: 1.0.w),
                      ),
                      label: Text(
                        "Search".tr(),
                        style: TextStyle(fontSize:isLandscape?8.sp: 14.sp),
                      ),
                    ),
                  ),
                ),
              ),
              BlocBuilder<ItemsBloc,ItemsState>(
                bloc: bloc,
                builder: (context, state) {
                  return Expanded(
                    child:state.searchWord.trim().isEmpty?  CustomAnimatedList(
                        spacerHeight: 0,
                        listKey: GlobalKey(debugLabel: 'key'),
                        children: [
                          for(var item in widget.category==CategoriesEntity.animals?AnimalsEntity.values:
                          widget.category==CategoriesEntity.digitalTools?DigitalToolsEntity.values:
                          HomeEssentialsEnum.values)
                            Padding(
                              padding:  EdgeInsets.symmetric(vertical: 4.h,horizontal: 12.r),
                              child: CardDataWidget(
                                valueColor: Theme.of(context).primaryColor,
                                typeColor: Theme.of(context).primaryColor,
                                type: item.name.toPascalCase.removeUnderscores,
                                onPressed: (){
                                  checkPermissions(context,item.name,cameraDescription);
                                },
                              ),
                            ),
                        ]
                    ):
                    ListView.builder(
                      itemCount:widget.category==CategoriesEntity.animals?AnimalsEntity.values.length:
                      widget.category==CategoriesEntity.digitalTools?DigitalToolsEntity.values.length:
                      HomeEssentialsEnum.values.length,
                      itemBuilder: (context, index) {
                        if(state.searchWord.trim().isEmpty||widget.category==CategoriesEntity.animals?AnimalsEntity.values[index].name.trim().contains(state.searchWord.trim()):
                        widget.category==CategoriesEntity.digitalTools?DigitalToolsEntity.values[index].name.contains(state.searchWord):
                        HomeEssentialsEnum.values[index].name.contains(state.searchWord))
                        {
                          return Padding(
                            padding:  EdgeInsets.symmetric(vertical: 4.h,horizontal: 12.r),
                            child: CardDataWidget(
                              valueColor: Theme.of(context).primaryColor,
                              typeColor: Theme.of(context).primaryColor,
                              type:widget.category==CategoriesEntity.animals?AnimalsEntity.values[index].name.toPascalCase.removeUnderscores:
                              widget.category==CategoriesEntity.digitalTools?DigitalToolsEntity.values[index].name.toPascalCase.removeUnderscores:
                              HomeEssentialsEnum.values[index].name.toPascalCase.removeUnderscores,
                              onPressed: (){
                                checkPermissions(context,widget.category==CategoriesEntity.animals?AnimalsEntity.values[index].name:
                                widget.category==CategoriesEntity.digitalTools?DigitalToolsEntity.values[index].name:
                                HomeEssentialsEnum.values[index].name,cameraDescription);
                              },
                            ),
                          );
                        }
                        return const SizedBox();
                      },),
                  );
                },

              ),
            ],
          ),
        );
      },
    );
  }
}
