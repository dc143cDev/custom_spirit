import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kostamobile/api/get_product_api.dart';
import 'package:kostamobile/api/get_user_api.dart';
import 'package:kostamobile/model/user/user_add_view.dart';
import 'package:kostamobile/model/user/user_data.dart';
import 'package:kostamobile/model/user/user_model.dart';
import 'package:get/get.dart';

import '../../../../model/product/product_data.dart';
import '../../../../model/product/product_model.dart';
import '../../../../palette.dart';

class ProductConsole extends StatefulWidget {
  const ProductConsole({Key? key}) : super(key: key);

  @override
  State<ProductConsole> createState() => _ProductConsoleState();
}

class _ProductConsoleState extends State<ProductConsole> {
  List<ProductModel> products = List<ProductModel>.empty(growable: true);
  var formKey = GlobalKey<FormState>();

  var sellerIdController = TextEditingController();
  var brandController = TextEditingController();
  var titleController = TextEditingController();
  var productDetailController = TextEditingController();
  var imageController = TextEditingController();
  var priceController = TextEditingController();
  var deliveryFeeController = TextEditingController();
  var createAtController = TextEditingController();
  var updateAtController = TextEditingController();
  var fundingController = TextEditingController();
  var fundingSumController = TextEditingController();
  var categoryController = TextEditingController();
  var expireDateController = TextEditingController();

  saveProduct() async {
    var url = "http://localhost:8000/createProduct";
    final postJson = jsonEncode({
      "seller_id": sellerIdController.text.toString(),
      "brand": brandController.text,
      "title": titleController.text,
      "product_detail": productDetailController.text,
      "image": imageController.text,
      "price": priceController.text.toString(),
      "delivery_fee": deliveryFeeController.text.toString(),
      "created_at": createAtController.text,
      "updated_at": updateAtController.text,
      "funding": fundingController.text.toString(),
      "funding_sum": fundingSumController.text.toString(),
      "category": categoryController.text,
      "expire_date": expireDateController.text,
    });
    print(postJson);
    try {
      var res = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: postJson,
      );
      if (res.statusCode == 200) {
        var resSignup = jsonDecode(res.body);
        if (resSignup['success'] == true) {
          Fluttertoast.showToast(msg: '회원가입이 완료되었습니다');
          setState(() {});
        } else {
          Fluttertoast.showToast(msg: '다시 시도해주세요');
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  updateProductData() async {}

  @override
  void initState() {
    super.initState();
  }

  Future<void> updateProduct() async {
    await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Form(
            key: formKey,
            child: SizedBox(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,

                  // bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: sellerIdController,
                        decoration: InputDecoration(labelText: 'seller id'),
                      ),
                      TextFormField(
                        controller: brandController,
                        decoration: InputDecoration(labelText: 'brand'),
                      ),
                      TextFormField(
                        controller: titleController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(labelText: 'Title'),
                      ),
                      TextFormField(
                        controller: productDetailController,
                        decoration: InputDecoration(labelText: 'detail'),
                      ),
                      TextFormField(
                        controller: imageController,
                        decoration: InputDecoration(labelText: 'image path'),
                      ),
                      TextFormField(
                        controller: priceController,
                        decoration: InputDecoration(labelText: 'price'),
                      ),
                      TextFormField(
                        controller: deliveryFeeController,
                        decoration: InputDecoration(labelText: 'delivery fee'),
                      ),
                      TextFormField(
                        controller: createAtController,
                        decoration: InputDecoration(labelText: 'created at'),
                      ),
                      TextFormField(
                        controller: updateAtController,
                        decoration: InputDecoration(labelText: 'updated at'),
                      ),
                      TextFormField(
                        controller: fundingController,
                        decoration: InputDecoration(labelText: 'funding'),
                      ),
                      TextFormField(
                        controller: fundingSumController,
                        decoration:
                            InputDecoration(labelText: 'funding summary'),
                      ),
                      TextFormField(
                        controller: categoryController,
                        decoration: InputDecoration(labelText: 'category'),
                      ),
                      TextFormField(
                        controller: expireDateController,
                        decoration: InputDecoration(labelText: 'expire date'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: accentBLue),
                        onPressed: () {
                          saveProduct();
                        },
                        child: Text('Update data'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget productList(products) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: LogoAB(),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              loadProducts();
            },
            icon: Icon(
              Icons.refresh,
              color: accentBLue,
            ),
          ),
          IconButton(
            onPressed: () {
              updateProduct();
            },
            icon: Icon(
              Icons.add_box,
              color: accentBLue,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ProductData(
                        model: products[index],
                        onDelete: (ProductModel model) {},
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: loadProducts(),
    );
  }

  Widget loadProducts() {
    return FutureBuilder(
        future: getProductApi.getProductData(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<ProductModel>?> model,
        ) {
          if (model.hasData) {
            return productList(model.data);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
