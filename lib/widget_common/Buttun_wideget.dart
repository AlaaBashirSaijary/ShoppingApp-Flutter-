import 'package:newshop/consts/consts.dart';

Widget CustomButton({onPressed,color,textColor,title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: color,
      padding: const EdgeInsets.all(12)
    ),
    onPressed: onPressed, child: Text(title, style: TextStyle(
    color: textColor,
    fontFamily: bold,
  ),));
}
