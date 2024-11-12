import 'package:get/get.dart';
import 'package:newshop/controller/home_controller.dart';
import 'package:newshop/viwes/categories/categori.dart';
import 'package:newshop/viwes/home_Screen/Home.dart';
import 'package:newshop/viwes/profile_Screen/prfile.dart';

import '../../consts/consts.dart';
import '../cartScreen/cart.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var nevbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(
            icHome,
            width: 26,
          ),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCategories,
            width: 26,
          ),
          label: category),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: 26,
          ),
          label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 26,
          ),
          label: account),
    ];
    var navBody = [
    Home(),Categries(),Cart(),Profile()
    ];

    return Scaffold(
      body: Column(
        children:[Obx(()=>
         Expanded(
            child: navBody.elementAt(controller.curentNavIndex.value),
          ),
        ),]
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.curentNavIndex.value,
          selectedItemColor: redColor,
          selectedLabelStyle: TextStyle(fontFamily: semibold),
          backgroundColor: whiteColor,
          type: BottomNavigationBarType.fixed,
          items: nevbarItem,
          onTap: (Value) {
            controller.curentNavIndex.value = Value;
          },
        ),
      ),
    );
  }
}
