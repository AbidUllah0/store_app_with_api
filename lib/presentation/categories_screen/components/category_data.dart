import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app_api/presentation/widgets/custom_text.dart';
import 'package:store_app_api/providers/category_provider.dart';

import '../../../Utils/app_colors/app_colors.dart';

class CategoryData extends StatelessWidget {
  String imgUri;
  String title;

  CategoryData({required this.title, required this.imgUri});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imgUri,
              // 'https://i.ibb.co/vwB46Yq/shoes.png',
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: CustomText(
            text: title,
            backgroundColor: AppColors.lightCardColor.withOpacity(0.5),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
