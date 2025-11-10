
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../Component/CostomAppBar.dart';
import '../models/prodects.dart';
import '../models/cover.dart';
import '../screens/ChickOut.dart';
import 'ProdactDetalsPage.dart';
class Homepage extends StatelessWidget {
  const Homepage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar:CostomAppBar(),
      body:Stack(
        children: [
          Positioned(
              top: 10,
              left: 0,
              right: 0,
      child: Image.asset("assets/October/10.png",height: 200,)
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child:
              Image.asset("assets/October/October.png",height: 60,),
          ),
          Positioned(
            top: 110,
            left: 0,
            right: 0,
            child:
    Image.asset("assets/October/Collection.png",height: 20,),),
    SingleChildScrollView(
    child:Column(
            children: [
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Column(children: [
              Gap(160),
              Image.asset("assets/October/Backgroungimm.png"),
              Gap(30),
      GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: ProductModel.products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 15,
            childAspectRatio: 0.50,
          ),
          itemBuilder: (context , index) {
            final item = ProductModel.products[index];
            return GestureDetector(
                onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Prodactdetalspage( image: item.image,
                name: item.name,
                price: item.price,
                descr: item.description,
              )));
            },
            child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(item.image),
                  Gap(10),
                  Text( item.name,style: TextStyle(color: Colors.white),),
                  Text( item.description,style: TextStyle(color: Colors.white),),
                  Gap(9),
                  Text(
                     "\$ ${item.price.toString()}",style: TextStyle(color: Colors.orangeAccent),

                  ),
                ],

            ));
          }
      ),
      Gap(40),
      Text("You may also like".toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
      Gap(5),
      Image.asset("assets/AppBarImages/line.png",height: 40,width: 240,),
      Gap(20),
      SizedBox(
        height: 400,
        child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:CoverModel.covers.length,
        itemBuilder: (BuildContext context, int index) {
          final item = CoverModel.covers[index];
          return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Chickout( image: item.image,
                  name: item.name,
                  price: 100,
                  descr: "reversible angora cardigan",
                  )));
              },
                  child:  Column(
            children: [
              Image.asset(item.image,width: 300,height: 300,),
              Gap(10),
              Text(item.name,style: TextStyle(color: Colors.white,fontSize: 20),),]));

      },

      ),),
                     ])),
],
          )),

        ],
      ),

    );
  }
}
