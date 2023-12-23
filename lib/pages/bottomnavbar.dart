import 'package:flutter/material.dart';
import 'package:products/main.dart';
import 'package:products/pages/pages.dart';
import 'package:products/pages/login.dart';
import 'package:products/service.dart';

TextEditingController controller_title = TextEditingController();
TextEditingController controller_description = TextEditingController();
TextEditingController controller_price = TextEditingController();
TextEditingController controller_brand = TextEditingController();
TextEditingController controller_thumbnail = TextEditingController();
TextEditingController controller_rating = TextEditingController();
TextEditingController controller_id = TextEditingController();

String choos_color = 'Defult';
String choos_language = 'English';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light_color,
      appBar: AppBar(
        foregroundColor: light_color,
        backgroundColor: dark_color,
        actions: [
          InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(Icons.shopping_cart_outlined),
              ))
        ],
        title: Text(
          (selectedIndex == 0)
              ? 'Home'
              : (selectedIndex == 1)
                  ? 'Favorite'
                  : 'Shopping',
          style: TextStyle(
            color: light_color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: light_color,
        elevation: 0,
        indicatorColor: dark_color,
        // indicatorShape: CircleBorder(),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        animationDuration: Duration(seconds: 1),
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        selectedIndex: selectedIndex,
        destinations: [
          NavigationDestination(
            tooltip: null,
            // selectedIcon: Icon(Icons.facebook),
            icon: Icon(
              Icons.home,
              color: dark_color,
            ),
            label: 'Home',

            selectedIcon: Icon(
              Icons.home,
              color: light_color,
            ),
          ),
          NavigationDestination(
            icon: Icon(
              Icons.favorite_border_outlined,
              color: dark_color,
            ),
            label: 'Favorite',
            selectedIcon: Icon(
              Icons.favorite_border_outlined,
              color: light_color,
            ),
          ),
          NavigationDestination(
            icon: Icon(
              Icons.shopping_cart,
              color: dark_color,
            ),
            label: 'Shopping',
            selectedIcon: Icon(
              Icons.shopping_cart,
              color: light_color,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: light_color,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
              child: Container(
                width: double.maxFinite,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: dark_color,
                      width: 3,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: 100,
                      decoration: BoxDecoration(
                          color: dark_color,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          )),
                      child: Icon(
                        Icons.person,
                        color: light_color,
                        size: 100,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35, left: 15),
                      child: Text(
                        'User Name : ${username.text}',
                        style: TextStyle(
                          color: dark_color,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 15),
                      child: Text(
                        'Password    : ${password.text}',
                        style: TextStyle(
                          color: dark_color,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 25, left: 15),
                    //   child: Text(
                    //     'My Score    : ${score}',
                    //     style: TextStyle(
                    //       color: dark_color,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 15,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
              child: Container(
                width: double.maxFinite,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: dark_color,
                      width: 3,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: 100,
                      decoration: BoxDecoration(
                          color: dark_color,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          )),
                      child: Icon(
                        Icons.settings,
                        color: light_color,
                        size: 75,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 15),
                      child: Row(
                        children: [
                          Text(
                            'Language    :',
                            style: TextStyle(
                              color: dark_color,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: DropdownButton(
                              elevation: 0,
                              dropdownColor: light_color,
                              iconEnabledColor: dark_color,
                              // focusColor: dark_color,
                              value: choos_language,
                              items: ['English']
                                  .map<DropdownMenuItem<String>>((String val) {
                                return DropdownMenuItem<String>(
                                  child: Text(
                                    val,
                                    style: TextStyle(
                                      color: dark_color,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  value: val,
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  choos_language = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 15),
                      child: Row(
                        children: [
                          Text(
                            'My Color     :',
                            style: TextStyle(
                              color: dark_color,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: DropdownButton(
                              elevation: 0,
                              dropdownColor: light_color,
                              iconEnabledColor: dark_color,
                              // focusColor: dark_color,
                              value: choos_color,
                              items: [
                                'Defult',
                                'Red',
                                'Blue',
                                'Green',
                                'Orange',
                                'Purple',
                                'Brown'
                              ].map<DropdownMenuItem<String>>((String val) {
                                return DropdownMenuItem<String>(
                                  child: Text(
                                    val,
                                    style: TextStyle(
                                      color: dark_color,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  value: val,
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  choos_color = value!;
                                  color_value(value);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 15, right: 15),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: light_color,
                                title: Text(
                                  'Properties',
                                  style: TextStyle(
                                    color: dark_color,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: Container(
                                  height: 200,
                                  // color: dark_color,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: InkWell(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  backgroundColor: light_color,
                                                  title: Text(
                                                    'Add Product',
                                                    style: TextStyle(
                                                      color: dark_color,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  content: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      TextField(
                                                        style: TextStyle(
                                                          color: dark_color,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        controller:
                                                            controller_title,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: 'title',
                                                          hintStyle: TextStyle(
                                                            color: dark_color,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          label: Text(
                                                            'title',
                                                            style: TextStyle(
                                                              color: dark_color,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      TextField(
                                                        style: TextStyle(
                                                          color: dark_color,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        controller:
                                                            controller_description,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'description',
                                                          hintStyle: TextStyle(
                                                            color: dark_color,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          label: Text(
                                                            'description',
                                                            style: TextStyle(
                                                              color: dark_color,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      TextField(
                                                        style: TextStyle(
                                                          color: dark_color,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        controller:
                                                            controller_brand,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: 'brand',
                                                          hintStyle: TextStyle(
                                                            color: dark_color,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          label: Text(
                                                            'brand',
                                                            style: TextStyle(
                                                              color: dark_color,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      TextField(
                                                        style: TextStyle(
                                                          color: dark_color,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        controller:
                                                            controller_price,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: 'price',
                                                          hintStyle: TextStyle(
                                                            color: dark_color,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          label: Text(
                                                            'price',
                                                            style: TextStyle(
                                                              color: dark_color,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      TextField(
                                                        style: TextStyle(
                                                          color: dark_color,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        controller:
                                                            controller_thumbnail,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: 'src photo',
                                                          hintStyle: TextStyle(
                                                            color: dark_color,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          label: Text(
                                                            'src photo',
                                                            style: TextStyle(
                                                              color: dark_color,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      TextField(
                                                        style: TextStyle(
                                                          color: dark_color,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        controller:
                                                            controller_rating,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: 'rating',
                                                          hintStyle: TextStyle(
                                                            color: dark_color,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          label: Text(
                                                            'rating',
                                                            style: TextStyle(
                                                              color: dark_color,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  actions: [
                                                    InkWell(
                                                      onTap: () {
                                                        if (controller_title.text.isNotEmpty &&
                                                            controller_description
                                                                .text
                                                                .isNotEmpty &&
                                                            controller_brand
                                                                .text
                                                                .isNotEmpty &&
                                                            controller_price
                                                                .text
                                                                .isNotEmpty &&
                                                            controller_thumbnail
                                                                .text
                                                                .isNotEmpty &&
                                                            controller_rating
                                                                .text
                                                                .isNotEmpty) {
                                                          adddata(
                                                              controller_title
                                                                  .text,
                                                              controller_description
                                                                  .text,
                                                              num.parse(
                                                                  controller_price
                                                                      .text),
                                                              num.parse(
                                                                  controller_rating
                                                                      .text),
                                                              controller_brand
                                                                  .text,
                                                              controller_thumbnail
                                                                  .text);

                                                          controller_title
                                                              .text = '';
                                                          controller_description
                                                              .text = '';
                                                          controller_price
                                                              .text = '';
                                                          controller_rating
                                                              .text = '';
                                                          controller_brand
                                                              .text = '';
                                                          controller_thumbnail
                                                              .text = '';
                                                        }
                                                      },
                                                      child: Text(
                                                        'Add',
                                                        style: TextStyle(
                                                          color: dark_color,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text(
                                                        'Cancle',
                                                        style: TextStyle(
                                                          color: dark_color,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Container(
                                            width: double.maxFinite,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: dark_color,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Add Product',
                                                style: TextStyle(
                                                  color: light_color,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: InkWell(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  backgroundColor: light_color,
                                                  title: Text(
                                                    'Update Product',
                                                    style: TextStyle(
                                                      color: dark_color,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  content: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      TextField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        style: TextStyle(
                                                          color: dark_color,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        controller:
                                                            controller_id,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: 'id',
                                                          hintStyle: TextStyle(
                                                            color: dark_color,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          label: Text(
                                                            'id',
                                                            style: TextStyle(
                                                              color: dark_color,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      TextField(
                                                        style: TextStyle(
                                                          color: dark_color,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        controller:
                                                            controller_title,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: 'title',
                                                          hintStyle: TextStyle(
                                                            color: dark_color,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          label: Text(
                                                            'title',
                                                            style: TextStyle(
                                                              color: dark_color,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      TextField(
                                                        style: TextStyle(
                                                          color: dark_color,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        controller:
                                                            controller_description,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'description',
                                                          hintStyle: TextStyle(
                                                            color: dark_color,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          label: Text(
                                                            'description',
                                                            style: TextStyle(
                                                              color: dark_color,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      TextField(
                                                        style: TextStyle(
                                                          color: dark_color,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        controller:
                                                            controller_brand,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: 'brand',
                                                          hintStyle: TextStyle(
                                                            color: dark_color,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          label: Text(
                                                            'brand',
                                                            style: TextStyle(
                                                              color: dark_color,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      TextField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        style: TextStyle(
                                                          color: dark_color,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        controller:
                                                            controller_price,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: 'price',
                                                          hintStyle: TextStyle(
                                                            color: dark_color,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          label: Text(
                                                            'price',
                                                            style: TextStyle(
                                                              color: dark_color,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      TextField(
                                                        style: TextStyle(
                                                          color: dark_color,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        controller:
                                                            controller_thumbnail,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: 'src photo',
                                                          hintStyle: TextStyle(
                                                            color: dark_color,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          label: Text(
                                                            'src photo',
                                                            style: TextStyle(
                                                              color: dark_color,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      TextField(
                                                        style: TextStyle(
                                                          color: dark_color,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        controller:
                                                            controller_rating,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: 'rating',
                                                          hintStyle: TextStyle(
                                                            color: dark_color,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          label: Text(
                                                            'rating',
                                                            style: TextStyle(
                                                              color: dark_color,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  actions: [
                                                    InkWell(
                                                      onTap: () {
                                                        if (controller_id
                                                                .text.isNotEmpty &&
                                                            controller_title
                                                                .text.isNotEmpty &&
                                                            controller_description
                                                                .text.isNotEmpty &&
                                                            controller_brand.text
                                                                .isNotEmpty &&
                                                            controller_price.text
                                                                .isNotEmpty &&
                                                            controller_thumbnail
                                                                .text
                                                                .isNotEmpty &&
                                                            controller_rating
                                                                .text
                                                                .isNotEmpty) {
                                                          updatedata(
                                                              int.parse(
                                                                  controller_id
                                                                      .text),
                                                              controller_title
                                                                  .text,
                                                              controller_description
                                                                  .text,
                                                              num.parse(
                                                                  controller_price
                                                                      .text),
                                                              num.parse(
                                                                  controller_rating
                                                                      .text),
                                                              controller_brand
                                                                  .text,
                                                              controller_thumbnail
                                                                  .text);
                                                          controller_title
                                                              .text = '';
                                                          controller_description
                                                              .text = '';
                                                          controller_price
                                                              .text = '';
                                                          controller_rating
                                                              .text = '';
                                                          controller_brand
                                                              .text = '';
                                                          controller_thumbnail
                                                              .text = '';
                                                          controller_id.text =
                                                              '';
                                                        }
                                                      },
                                                      child: Text(
                                                        'Update',
                                                        style: TextStyle(
                                                          color: dark_color,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text(
                                                        'Cancle',
                                                        style: TextStyle(
                                                          color: dark_color,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Container(
                                            width: double.maxFinite,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: dark_color,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Update Product',
                                                style: TextStyle(
                                                  color: light_color,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: InkWell(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  backgroundColor: light_color,
                                                  title: Text(
                                                    'Delete Product',
                                                    style: TextStyle(
                                                      color: dark_color,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  content: TextField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    style: TextStyle(
                                                      color: dark_color,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    controller: controller_id,
                                                    decoration: InputDecoration(
                                                      hintText: 'id',
                                                      hintStyle: TextStyle(
                                                        color: dark_color,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      label: Text(
                                                        'id',
                                                        style: TextStyle(
                                                          color: dark_color,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  actions: [
                                                    InkWell(
                                                      onTap: () {
                                                        if (controller_id
                                                            .text.isNotEmpty) {
                                                          deletedata(int.parse(
                                                              controller_id
                                                                  .text));
                                                          controller_id.text =
                                                              '';
                                                        }
                                                      },
                                                      child: Text(
                                                        'Delete',
                                                        style: TextStyle(
                                                          color: dark_color,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text(
                                                        'Cancle',
                                                        style: TextStyle(
                                                          color: dark_color,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Container(
                                            width: double.maxFinite,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: dark_color,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Delete Product',
                                                style: TextStyle(
                                                  color: light_color,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Cancle',
                                      style: TextStyle(
                                        color: dark_color,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          width: double.maxFinite,
                          height: 35,
                          decoration: BoxDecoration(
                            color: dark_color,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                            'Properties',
                            style: TextStyle(
                              color: light_color,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: light_color,
                        title: Text(
                          'Log Out',
                          style: TextStyle(
                            color: dark_color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Text(
                          'Do you want to log out?',
                          style: TextStyle(
                            color: dark_color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        actions: [
                          InkWell(
                            onTap: () {
                              // mode = '0';
                              // setdata_modelogin();
                              // delete_storage();
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                  color: dark_color,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Cancle',
                              style: TextStyle(
                                color: dark_color,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                  // mode = '0';
                  // setdata_modelogin();
                  // delete_storage();
                  // Navigator.pop(context);
                },
                child: Container(
                  width: double.maxFinite,
                  height: 50,
                  decoration: BoxDecoration(
                    color: dark_color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Text(
                    'Log Out',
                    style: TextStyle(
                      color: light_color,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
