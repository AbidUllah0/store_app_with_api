import 'package:flutter/material.dart';
import 'package:store_app_api/Utils/app_colors/app_colors.dart';

class AppBarIcons extends StatelessWidget {
  IconData icon;
  void Function()? onTap;

  AppBarIcons({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).cardColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(icon),
          ),
        ),
      ),
    );
  }
}
