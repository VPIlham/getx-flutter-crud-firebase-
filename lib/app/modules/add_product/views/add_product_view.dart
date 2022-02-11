import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddProductView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller.nameC,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Nama Product",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: controller.priceC,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: "Price",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => controller.addProduct(
                  controller.nameC.text, controller.priceC.text),
              child: Text("Add "),
            )
          ],
        ),
      ),
    );
  }
}
