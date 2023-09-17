import 'package:flutter/material.dart';
import 'package:marky/Models/ProductMode.dart';
import 'package:http/http.dart' as http;
import 'package:marky/widget/CardShop.dart';

class Pagetwo extends StatefulWidget {
  const Pagetwo({super.key});

  @override
  State<Pagetwo> createState() => _PagetwoState();
}

class _PagetwoState extends State<Pagetwo> {
  List<Product>? _product;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProduct();
  }

  Future getProduct() async {
    var url = Uri.parse("http://192.168.1.21:3000/products");
    var response = await http.get(url);
    setState(() {
      _product = productFromJson(response.body);
    });
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // แสดง 3 คอลัมน์
                ),
                itemCount: _product?[0].data.length,
                itemBuilder: (context, index) {
                  Product? prod = _product?[0];
                  return CardShop(
                    prod_name: prod?.data[index].prodName,
                  );
                }),
          ),
        ),
      ),

      backgroundColor: Color.fromRGBO(188, 226, 125, 1),

      //   child: Icon(Icons.arrow_back),
      // ),
      // SizedBox(width: 10),
      // FloatingActionButton(
      //   onPressed: () => Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => Pagettooww())),
      //   child: Icon(Icons.add), // เปลี่ยนไอคอนตามที่คุณต้องการ
    );
  }
}
