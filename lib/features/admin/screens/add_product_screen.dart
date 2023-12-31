import 'dart:io';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:e_commerce_app/common/widgets/custom_textfield.dart';
import 'package:e_commerce_app/features/admin/services/admin_services.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  static const String routeName = '/add-product';

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  List<File> images = [];
  String category = 'Mobiles';
  final _addProductFormKey = GlobalKey<FormState>();
  bool permissionGranted = false;
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final AdminServices adminServices = AdminServices();
  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion',
  ];
  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProduct(
          context: context,
          name: productNameController.text,
          description: descriptionController.text,
          price: double.parse(priceController.text),
          quantity: double.parse(quantityController.text),
          category: category,
          images: images);
    }
  }

  final TextEditingController productNameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  Future _getStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      setState(() {
        permissionGranted = true;
      });
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      setState(() {
        permissionGranted = false;
      });
    }
  }

  void selectImages() async {
    await _getStoragePermission();
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: const Text(
              'Add Product',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
              key: _addProductFormKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    images.isNotEmpty
                        ? CarouselSlider(
                            items: images.map((i) {
                              return Builder(
                                  builder: (BuildContext context) => Image.file(
                                        i,
                                        fit: BoxFit.cover,
                                        height: 200,
                                      ));
                            }).toList(),
                            options: CarouselOptions(
                              viewportFraction: 1,
                              height: 200,
                            ),
                          )
                        : GestureDetector(
                            onTap: selectImages,
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(10),
                              dashPattern: const [10, 4],
                              strokeCap: StrokeCap.round,
                              child: Container(
                                width: double.infinity,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.folder_open, size: 40),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Select Product Images',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey.shade400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(height: 15),
                    CustomTextField(
                        controller: productNameController,
                        hintText: 'Product name'),
                    const SizedBox(height: 5),
                    CustomTextField(
                      controller: descriptionController,
                      hintText: 'Description',
                      maxLines: 7,
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                        controller: priceController, hintText: 'Price'),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                        controller: quantityController, hintText: 'Quantity'),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: double.infinity,
                      child: DropdownButton(
                        value: category,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: productCategories.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? newVal) {
                          setState(
                            () {
                              category = newVal!;
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      text: 'Sell',
                      onTap: sellProduct,
                    ),
                  ],
                ),
              )),
        ));
  }
}
