import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_text.dart';

class SaleCarousel extends StatelessWidget {
  const SaleCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.2,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: [
            Color(0xff7A60A5),
            Color(0xff82C3DF),
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8),
            child: Container(
              width: 140.w,
              decoration: BoxDecoration(
                color: Color(0xff9689CE),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Get the special Discount',
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    SizedBox(height: 5),
                    CustomText(
                      text: '50 %\nOFF',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30,
                      letterSpacing: 1.8,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/shoes1.png',

                /// 'https://i.ibb.co/vwB46Yq/shoes.png',
                width: 100.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
