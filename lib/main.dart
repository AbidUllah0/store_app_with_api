import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:store_app_api/presentation/home_screen/home_screen.dart';
import 'package:store_app_api/presentation/product_details/product_details.dart';
import 'package:store_app_api/providers/category_provider.dart';
import 'package:store_app_api/providers/detail_product_provider.dart';
import 'package:store_app_api/providers/product_provider.dart';
import 'package:store_app_api/providers/user_provider.dart';
import 'Utils/app_colors/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ProductProvider()),
            ChangeNotifierProvider(create: (_) => CategoryProvider()),
            ChangeNotifierProvider(create: (_) => UserProvider()),
            ChangeNotifierProvider(create: (_) => DetailProductProvider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Store App',
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.lightScaffoldColor,
              primaryColor: AppColors.lightCardColor,
              backgroundColor: AppColors.lightBackgroundColor,
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: AppColors.lightIconsColor,
                ),
                backgroundColor: AppColors.lightScaffoldColor,
                centerTitle: true,
                titleTextStyle: TextStyle(
                    color: AppColors.lightTextColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                elevation: 0,
              ),
              iconTheme: IconThemeData(
                color: AppColors.lightIconsColor,
              ),

              textSelectionTheme: const TextSelectionThemeData(
                cursorColor: Colors.black,
                selectionColor: Colors.blue,

                // selectionHandleColor: Colors.blue,
              ),

              // textTheme: TextTheme()
              // textTheme: Theme.of(context).textTheme.apply(
              //       bodyColor: Colors.black,
              //       displayColor: Colors.black,
              //     ),
              cardColor: AppColors.lightCardColor,
              brightness: Brightness.light,
              colorScheme: ThemeData().colorScheme.copyWith(
                    secondary: AppColors.lightIconsColor,
                    brightness: Brightness.light,
                  ),
            ),
            home: HomeScreen(),
          ),
        );
      },
    );
  }
}
