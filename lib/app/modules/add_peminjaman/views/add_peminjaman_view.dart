import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pinjam buku ${Get.parameters['judul'].toString()}'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: controller.formKey,
          child: Column(
              children: [

                Container(
                  child: Column(
                    children: [

                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                              child: Text(
                                'tanggal peminjaman',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xFF61677D),
                                  letterSpacing: -0.2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: TextFormField(
                                controller: controller.tanggalPinjamController,
                                decoration: InputDecoration(
                                  hintText: 'Masukan tgl peminjaman',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                validator: (value){
                                  if (value!.isEmpty){
                                    return 'tgl peminjaman tidak boleh kosong!';
                                  }
                                  return null;
                                },
                              ),
                            ),

                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 3,
                      ),

                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                              child: Text(
                                'tgl kembali',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xFF61677D),
                                  letterSpacing: -0.2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: TextFormField(
                                controller: controller.tanggalKembaliController,
                                decoration: InputDecoration(
                                  hintText: 'Masukan tgl kembali',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                validator: (value){
                                  if (value!.isEmpty){
                                    return 'tgl kembali tidak boleh kosong!';
                                  }
                                  return null;
                                },
                              ),
                            ),

                          ],
                        ),
                      ),

                   Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                         child: Column(
                        children: [
                          Obx(() => controller.loading.value?
                           CircularProgressIndicator():
                            SizedBox(
                            width: double.infinity,
                             height: 50.0,
                              child: ElevatedButton(
                                onPressed: (){
                                  controller.addPeminjaman();
                                 },
                                 child: Text(
                                'pinjam',
                                style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                                fontSize: 18.0
                            ),
                          ),

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff6464ff),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      )
                      )
                    ],
                  ),
                ),


              ]
          ),
        ),
      ]),
    )));
  }
}
