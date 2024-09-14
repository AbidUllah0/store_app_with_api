import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app_api/providers/product_provider.dart';
import '../home_screen/components/feeds_widget.dart';
import '../product_details/product_details.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('All Products'),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Consumer<ProductProvider>(
          builder: (context, productProvider, child) {
            return FutureBuilder(
              future: productProvider.getAllProduct(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return GridView.builder(
                    itemCount: productProvider.productList.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.0,
                      mainAxisSpacing: 0.0,
                      childAspectRatio: 0.6,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetail(
                                title: productProvider.productList[index].title
                                    .toString(),
                                categoryName: productProvider
                                    .productList[index!].category!.name
                                    .toString(),
                                price: productProvider.productList[index].price
                                    .toString(),
                                img: productProvider.productList[index].images!,
                                description: productProvider
                                    .productList[index].description
                                    .toString(),
                              ),
                            ),
                          );
                        },
                        child: FeedsWidget(
                          title: productProvider.productList[index].title
                              .toString(),
                          imgUrl: productProvider.productList[index].images![0],
                          price: productProvider.productList[index].price
                              .toString(),
                        ),
                      );
                    },
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
