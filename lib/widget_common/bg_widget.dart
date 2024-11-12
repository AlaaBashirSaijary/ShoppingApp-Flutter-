import 'package:newshop/consts/consts.dart';

Widget bgWidet( {required Scaffold child}) {
  return Container(
decoration: BoxDecoration(
  image: DecorationImage(image: AssetImage(imgBackground),fit: BoxFit.fill
),
),
child: child,
  );
}
