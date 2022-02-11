import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Future<QuerySnapshot<Object?>> getData() async {
  //   CollectionReference products = firestore.collection("products");
  //   return products.get();
  // }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference products = firestore.collection("products");
    return products
        .where("price", isGreaterThan: 10000)
        // .orderBy("time", descending: true)
        .snapshots();
  }

  void deleteData(String docID) async {
    try {
      DocumentReference docRef = firestore.collection("products").doc(docID);

      Get.defaultDialog(
          title: "Hapus data",
          middleText: "Apakah Anda yakin menghapus data ini ?",
          onConfirm: () {
            docRef.delete();
            Get.back();
          },
          textConfirm: "YES",
          textCancel: "NO");
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Gagal menghapus data",
      );
    }
  }
}
