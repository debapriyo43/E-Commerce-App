import 'package:e_commerce_app/features/home/widgets/address_box.dart';
import 'package:e_commerce_app/features/search/screens/search_screen.dart';
import 'package:flutter/material.dart';
import '../../../constants/global_variables.dart';
import '../widgets/carousel_image.dart';
import '../widgets/deal_of_day.dart';
import '../widgets/top_categories.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToSearchScreen(String query){
    Navigator.pushNamed(context, SearchScreen.routeName,arguments: query);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Expanded(
              child: Container(
                height:42,
                margin: const EdgeInsets.only(left:15),
                alignment: Alignment.topLeft,
                child: Material(
                  borderRadius: BorderRadius.circular(7),
                  elevation: 1,
                  child: TextFormField(
                    onFieldSubmitted: navigateToSearchScreen,
                    decoration: InputDecoration(
                      prefixIcon: InkWell(
                        onTap:(){},
                        child: const Padding(padding: EdgeInsets.only(left:6),child: Icon(Icons.search,color: Colors.black,size: 23,),),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(top:10,),
                      border:const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7),),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7),),
                        borderSide: BorderSide(color:Colors.black38,width: 1),
                      ),
                      hintText:'Search Shopnex.in',
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize:17,
                      )
                    ),
                  ),
                ),                // color: Colors.black,
              ),
            ),
            Container(
              height:42,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.mic,color: Colors.black,size: 24,),
              color: Colors.transparent,
            ),
          ]),
        ),
      ),
      body:SingleChildScrollView(
        child: Column(children: const [
          AddressBox(),
          SizedBox(height: 10,),
          TopCategories(),
          SizedBox(height: 10,),
          CarouselImage(),
          DealOfDay(),
        ],),
      ),
    );
  }
}