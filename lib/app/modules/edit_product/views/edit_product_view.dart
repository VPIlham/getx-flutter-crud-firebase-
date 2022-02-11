import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_product_controller.dart';

class EditProductView extends GetView<EditProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditProductView'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.nameC.text = data["name"];
            controller.priceC.text = data["price"];
            return Padding(
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
                    onPressed: () => controller.editProduct(Get.arguments,
                        controller.nameC.text, controller.priceC.text),
                    child: Text("Edit "),
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
