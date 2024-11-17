import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stor_app/models/pruduct_model.dart';
import 'package:stor_app/servece/updat_product.dart';
import 'package:stor_app/widgets/customButtom.dart';
import 'package:stor_app/widgets/customTextform.dart';

class UpdatePage extends StatefulWidget {
  UpdatePage({super.key});
  static String id = 'Updatepage';

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String? productname, des, iamge;

  String? price;
  bool islooding = false;

  @override
  Widget build(BuildContext context) {
    ProductModel productm =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: islooding,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "Updata page",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                customTextform(
                  onChanged: (data) {
                    productname = data;
                  },
                  hinttext: 'product Name',
                ),
                SizedBox(
                  height: 16,
                ),
                customTextform(
                  onChanged: (data) {
                    des = data;
                  },
                  hinttext: 'descraption',
                ),
                SizedBox(
                  height: 25,
                ),
                customTextform(
                  texttype: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                  hinttext: ' price',
                ),
                SizedBox(
                  height: 25,
                ),
                customTextform(
                  onChanged: (data) {
                    iamge = data;
                  },
                  hinttext: ' image',
                ),
                SizedBox(
                  height: 30,
                ),
                customButtom(
                  onperssed: () {
                    islooding = true;
                    setState(() {});

                    try {
                      updat(productm);
                      //i make this snakbar for me
                      showsnakbar(context, 'Sucsses');
                    } catch (e) {
                      print(e);
                    }
                    //i make this snakbar for me
                    showsnakbar(context, 'Sucsses');
                    islooding = false;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showsnakbar(BuildContext context, String titel) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(titel)));
  }

  void updat(ProductModel productm) {
    UpdatProductServece().updat(
      id: productm.id,
      title: productname == null ? productm.title : productname!,
      descraption: des == null ? productm.description : des!,
      price: price == null
          ? productm.pric
          : double.tryParse(price!) ?? productm.pric,
      image: iamge == null ? productm.image : iamge!,
      category:
          productm.category, // تأكد من تمرير قيمة صحيحة (ليس كائن ProductModel)
    );
  }
}
