import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProductController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController priceC;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    nameC = TextEditingController();
    priceC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    priceC.dispose();
    super.onClose();
  }

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection("products").doc(docID);
    return docRef.get();
  }

  void editProduct(String docID, String name, String price) async {
    DocumentReference docData = firestore.collection("products").doc(docID);

    try {
      await docData.update({
        "name": name,
        "price": int.parse(price),
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil Merubah data Product",
        onConfirm: () {
          nameC.clear();
          priceC.clear();
          //close dialog
          Get.back();
          //back to home
          Get.back();
        },
        textConfirm: "OKAY",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Gagal",
        middleText: "Gagal Merubah data Product",
      );
    }
  }
}
