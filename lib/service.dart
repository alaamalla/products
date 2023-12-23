// import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:products/model.dart';

Future getdata() async {
  Dio dio = Dio();
  String url = 'https://dummyjson.com/products';
  Response response = await dio.get(url);
// var responsebody = jsonDecode(response.data);
  return response.data;
}

Future adddata(String title, String description, num price, num rating,
    String brand, String thumbnail) async {
  Dio dio = Dio();
  String url = 'https://dummyjson.com/products/add';
  Response response = await dio.post(url, data: {
    'title': '${title}',
    'description': '${description}',
    'price': price,
    'rating': rating,
    'brand': '${brand}',
    'thumbnail': '${thumbnail}'
  });
// var responsebody = jsonDecode(response.data);
  return response.data;
}

Future deletedata(int id) async {
  Dio dio = Dio();
  String url = 'https://dummyjson.com/products/${id}';
  Response response = await dio.delete(url);
// var responsebody = jsonDecode(response.data);
  return response.data;
}

Future updatedata(int id, String title, String description, num price,
    num rating, String brand, String thumbnail) async {
  Dio dio = Dio();
  String url = 'https://dummyjson.com/products/${id}';
  Response response = await dio.put(url, data: {
    'title': '${title}',
    'description': '${description}',
    'price': price,
    'rating': rating,
    'brand': '${brand}',
    'thumbnail': '${thumbnail}'
  });
// var responsebody = jsonDecode(response.data);
  return response.data;
}
