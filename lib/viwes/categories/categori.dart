import 'package:get/get.dart';
import 'package:newshop/consts/lists.dart';
import 'package:newshop/widget_common/bg_widget.dart';

import '../../consts/consts.dart';
import 'categoriesdetails.dart';

class Categries extends StatelessWidget {
  const Categries({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidet(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                category,
                style: TextStyle(color: whiteColor, fontFamily: bold),
              ),
            ),
            body: Container(
              padding: EdgeInsets.all(12),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 200),
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Get.to(()=>categoriesdetails(title: CategoryList[index],));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5), // لون الظل
                              spreadRadius: 2, // مدى انتشار الظل
                              blurRadius: 5, // مدى تلاشي الظل
                              offset: Offset(0, 3), // موضع الظل
                            ),
                          ],
                          borderRadius: BorderRadius.circular(25)),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          Image.asset(
                            CategoryImage[index],
                            height: 120,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            CategoryList[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(color: darkFontGrey),
                          )
                        ],
                      ),
                    )),
              ),
            )));
  }
}
