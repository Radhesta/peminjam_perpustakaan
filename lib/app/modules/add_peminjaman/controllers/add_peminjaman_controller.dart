import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/provider/storage_provider.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';

import '../../../data/constan/endpoint.dart';
import '../../../data/provider/api_provider.dart';

class AddPeminjamanController extends GetxController {
  //TODO: Implement AddPeminjamanController
  final loading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController tanggalPinjamController = TextEditingController();
  final TextEditingController tanggalKembaliController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  addPeminjaman() async {
    loading(true);

    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response =
        await ApiProvider.instance().post(Endpoint.pinjam, data: {
          "user_id": StorageProvider.read(StorageKey.idUser),
          "book_id": Get.parameters['id'],
          "tanggal_pinjam": tanggalPinjamController.text.toString(),
          "tanggal_kembali": tanggalKembaliController.text.toString(),});

        if (response.statusCode == 201) {
          Get.snackbar("Information", "peminjaman Succes",
              backgroundColor: Colors.green);
          Get.back();
        } else {
          Get.snackbar("Sorry", "Register Gagal", backgroundColor: Colors.red);
        }
      }
      loading(false);
    } on DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.red);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }
}