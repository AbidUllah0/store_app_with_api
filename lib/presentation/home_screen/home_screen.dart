import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:store_app_api/Data/model/product_model.dart';
import 'package:store_app_api/presentation/feed_screen/feed_screen.dart';
import 'package:store_app_api/presentation/home_screen/components/custom_text_field.dart';
import 'package:store_app_api/presentation/home_screen/components/feeds_widget.dart';
import 'package:store_app_api/presentation/home_screen/components/sale_carosel.dart';
import 'package:store_app_api/presentation/product_details/product_details.dart';
import 'package:store_app_api/presentation/users_screen/user_screen.dart';
import 'package:store_app_api/presentation/widgets/appbar_icons.dart';
import 'package:store_app_api/presentation/widgets/custom_text.dart';

import '../../providers/product_provider.dart';
import '../categories_screen/categories_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    // TODO: implement initState
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final productProvider = Provider.of<ProductProvider>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: AppBarIcons(
            icon: IconlyBold.category,
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: CategoryScreen(),
                ),
              );
            },
          ),
          actions: [
            AppBarIcons(
              icon: IconlyBold.user3,
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: UserScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: Column(
            children: [
              SizedBox(height: 12),
              CustomTextField(
                hintText: 'Search',
                onChanged: (value) {
                  setState(() {});
                },
                searchController: _searchController,
              ),
              SizedBox(height: 12),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.22,
                        child: Swiper(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return SaleCarousel();
                          },
                          autoplay: true,
                          pagination: SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                              activeColor: Colors.red,
                              color: Colors.white,
                            ),
                          ),

                          ///arrow of forward and backword
                          /// control: SwiperControl(),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Latest Products',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          AppBarIcons(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: FeedScreen(),
                                ),
                              );
                            },
                            icon: IconlyBold.arrowRight2,
                          ),
                        ],
                      ),
                      Consumer<ProductProvider>(
                        builder: (context, productProvider, child) {
                          return FutureBuilder(
                            future: productProvider.getAllProduct(),
                            builder: (context,
                                AsyncSnapshot<List<ProductModel>> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text(
                                    'An error accured ${snapshot.error}',
                                  ),
                                );
                              }
                              if (!snapshot.hasData) {
                                return CircularProgressIndicator();
                              } else {
                                return GridView.builder(
                                  itemCount: productProvider.productList.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 0.0,
                                    mainAxisSpacing: 0.0,
                                    childAspectRatio: 0.6,
                                  ),
                                  itemBuilder: (context, index) {
                                    String searchbyCategory = productProvider
                                        .productList[index].title
                                        .toString();
                                    // String searchName = snapshot.data![index]['country'];

                                    if (_searchController.text.isEmpty) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetail(
                                                categoryName: productProvider
                                                    .productList[index]
                                                    .category!
                                                    .name
                                                    .toString(),
                                                title: productProvider
                                                    .productList[index].title
                                                    .toString(),
                                                price: productProvider
                                                    .productList[index].price
                                                    .toString(),
                                                img: productProvider
                                                    .productList[index].images!,
                                                description: productProvider
                                                    .productList[index]
                                                    .description
                                                    .toString(),
                                              ),
                                            ),
                                          );
                                        },
                                        child: FeedsWidget(
                                          title: productProvider
                                              .productList[index].title
                                              .toString(),
                                          imgUrl: productProvider
                                              .productList[index].images![0]
                                              .toString(),
                                          price: productProvider
                                              .productList[index].price
                                              .toString(),
                                        ),
                                      );
                                    } else if (searchbyCategory
                                        .toLowerCase()
                                        .contains(_searchController.text
                                            .toLowerCase())) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ProductDetail(
                                                    categoryName:
                                                        productProvider
                                                            .productList[index]
                                                            .category!
                                                            .name
                                                            .toString(),
                                                    title: productProvider
                                                        .productList[index]
                                                        .title
                                                        .toString(),
                                                    price: productProvider
                                                        .productList[index]
                                                        .price
                                                        .toString(),
                                                    img: productProvider
                                                        .productList[index]
                                                        .images!,
                                                    description: productProvider
                                                        .productList[index]
                                                        .description
                                                        .toString(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        child: FeedsWidget(
                                          title: productProvider
                                              .productList[index].title
                                              .toString(),
                                          imgUrl: productProvider
                                              .productList[index].images![0]
                                              .toString(),
                                          price: productProvider
                                              .productList[index].price
                                              .toString(),
                                        ),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  },
                                );
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
