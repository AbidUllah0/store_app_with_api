import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:store_app_api/Data/model/detail_product.dart';
import 'package:store_app_api/presentation/product_details/product_details.dart';
import 'package:store_app_api/presentation/widgets/custom_text.dart';
import '../../../Utils/app_colors/app_colors.dart';
import '../../../providers/detail_product_provider.dart';

class FeedsWidget extends StatelessWidget {
  String title;
  String imgUrl;
  String price;

  FeedsWidget({required this.title, required this.imgUrl, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        ///material for slowly animation
        color: Theme.of(context).cardColor,
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '\$',
                          style: TextStyle(
                            color: Color.fromRGBO(33, 150, 243, 1),
                          ),
                        ),
                        TextSpan(
                          text: price,
                          style: TextStyle(
                            color: AppColors.lightTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    IconlyBold.heart,
                    color: AppColors.lightIconsColor,
                    size: 28,
                  ),
                ],
              ),
              SizedBox(height: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imgUrl,
                  fit: BoxFit.cover,
                  height: 150.h,
                  width: 150.w,
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return Center(
                      child: Container(
                        height: 140.h,
                        color: Colors.red,
                        child: Center(
                          child: Icon(
                            Icons.error,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              CustomText(
                text: title,
                overflow: TextOverflow.ellipsis,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
