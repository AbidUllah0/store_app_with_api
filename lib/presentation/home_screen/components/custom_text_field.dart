import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../Utils/app_colors/app_colors.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  String hintText;
  void Function(String)? onChanged;
  void Function()? onTap;

  CustomTextField({
    required this.hintText,
    required this.searchController,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: searchController,
      onChanged: onChanged,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Theme.of(context).cardColor,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.secondary)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Theme.of(context).cardColor),
        ),
        suffixIcon: Icon(
          IconlyBold.search,
          color: AppColors.lightIconsColor,
        ),
      ),
    );
  }
}
