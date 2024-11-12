
import '../../consts/consts.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:  Colors.white,
      child:Center(
        child: Text(
          'Cart is Emptey',
          style: TextStyle(
            fontFamily: semibold,
            color: darkFontGrey
          ),
        ),
      )
    );
  }
}