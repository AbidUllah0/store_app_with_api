import 'package:flutter/material.dart';
import 'package:store_app_api/presentation/widgets/custom_text.dart';

import '../../../Utils/app_colors/app_colors.dart';

class UserWidget extends StatelessWidget {
  String imgUri;
  String userName;
  String email;
  String userRole;

  UserWidget(
      {required this.imgUri,
      required this.userName,
      required this.userRole,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            imgUri,
            height: 60,
            width: 60,
            fit: BoxFit.cover,
            errorBuilder:
                (BuildContext context, Object error, StackTrace? stackTrace) {
              return Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
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
        title: CustomText(text: userName),
        subtitle: CustomText(text: email),
        trailing: CustomText(
          text: userRole,
          fontWeight: FontWeight.bold,
          color: AppColors.lightIconsColor,
        ),
      ),
    );
  }
}
