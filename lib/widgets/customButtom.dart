import 'package:flutter/material.dart';
import 'package:stor_app/servece/updat_product.dart';

class customButtom extends StatelessWidget {
  customButtom({
    this.onperssed,
    super.key,
  });
  final VoidCallback? onperssed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(),
          height: 56,
          width: double.infinity,
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: onperssed,
              child: Text("Up data"))),
    );
  }
}
