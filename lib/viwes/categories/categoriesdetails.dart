import 'package:get/get.dart';
import 'package:newshop/viwes/categories/Item_Details.dart';
import 'package:newshop/widget_common/bg_widget.dart';

import '../../consts/consts.dart';

class categoriesdetails extends StatelessWidget {
  final String? title;
  const categoriesdetails({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidet(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          '$title',
          style: TextStyle(fontFamily: bold, color: whiteColor),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
                    6,
                    (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: 120,
                          height: 60,
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              'baby clothing',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: semibold,
                                  color: darkFontGrey),
                            ),
                          ),
                        ))),
          ),
          SizedBox(height:20 ,),
          Expanded(
            child:  GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 250), 
                itemBuilder: (context,index)=>
                GestureDetector(
                    onTap: () {
                      Get.to(()=>ItemDetail(title:'Alaa',));
                    },
                  child: Container(decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: whiteColor,
                            boxShadow: [  BoxShadow(
                                color: Colors.grey.withOpacity(0.5), // لون الظل
                                spreadRadius: 2, // مدى انتشار الظل
                                blurRadius: 5, // مدى تلاشي الظل
                                offset: Offset(0, 3), // موضع الظل
                              ),]
                          ),
                          clipBehavior: Clip.antiAlias,
                          padding: EdgeInsets.all(12),
                          child: 
                              Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(imgP5 ,
                            height: 150,
                            width: 200,fit: BoxFit.fill,),
                        
                          Text('Laptop',style: TextStyle(
                            fontFamily: semibold,color: darkFontGrey
                          ),),
                          const  SizedBox(height: 10,),
                          Text('\$600',style: TextStyle(
                            fontSize: 16,
                            fontFamily: bold,color: redColor
                          ),),
                            ],
                        ),
                            
                          ),
                ),)
          )
        ]),
      ),
    ));
  }
}
