import 'package:flutter/material.dart';
import 'package:kostamobile/model/product/product_model.dart';
import 'package:kostamobile/model/user/user_model.dart';
import 'package:kostamobile/palette.dart';
import 'package:kostamobile/responsive.dart';

class ProductData extends StatelessWidget {
  const ProductData({Key? key, this.model, this.onDelete}) : super(key: key);

  final ProductModel? model;
  final Function? onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        width: 500,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: productWidget(context),
      ),
    );
  }

  Widget productWidget(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Responsive.isDesktop(context)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Product Id:${model?.productId.toString()}",
                            style: boldText(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Seller Id:${model?.sellerId.toString()}",
                            style: boldText(),
                          ),
                          Text(
                            model!.category!,
                            style: boldText(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: Responsive.isDesktop(context)
                                ? null
                                : MediaQuery.of(context).size.width - 180,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  child: Icon(Icons.edit),
                                  onTap: () {},
                                ),
                                GestureDetector(
                                  child: Icon(Icons.delete),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model!.brand!,
                            style: boldText(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            model!.title!,
                            style: boldText(),
                          ),
                          Text(
                            model!.productDetail!,
                            style: boldText(),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "image path: ${model!.image!}",
                            style: boldText(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "price: ${model!.price!}",
                            style: boldText(),
                          ),
                          Text(
                            "delivery fee: 100",
                            style: boldText(),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Funding: ${model!.funding!}",
                            style: boldText(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Funding summary: ${model!.fundingSum!}",
                            style: boldText(),
                          ),
                          Text(
                            model!.expireDate!,
                            style: boldText(),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Product Id:${model?.productId.toString()}",
                            style: boldText(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Seller Id:${model?.sellerId.toString()}",
                            style: boldText(),
                          ),
                          Text(
                            model!.category!,
                            style: boldText(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: Responsive.isDesktop(context)
                                ? null
                                : MediaQuery.of(context).size.width - 180,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  child: Icon(Icons.edit),
                                  onTap: () {},
                                ),
                                GestureDetector(
                                  child: Icon(Icons.delete),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        )
      ],
    );
  }
}
