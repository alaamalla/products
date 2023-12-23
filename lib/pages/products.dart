import 'package:flutter/material.dart';
import 'package:products/main.dart';
import 'package:products/model.dart';
import 'package:products/pages/view_product.dart';
// import 'package:products/service.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: getdata(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             dynamic temp = snapshot.data;
//             List<ProductModel> search_result = [];
//             List<ProductModel> products = List.generate(temp['products'].length,
//                 (index) => ProductModel.fromMap(temp['products'][index]));
//             return Search_Products(
//               products: products,
//               search_result: search_result,
//             );
//           } else {
//             return Text('error');
//           }
//         },
//       ),
//     );
//   }
// }

// Icon iconfavorite = Icon(Icons.favorite_border, size: 15);

class Search_Products extends StatefulWidget {
  const Search_Products(
      {super.key, required this.products, required this.search_result});
  final List<ProductModel> products;
  final List<ProductModel> search_result;

  @override
  State<Search_Products> createState() => _Search_ProductsState();
}

class _Search_ProductsState extends State<Search_Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                // left: 25,
              ),
              child: Text(
                'Hello',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                'welcome to Laza',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 200,
                  child: TextField(
                    style: TextStyle(
                      color: dark_color,
                      fontWeight: FontWeight.bold,
                    ),
                    cursorColor: dark_color,
                    decoration: InputDecoration(
                      // focusColor: dark_color,
                      // hoverColor: dark_color,
                      fillColor: dark_color,
                      prefixIcon: Icon(
                        Icons.search,
                        color: dark_color,
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: dark_color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onChanged: (value) {
                      print(value);
                      setState(
                        () {
                          widget.search_result.clear();
                          widget.products.forEach(
                            (element) {
                              if (element.title.contains(value)) {
                                widget.search_result.add(element);
                              }
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: dark_color,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.keyboard_voice_outlined,
                      color: light_color,
                      size: 25,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'Choose Brand',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 35,
                    decoration: BoxDecoration(
                      color: light_color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.apple,
                          color: dark_color,
                        ),
                        Text(
                          'Apple',
                          style: TextStyle(
                            color: dark_color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      width: 100,
                      height: 35,
                      decoration: BoxDecoration(
                        color: light_color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.laptop,
                            color: dark_color,
                          ),
                          Text(
                            'Laptop',
                            style: TextStyle(
                              color: dark_color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 35,
                    decoration: BoxDecoration(
                      color: light_color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.phone_iphone,
                          color: dark_color,
                        ),
                        Text(
                          'iPhone',
                          style: TextStyle(
                            color: dark_color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      width: 100,
                      height: 35,
                      decoration: BoxDecoration(
                        color: light_color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            color: dark_color,
                          ),
                          Text(
                            'Camera',
                            style: TextStyle(
                              color: dark_color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'New Arraival',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
                height: 300,
                child: GridView.builder(
                  itemCount: widget.search_result.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 10,
                    // childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SingleChildScrollView(
                        child: Card(
                          child: Container(
                            // width: 100,
                            // height: 150,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: light_color,
                            ),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => View_Product_Page(
                                            productModel:
                                                widget.search_result[index]),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: widget.search_result[index].id,
                                    child: Image.network(
                                      widget.search_result[index].thumbnail,
                                      fit: BoxFit.cover,
                                      height: 75,
                                      width: double.maxFinite,
                                    ),
                                  ),
                                ),
                                Text(
                                  widget.search_result[index].title,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 12,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('price \$' +
                                        widget.search_result[index].price
                                            .toString()),
                                    InkWell(
                                        onTap: () {
                                          list_favorait.add(ProductModel(
                                            id: widget.search_result[index].id,
                                            title: widget
                                                .search_result[index].title,
                                            description: widget
                                                .search_result[index]
                                                .description,
                                            price: widget
                                                .search_result[index].price,
                                            rating: widget
                                                .search_result[index].rating,
                                            brand: widget
                                                .search_result[index].brand,
                                            thumbnail: widget
                                                .search_result[index].thumbnail,
                                          ));

                                          print(list_favorait);
                                          // for (int i = 0;
                                          //     i < list_favorait.length;
                                          //     i++) {
                                          //   if (widget.search_result[index].id ==
                                          //       list_favorait[i].id) {
                                          // setState(() {
                                          //   active_favorite(
                                          //           index, widget.search_result)
                                          //       as Icon;
                                          // });
                                          //   }
                                          // }
                                        },
                                        child: Icon(Icons.favorite_border)
                                        // active_favorite(
                                        //     index, widget.search_result),
                                        ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
                //  ListView.builder(
                //   itemCount: widget.search_result.length,
                //   itemBuilder: (context, index) {
                //     return ListTile(
                //       title: Text(widget.search_result[index].title),
                //       leading: Image.network(widget.search_result[index].thumbnail),
                //     );
                //   },
                // ),
                ),
          ],
        ),
      ),
    );
  }
}

active_favorite(int index, List<ProductModel> search_result) {
  for (int i = 0; i < list_favorait.length; i++) {
    if (list_favorait.isNotEmpty) {
      if (search_result[index].id == list_favorait[i].id) {
        return Icon(Icons.favorite);
      } else {
        return Icon(Icons.favorite_border);
      }
    } else if (list_favorait == null) {
      return Icon(Icons.favorite_border);
    }
  }
}
