// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  bool error;
  String message;
  List<Datum> data;

  Product({
    required this.error,
    required this.message,
    required this.data,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        error: json["error"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  CreateBy createBy;
  String id;
  String prodName;
  int prodPrice;
  String images;
  int v;
  String imgUrl;

  Datum({
    required this.createBy,
    required this.id,
    required this.prodName,
    required this.prodPrice,
    required this.images,
    required this.v,
    required this.imgUrl,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        createBy: CreateBy.fromJson(json["create_by"]),
        id: json["_id"],
        prodName: json["prod_name"],
        prodPrice: json["prod_price"],
        images: json["images"],
        v: json["__v"],
        imgUrl: json["img_url"],
      );

  Map<String, dynamic> toJson() => {
        "create_by": createBy.toJson(),
        "_id": id,
        "prod_name": prodName,
        "prod_price": prodPrice,
        "images": images,
        "__v": v,
        "img_url": imgUrl,
      };
}

class CreateBy {
  String image;
  String name;
  String imgUrl;

  CreateBy({
    required this.image,
    required this.name,
    required this.imgUrl,
  });

  factory CreateBy.fromJson(Map<String, dynamic> json) => CreateBy(
        image: json["image"],
        name: json["name"],
        imgUrl: json["img_url"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "img_url": imgUrl,
      };
}
