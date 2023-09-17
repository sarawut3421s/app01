import 'package:flutter/material.dart';

class CardShop extends StatefulWidget {
  CardShop({super.key, this.prod_image, this.prod_name, this.prod_price});
  String? prod_name;
  int? prod_price;
  String? prod_image;
  String? profile;
  String? create_by;

  @override
  State<CardShop> createState() => _CardShopState();
}

class _CardShopState extends State<CardShop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 100,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 125,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        "${widget.prod_image}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("${widget.prod_name}"),
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Text(" ฿")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
