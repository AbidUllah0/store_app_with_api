import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app_api/presentation/categories_screen/components/category_data.dart';
import 'package:store_app_api/presentation/widgets/custom_text.dart';

import '../../providers/category_provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: CustomText(
            text: 'Categories',
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: categoryProvider.getCategoryData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('Error Occured ${snapshot.hasError}');
            } else {
              return GridView.builder(
                itemCount: categoryProvider.categoryList.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,
                  // childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  return CategoryData(
                    title: categoryProvider.categoryList[index].name.toString(),
                    imgUri:
                        categoryProvider.categoryList[index].image.toString(),
                  );
                },
              );
            }
          },
        ));
  }
}
