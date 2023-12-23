import 'package:flutter/material.dart';
import 'package:products/main.dart';
import 'package:products/model.dart';
import 'package:products/pages/products.dart';
import 'package:products/service.dart';
import 'package:products/pages/view_product.dart';

List pages = [
  Scaffold(
    body: FutureBuilder(
      future: getdata(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          dynamic temp = snapshot.data;
          List<ProductModel> search_result = List.generate(
              temp['products'].length,
              (index) => ProductModel.fromMap(temp['products'][index]));
          List<ProductModel> products = List.generate(temp['products'].length,
              (index) => ProductModel.fromMap(temp['products'][index]));
          return Search_Products(
            products: products,
            search_result: search_result,
          );
          // } else if (snapshot.hasError) {
          //   return Center(child: Text('no internet'));
        } else {
          return Center(
              child: CircularProgressIndicator(
            color: dark_color,
          ));
        }
      },
    ),
  ),
  Scaffold(
    body: StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        if (list_favorait.isNotEmpty) {
          return Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 500,
                // color: light_color,
                child: GridView.builder(
                  itemCount: list_favorait.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: light_color,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => View_Product_Page(
                                          productModel: list_favorait[index]),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: list_favorait[index].id,
                                  child: Image.network(
                                    list_favorait[index].thumbnail,
                                    fit: BoxFit.cover,
                                    height: 75,
                                    width: double.maxFinite,
                                  ),
                                ),
                              ),
                              Text(
                                list_favorait[index].title,
                                maxLines:
                                    2, // تحديد الحد الأقصى لعدد الأسطر هنا
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('price \$' +
                                      list_favorait[index].price.toString()),
                                  InkWell(
                                    onTap: () {
                                      list_favorait.removeAt(index);
                                    },
                                    child: Icon(
                                      Icons.favorite_outlined,
                                      size: 15,
                                      color: dark_color,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Text((list_favorait.isNotEmpty) ? list_favorait[0]['title'] : 'no')
            ],
          );
        } else {
          return Center(
              child: Text(
            'No Favorite',
            style: TextStyle(
              color: dark_color,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ));
        }
      },
    ),
  ),
  Scaffold(
    body: StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        if (list_buying.isNotEmpty) {
          return Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 470,
                // color: dark_color,
                child: GridView.builder(
                  itemCount: list_buying.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: light_color,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => View_Product_Page(
                                          productModel: list_buying[index]),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: list_buying[index].id,
                                  child: Image.network(
                                    list_buying[index].thumbnail,
                                    fit: BoxFit.cover,
                                    height: 75,
                                    width: double.maxFinite,
                                  ),
                                ),
                              ),
                              Text(
                                list_buying[index].title,
                                maxLines:
                                    2, // تحديد الحد الأقصى لعدد الأسطر هنا
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('price \$' +
                                      list_buying[index].price.toString()),
                                  InkWell(
                                    onTap: () {
                                      total_Price -=
                                          list_buying[index].price.toInt();
                                      list_buying.removeAt(index);
                                    },
                                    child: Icon(
                                      Icons.shopping_cart_rounded,
                                      size: 15,
                                      color: dark_color,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Text((list_favorait.isNotEmpty) ? list_favorait[0]['title'] : 'no')
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.maxFinite,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: dark_color,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Total Price (with VAT,SD)',
                        style: TextStyle(
                          color: light_color,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '\$${total_Price}',
                        style: TextStyle(
                          color: light_color,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        } else {
          return Center(
              child: Text(
            'No Purchases',
            style: TextStyle(
              color: dark_color,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ));
        }
      },
    ),
  ),
];
