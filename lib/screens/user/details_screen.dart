import 'package:dressmeup/Widget/container_details.dart';
import 'package:dressmeup/screens/user/search_item_screen.dart';
import 'package:dressmeup/screens/user/women_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Widget/custom_brand_list_tail.dart';
import '../../network/dio_method_view_model.dart';
import 'Furniture_product.dart';
import 'brands_products_screen.dart';
import 'electronics_product.dart';
import 'kid_products_screen.dart';
import 'men_product_screen.dart';
import 'others_products.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  static final DioMethods dioMethods = Get.put(DioMethods(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            ListTile(
              leading: const SizedBox(
                height: 48,
                width: 48,
              ),
              title: Text(
                "Catalog",
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.normal,
                    fontSize: 17,
                    color: const Color(0xFF454F5B)),
              ),
              trailing: InkWell(
                onTap: () {
                  Get.to(()=> const SearchItemScreen());
                },
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    color: const Color(0xFFFFFFFF),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: const Offset(0, 0.75),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.search_outlined,
                    color: Color(0xFF000000),
                    size: 30,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.9049,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Color(0xFFFFFFFF),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        ContainerDetails(
                          image: 'images/man.png',
                          name: 'Men',
                          color: const Color(0xFFB4E0FA),
                          itemCount: DetailsScreen.dioMethods.man.length,
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => const MenProductScreen()));
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ContainerDetails(
                          image: 'images/women.png',
                          name: 'Women',
                          color: const Color(0xFFFA9A88),
                          itemCount: DetailsScreen.dioMethods.women.length,
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => const WomenProductScreen()));
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ContainerDetails(
                          image: 'images/kid.png',
                          name: 'Kid',
                          color: const Color(0xFF9C6ADE),
                          itemCount: DetailsScreen.dioMethods.kid.length,
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => const KidProductScreen()));
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: 90,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                                image: AssetImage('images/Ads.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomBrandListTail(
                          name: "Brands",
                          image: 'images/Star.png',
                          trailing: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => const BrandsProductScreen()));
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomBrandListTail(
                          name: "Furniture",
                          image: 'images/Books.png',
                          trailing: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => const FurnitureProductScreen()));
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomBrandListTail(
                          name: "Electronics",
                          image: 'images/Comment.png',
                          trailing: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => const ElectronicsProductScreen()));
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomBrandListTail(
                          name: "Other's",
                          image: 'images/Info.png',
                          trailing: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => const OthersProductScreen()));
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
