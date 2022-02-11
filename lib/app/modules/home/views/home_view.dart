import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ilham_firebase/app/controllers/auth_controller.dart';
import 'package:ilham_firebase/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => authC.logout(),
            icon: Icon(Icons.logout),
          )
        ],
      ),
      // real time db
      body: StreamBuilder<QuerySnapshot>(
        stream: controller.streamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listAllDocs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: listAllDocs.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () => Get.toNamed(Routes.EDIT_PRODUCT,
                    arguments: "${(listAllDocs[index].id)}"),
                title: Text(
                    "${(listAllDocs[index].data() as Map<String, dynamic>)["name"]}"),
                subtitle: Text(
                    "${(listAllDocs[index].data() as Map<String, dynamic>)["price"]}"),
                trailing: IconButton(
                  onPressed: () => controller.deleteData(listAllDocs[index].id),
                  icon: Icon(Icons.delete),
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // one time database
      // body: FutureBuilder<QuerySnapshot<Object?>>(
      //   future: controller.getData(),
      //   builder: (context, snapshot) {
      //     print(snapshot);
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       var listAllDocs = snapshot.data!.docs;
      //       return ListView.builder(
      //         itemCount: listAllDocs.length,
      //         itemBuilder: (context, index) => ListTile(
      //           title: Text(
      //               "${(listAllDocs[index].data() as Map<String, dynamic>)["name"]}"),
      //           subtitle: Text(
      //               "${(listAllDocs[index].data() as Map<String, dynamic>)["price"]}"),
      //         ),
      //       );
      //     } else {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_PRODUCT),
        child: Icon(Icons.add),
      ),
    );
  }
}
