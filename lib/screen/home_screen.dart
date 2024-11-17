import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stor_app/models/pruduct_model.dart';
import 'package:stor_app/servece/get_all_product_servece.dart';
import 'package:stor_app/widgets/custom_stack.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = 'homescreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(" New Trend"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {}, icon: FaIcon(FontAwesomeIcons.cartShopping))
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 60),
            child: FutureBuilder<List<ProductModel>>(
              future: AllProductServece().getallpruducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (snapshot.hasData) {
                  List<ProductModel> products = snapshot.data!;
                  return GridView.builder(
                    itemCount: products.length,
                    clipBehavior: Clip.none,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.9,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 100,
                    ),
                    itemBuilder: (context, index) {
                      return customStack(
                        product: products[index],
                      );
                    },
                  );
                } else {
                  return Center(child: Text("No data available"));
                }
              },
            )));
  }
}
