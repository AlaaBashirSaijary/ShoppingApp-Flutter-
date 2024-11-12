import 'package:get/get.dart';
import 'package:newshop/controller/authController.dart';
import 'package:newshop/viwes/home_Screen/homeScreen.dart';
import 'package:newshop/viwes/splach_Screen/auth_creen/signup.dart';
import 'package:newshop/widget_common/bg_widget.dart';

import '../../../consts/consts.dart';
import '../../../consts/lists.dart';
import '../../../widget_common/Buttun_wideget.dart';
import '../../../widget_common/colum_widget.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return bgWidet(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                //width:MediaQuery.of(context).size.width * 0.8,
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(360),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(icAppLogo),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Login Screen",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: whiteColor),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 5),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // لون الظل
                        spreadRadius: 2, // مدى انتشار الظل
                        blurRadius: 5, // مدى تلاشي الظل
                        offset: Offset(0, 3), // موضع الظل
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Obx(
                    () => Column(children: [
                      CustomTextfield(title: email,hiteTitle: emaihint,isPass: false ),
                       CustomTextfield(title: password,hiteTitle: passwordhint,isPass: true ),
                     
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            forgetPassword,
                          ),
                        ),
                      ),
                      controller.isloading.value
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(redColor),
                            )
                          : Container(
                              width: MediaQuery.of(context).size.width - 50,
                              child: CustomButton(
                                  color: redColor,
                                  title: login,
                                  textColor: whiteColor,
                                  onPressed: () async {
                                    controller.isloading(true);
                                    await controller
                                        .loginMethod()
                                        .then((value) {
                                      if (value != null) {
                                        Get.snackbar(
                                          'Logın Scessful ',
                                          loggedin,
                                          snackPosition: SnackPosition.BOTTOM,
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red,
                                        );
                                        Get.offAll(() => Homescreen());
                                      } else {
                                        controller.isloading(false);
                                      }
                                    });
                                  })),
                      Align(
                        alignment: Alignment.center,
                        child: const Text(
                          CreatedNewAccont,
                          style: TextStyle(
                            color: fontGrey,
                          ),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width - 50,
                          child: CustomButton(
                              color: lightgolden,
                              title: Signup,
                              textColor: redColor,
                              onPressed: () {
                                Get.to(() => const SignupScren());
                              })),
                      Text(
                        loginwith,
                        style: TextStyle(
                          color: fontGrey,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            3,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor: lightGrey,
                                    radius: 25,
                                    child: Image.asset(
                                      socialIconList[index],
                                      width: 30,
                                    ),
                                  ),
                                )),
                      )
                    ]),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
