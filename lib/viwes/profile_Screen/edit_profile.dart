import 'dart:io';

import 'package:get/get.dart';
import 'package:newshop/controller/Profile_Conteroller.dart';
import 'package:newshop/widget_common/bg_widget.dart';

import '../../consts/consts.dart';
import '../../widget_common/Buttun_wideget.dart';
import '../../widget_common/colum_widget.dart';

class EditProfile extends StatelessWidget {
  final dynamic data;
  const EditProfile({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    controller.nameController.text = data['name'];
    controller.passController.text=data['password'];
    return bgWidet(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(),
          body: Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(top: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // لون الظل
                  spreadRadius: 2, // مدى انتشار الظل
                  blurRadius: 5, // مدى تلاشي الظل
                  offset: const Offset(0, 3), // موضع الظل
                ),
              ],
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            child: Obx(
              () => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(360),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: controller.profileImagePath.isEmpty
                        ? Image.asset(
                            imgProfile2,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            File(controller.profileImagePath.value),
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      color: redColor,
                      onPressed: () {
                        controller.ChangeImage();
                      },
                      textColor: whiteColor,
                      title: "Change"),
                  Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextfield(
                      title: name,
                      hiteTitle: namehint,
                      controller: controller.nameController,
                      isPass: false),
                  CustomTextfield(
                      title: password,
                      hiteTitle: passwordhint,
                      controller: controller.passController,
                      isPass: true),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width - 60,
                      child: CustomButton(
                          color: redColor,
                          onPressed: () {},
                          textColor: whiteColor,
                          title: "Save")),
                ],
              ),
            ),
          )),
    );
  }
}