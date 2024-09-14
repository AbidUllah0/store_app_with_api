import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:store_app_api/presentation/widgets/custom_text.dart';
import 'package:store_app_api/providers/detail_product_provider.dart';

import '../../Utils/app_colors/app_colors.dart';

class ProductDetail extends StatelessWidget {
  List<String> img;
  String categoryName;
  String title;
  String price;
  String description;

  ProductDetail({
    required this.title,
    required this.price,
    required this.img,
    required this.description,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    final detailProductProvider = Provider.of<DetailProductProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.lightIconsColor,
                      ),
                    ),
                    CustomText(
                      text: categoryName,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: title, //'Lorem Ipsum',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '\$',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(33, 150, 243, 1),
                                ),
                              ),
                              TextSpan(
                                text: price.toString(),

                                ///'168.00',
                                style: TextStyle(
                                  color: AppColors.lightTextColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                /// take the size of 40 %
                height: MediaQuery.of(context).size.height * 0.4,
                child: Swiper(
                  itemCount: img.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      img[index],
                      // 'https://i.ibb.co/vwB46Yq/shoes.png',
                      width: MediaQuery.of(context).size.width,
                      // height: 200.h,
                    );
                  },
                  pagination: SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                          activeColor: Colors.red, color: Colors.white)),
                  autoplay: true,
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Description',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 18),
                    CustomText(
                      text: description,
                      // 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry"s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                      fontSize: 25,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
