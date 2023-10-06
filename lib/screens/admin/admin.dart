import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import '../../network/dio_method_view_model.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  static final DioMethods dioMethods = Get.put(DioMethods(), permanent: true);


  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final TextEditingController _productTitleController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final TextEditingController _productDescriptionController = TextEditingController();
  final TextEditingController _productCategoryIdController = TextEditingController();

  File? image;

  uploadImage(ImageSource source) async {
    try {
      var pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage == null) return;
      File? img = File(pickedImage.path);
      setState(() {
        image = img;
        Navigator.pop(context);
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Add Product",
            style: GoogleFonts.nunito(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _productTitleController,
                  decoration: const InputDecoration(labelText: "Title"),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _productPriceController,
                  decoration: const InputDecoration(labelText: "Price"),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _productCategoryIdController,
                  decoration: const InputDecoration(labelText: "Category Id"),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _productDescriptionController,
                  decoration: const InputDecoration(labelText: "Description"),
                  maxLines: 3,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text('Add product image' , style: GoogleFonts.nunito(fontSize: 16),),
                    IconButton(onPressed: () =>
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: const Color(0XFFF9FAFB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            title: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Profile photo',
                                  style: GoogleFonts.nunito(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Visibility(
                                  visible: image != null,
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          image = null;
                                          Navigator.pop(context);
                                        });
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.grey[600],
                                      )),
                                )
                              ],
                            ),
                            content: SizedBox(
                              height: 70,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                    const Color(0XFFE2E4EFFF),
                                    child: IconButton(
                                        onPressed: () {
                                          uploadImage(ImageSource.camera);
                                        },
                                        icon: const Icon(
                                          Icons.camera_alt,
                                          color: Color(0xFF5C6AC4),
                                        )),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  CircleAvatar(
                                    backgroundColor:
                                    const Color(0XFFE2E4EFFF),
                                    child: IconButton(
                                        onPressed: () {
                                          uploadImage(ImageSource.gallery);
                                        },
                                        icon: const Icon(
                                          Icons.photo,
                                          color: Color(0xFF5C6AC4),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                    , icon: const Icon(Icons.camera_alt)),
                    const SizedBox(width: 15,),
                    Visibility(visible: image!= null ,child: const Text('Upload Successfully'))
                  ],
                ),
                const SizedBox(height: 30),
                GetBuilder<DioMethods>(
                  init: DioMethods(),
                builder: (controller) {
                  return ElevatedButton(
                    onPressed: () async {
                      await controller.postProduct(
                                  title: _productTitleController.text,
                                  description:
                                      _productDescriptionController.text,
                                  categoryId: int.parse(_productCategoryIdController.text),
                                  price:
                                      int.parse(_productPriceController.text),
                                  images: [
                                    "https://placeimg.com/640/480/any"
                                  ]).then((value) => Logger().e(value));
                                  controller.getData();
                                  _productTitleController.clear();
                                  _productDescriptionController.clear();
                                  _productCategoryIdController.clear();
                                  _productPriceController.clear();
          
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: const Color(0xFF5C6AC4),
                        minimumSize: const Size(double.infinity, 50)),
                    child: Text(
                      "Add Product",
                      style: GoogleFonts.roboto(
                          color: const Color(0xFFFFFFFF),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  );
                }
              ),
              ],
            ),
          ),
        ));
  }
}
