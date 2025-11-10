import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../Component/CatomBoutton.dart';
import '../Component/CostomAppBar.dart';
import '../Component/ShippingAndPaymentSection.dart';
import 'LastPage.dart';
import 'PaymentMethodPage.dart';
class PlaceOrder extends StatelessWidget {
  const PlaceOrder({super.key, required this.image,
    required this.name,
    required this.descr,
    required this.price,
    required this.Totalprice,
    required this.coantety,
    required  this.shippingInfo});

  final String image;
  final String name;
  final String descr;
  final int price;
  final int Totalprice;
  final int coantety;
  final String shippingInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar:CostomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Checkout".toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 12,
              ),
            ),

              ),
          Gap(10),

          Center(child: Image.asset("assets/AppBarImages/line.png", height: 40, width: 240)),
          Gap(20),
          Container(
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

    children: [
              Padding(padding: EdgeInsets.only(left: 25),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
                //reblace whithe data from addressForm
              children: [

                Text("Shipping address".toUpperCase(), style: TextStyle(color: Colors.grey, fontSize: 18)),
                Gap(7),
                Text(shippingInfo, style: TextStyle(color: Colors.white, fontSize: 12)),


              ],
            )
            ),
      Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),])

          ),
          ShippingAndPaymentSection(
            image: image,
            name: name,
            price: price,
            descr: descr,
            Totalprice: Totalprice,
            coantety: coantety,
          ),
          Gap(40),
          Row(
            children: [
              Text("Est. Total", style: TextStyle(color: Colors.white, fontSize: 20)),
              Gap(230),
              Text("\$ $Totalprice", style: TextStyle(color: Colors.orangeAccent, fontSize: 20)),
            ],
          ),
          Catomboutton(
            ispicc: true,
            title: "Place order",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Lastpage(
                cardHolderName: '',
                maskedCardNumber: '',
                image: image,
                name: name,
                price: price,
                quantity: coantety,
                descr: descr,
                Totalprice: Totalprice,
                shippingInfo: shippingInfo,

              )));

            },
          ),




        ],

      ),
    );
  }
}
