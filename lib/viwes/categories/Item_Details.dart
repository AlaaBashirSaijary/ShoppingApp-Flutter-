
import 'package:newshop/consts/lists.dart';

import '../../consts/consts.dart';
import '../../widget_common/Buttun_wideget.dart';

class ItemDetail extends StatefulWidget {
  final String? title;
    
  ItemDetail({super.key, this.title});

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
   int rating=0; 
  void initState() {
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(
          '${widget.title}',
          style: TextStyle(fontFamily: bold, color: darkFontGrey),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share, color: darkFontGrey)),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border, color: darkFontGrey))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height*0.35, // تحديد ارتفاع ثابت
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        addAutomaticKeepAlives: true,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            width: MediaQuery.sizeOf(context).width, // تحديد عرض العنصر
                            child: Image.asset(
                              imgFc4,
                              fit: BoxFit.fill, // أو أي خيار آخر
                            ),
                          );
                        },
                      ),
                    ),
                const    SizedBox(height: 10,),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                          '${widget.title}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: semibold, color: darkFontGrey),
                        ),
                ),
               const    SizedBox(height: 5,), 
               Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: List.generate(5, (index) {
                     return IconButton(icon: Icon(
                      
                            index < rating ? Icons.star : Icons.star_border,
                            size: 25,
                         color: index < rating ? Colors.amber : Colors.grey,
                       ),
                     onPressed: () {  setState(() {
                           rating = index + 1; // تحديث التقييم عند النقر
                         }); },);
                   }
                   ),
                   ) ,
                    const    SizedBox(height: 10,), 
                    Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                          '\$30.000',
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: bold, color: redColor),
                        ),
                ),
                 const    SizedBox(height: 10,), 
                 Container(
                  height: 60,
                  color: textfieldGrey,
                  padding:const EdgeInsets.symmetric(horizontal: 16),
                   child: Row(
                    
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'saller',
                              style:  TextStyle(
                                color: whiteColor,
                                fontFamily: semibold),
                            ),
                            SizedBox(height: 5,),
                             Text(
                              'in Houes Brands',
                              style:  TextStyle(
                                fontSize: 16,
                                color: darkFontGrey,
                                fontFamily: semibold,),
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.message_rounded,color:darkFontGrey),
                      ),
                    
                    ],
                   ),
                 ) ,
                   SizedBox(height: 20,),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5), // لون الظل
                                spreadRadius: 2, // مدى انتشار الظل
                                blurRadius: 5, // مدى تلاشي الظل
                                offset: Offset(0, 3), // موضع الظل
                              ),
                          ],
                          color: whiteColor,
                        ),
                        
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [SizedBox(
                                  width: 100,
                                  child:  Text(
                                'Caler',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: semibold, color: textfieldGrey),
                              ),
                                ),
                                Row(children: List.generate(3, (index) => Container(
            width: 40, // عرض الصندوق
            height: 40,
            margin: EdgeInsets.symmetric(horizontal: 4), // ارتفاع الصندوق
            decoration: BoxDecoration(
             color: index == 0
    ? Colors.blue
    : index == 1
        ? Colors.orange
        : Colors.blueGrey, // لون خلفية الصندوق
              borderRadius: BorderRadius.circular(360), // زوايا مدورة
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // لون الظل
                  spreadRadius: 5, // مدى انتشار الظل
                  blurRadius: 7, // مدى ضبابية الظل
                  offset: Offset(0, 3), // اتجاه الظل
                ),
              ],
            ),)),)],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: whiteColor,
                          boxShadow: []
                        ),
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                           
                              Row(children: [
                                  SizedBox(width: 100,
                             child:Text(
                                'Color',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: semibold, color: textfieldGrey),
                              ),),
                                IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
                                Text(
                                '0',
                                style: const TextStyle(
                                  
                                  fontFamily: bold, color: darkFontGrey),
                              ),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                                  SizedBox(width: 10,),
                                  Text(
                                '(0 available)',
                                style: const TextStyle(
                                  
                                  fontFamily: bold, color: textfieldGrey),
                              ),
                              ],),
                          ],
                        ),
                      ),
                      
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: whiteColor,boxShadow: []
                            ),
                            child: Row(
                                children: [
                                   SizedBox(width: 100,
                             child:Text(
                                'Total',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: semibold, color: textfieldGrey),
                              ),),
                              Text(
                                '\$0.00',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: bold, color: redColor),
                              ),
                                ],
                              ),
                          ),
                          const SizedBox(height: 10,),
                           Align(
                            alignment: Alignment.topLeft,
                             child: Text(
                                  'Description',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: semibold, color: darkFontGrey),
                                ),
                           ),
                               const SizedBox(height: 10,),
                               Align
                              (
                                 alignment: Alignment.topLeft,
                                 child: Text(
                                  'This is dumy item dumy description here.. ',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: semibold, color: darkFontGrey),
                                                             ),
                               ),
                              ListView
                              (shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                                children:
                              List.generate(ItemDetailesButton.length, (index) => ListTile(
                                title: Text(
                                ItemDetailesButton[index],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: semibold, color: darkFontGrey),
                              ), 
                              trailing: Icon(Icons.arrow_forward),
                              )),),
                              SizedBox(height: 20,),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Peodect Your may also LiKe',
                                  style:  TextStyle(
                                  fontSize: 16,
                                  fontFamily: bold, color: darkFontGrey),
                               
                                ),
                              ),
                              SizedBox(height: 10,),
                                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                   child: Row(
                    children: List.generate(6, (index) => Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                    color: whiteColor,borderRadius: BorderRadius.circular(25)
                                 ),
                                 width: MediaQuery.sizeOf(context).width*0.5,
                                 height:  MediaQuery.sizeOf(context).height*0.3,
                                 clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(imgP1 ,width: 150,fit: BoxFit.fill,),
                        const  SizedBox(height: 10,),
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
                    )),
                   ),
                 )
                           
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: CustomButton(
              color: redColor,
              onPressed: () {},
              textColor: whiteColor,
              title: addtocart,
            ),
          ),
         
        ],
      ),
    );
  }
}