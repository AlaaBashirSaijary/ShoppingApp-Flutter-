import 'package:get/get.dart';
import 'package:newshop/controller/authController.dart';
import 'package:newshop/viwes/home_Screen/homeScreen.dart';

import '../../../consts/consts.dart';
import '../../../widget_common/Buttun_wideget.dart';
import '../../../widget_common/bg_widget.dart';
import '../../../widget_common/colum_widget.dart';

class SignupScren extends StatefulWidget {
  const SignupScren({super.key});

  @override
  State<SignupScren> createState() => _SignupScrenState();
}

class _SignupScrenState extends State<SignupScren> {
  bool? ischeck = false;
  var controller = Get.put(AuthController());
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidet(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Join The Shopping",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: whiteColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
              child: Obx(
                () => Container(
                    width: MediaQuery.of(context).size.width,
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
                    clipBehavior: Clip.antiAlias,
                    child: Column(children: [
                      
                      CustomTextfield(title:name,hiteTitle: namehint,controller: nameController,isPass: false),
                      CustomTextfield(title: email,hiteTitle: emaihint,controller:emailController,isPass: false ),
                      CustomTextfield(
                         title: password,hiteTitle: passwordhint,controller: passwordController, isPass:true),
                      CustomTextfield( title:restartpassword, hiteTitle:passwordhint,
                        controller:  repasswordController,isPass: true),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            forgetPassword,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                              checkColor: whiteColor,
                              activeColor: redColor,
                              value: ischeck,
                              onChanged: (newValue) {
                                setState(() {
                                  ischeck = newValue;
                                });
                              }),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: 'I  agree to ',
                                    style: TextStyle(
                                        fontFamily: regular, color: fontGrey)),
                                TextSpan(
                                    text: termAndCond,
                                    style: TextStyle(
                                        fontFamily: regular, color: redColor)),
                                TextSpan(
                                    text: '&',
                                    style: TextStyle(
                                        fontFamily: regular, color: fontGrey)),
                                TextSpan(
                                    text: privacyPolicy,
                                    style: TextStyle(
                                        fontFamily: regular, color: redColor))
                              ]),
                            ),
                          ),
                        ],
                      ),
                      controller.isloading.value
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(redColor),
                            )
                          : Container(
                              width: MediaQuery.of(context).size.width - 50,
                              child: CustomButton(
                                  color: ischeck == true ? redColor : lightGrey,
                                  title: Signup,
                                  textColor: whiteColor,
                                  onPressed: () async {
                                    if (ischeck != false) {
                                      controller.isloading(true);
                                      try {
                                        await controller.SugnUpMethod(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        ).then((value) {
                                          return controller.storeUserData(
                                              email: emailController.text,
                                              password: passwordController.text,
                                              name: nameController);
                                        }).then((value) {
                                          Get.snackbar(
                                            'Logın Scessful ',
                                            loggedin,
                                            snackPosition: SnackPosition.BOTTOM,
                                            colorText: Colors.white,
                                            backgroundColor: Colors.red,
                                          );
                                          Get.offAll(() => Homescreen());
                                        });
                                      } catch (e) {
                                        auth.signOut();
                                        Get.snackbar(
                                          'loggedout Scessful ',
                                          e.toString(),
                                          snackPosition: SnackPosition.BOTTOM,
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red,
                                        );
                                        controller.isloading(false);
                                      }
                                    }
                                  })),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: alreadyhaveAcoount,
                              style:
                                  TextStyle(fontFamily: bold, color: fontGrey)),
                          TextSpan(
                              text: login,
                              style:
                                  TextStyle(fontFamily: bold, color: redColor))
                        ])),
                      )
                    ])),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
