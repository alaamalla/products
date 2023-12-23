import 'package:flutter/material.dart';
import 'package:products/main.dart';
import 'package:products/model.dart';
import 'package:products/pages/products.dart';

class View_Product_Page extends StatelessWidget {
  const View_Product_Page({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light_color,
      appBar: AppBar(backgroundColor: dark_color, foregroundColor: light_color),
      body: Column(
        children: [
          Card(
            color: dark_color,
            child: Container(
              width: double.maxFinite,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )),
              child: Hero(
                  tag: productModel.id,
                  child: Image.network(
                    productModel.thumbnail,
                    fit: BoxFit.fill,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Men\'s Printed Pullover Hoodie',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Price     ',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        '${productModel.title}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Text(
                      '\$${productModel.price}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 40,
                        decoration: BoxDecoration(
                          // color: light_color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Image.network(productModel.thumbnail,
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 40,
                        decoration: BoxDecoration(
                          // color: light_color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Image.network(productModel.thumbnail,
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 40,
                        decoration: BoxDecoration(
                          // color: light_color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Image.network(productModel.thumbnail,
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 40,
                        decoration: BoxDecoration(
                          // color: light_color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Image.network(productModel.thumbnail,
                              fit: BoxFit.fill),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Text(
                    'Virsion',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: 65,
                          height: 35,
                          decoration: BoxDecoration(
                            color: dark_color,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              '2019',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: light_color,
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Container(
                            width: 65,
                            height: 35,
                            decoration: BoxDecoration(
                              color: dark_color,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                '2020',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: light_color,
                                ),
                              ),
                            )),
                      ),
                      Container(
                          width: 65,
                          height: 35,
                          decoration: BoxDecoration(
                            color: dark_color,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              '2021',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: light_color,
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                            width: 65,
                            height: 35,
                            decoration: BoxDecoration(
                              color: dark_color,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                '2022',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: light_color,
                                ),
                              ),
                            )),
                      ),
                      Container(
                        width: 65,
                        height: 35,
                        decoration: BoxDecoration(
                          color: dark_color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            '2023',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: light_color,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Text(
                    'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '${productModel.description}',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Price (with VAT,SD)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${productModel.price + 5}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    list_buying.add(ProductModel(
                      id: productModel.id,
                      title: productModel.title,
                      description: productModel.description,
                      price: productModel.price + 5,
                      rating: productModel.rating,
                      brand: productModel.brand,
                      thumbnail: productModel.thumbnail,
                    ));
                    print(list_buying);
                    total_Price += productModel.price.toInt() + 5;
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      width: double.maxFinite,
                      height: 35,
                      decoration: BoxDecoration(
                        color: dark_color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Buying',
                          style: TextStyle(
                            color: light_color,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
