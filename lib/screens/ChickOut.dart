import 'package:flutter/material.dart';
import '../Component/CatomBoutton.dart';
import '../Component/CostomAppBar.dart';
import 'package:gap/gap.dart';

import '../models/itemCounter.dart';
import 'PlaceOrder.dart';
class Chickout extends StatefulWidget {
  const Chickout({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.descr,
  });

  final String image;
  final String name;
  final int price;
  final String descr;

  @override
  State<Chickout> createState() => _ChickoutState();
}

class _ChickoutState extends State<Chickout> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    int totalPrice = widget.price * quantity;

    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: CostomAppBar(),
      body: Column(
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
          Image.asset("assets/AppBarImages/line.png", height: 40, width: 240),
          Gap(20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(widget.image, width: 150, height: 150),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 25)),
                  Gap(10),
                  Text(widget.descr, style: TextStyle(color: Colors.white, fontSize: 15)),
                  Gap(10),
                  QuantityCounter(
                    onQuantityChanged: (newQuantity) {
                      setState(() {
                        quantity = newQuantity;
                      });
                    },
                  ),
                  Gap(8),
                  Row(
                    children: [
                      Text("\$", style: TextStyle(color: Colors.orangeAccent, fontSize: 20)),
                      Text(widget.price.toString(), style: TextStyle(color: Colors.orangeAccent, fontSize: 20)),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Gap(20),
          Divider(color: Colors.white, thickness: 0),
          Row(
            children: [
              Image.asset("assets/CoverImages/Voucher.png", color: Colors.white, width: 60, height: 50),
              Gap(10),
              Text("Add promo code", style: TextStyle(color: Colors.white, fontSize: 20)),
            ],
          ),
          Divider(color: Colors.white, thickness: 0),
          Row(
            children: [
              Image.asset("assets/CoverImages/DoorDelivery.png", color: Colors.white, width: 60, height: 50),
              Gap(10),
              Text("Delivery", style: TextStyle(color: Colors.white, fontSize: 20)),
              Gap(180),
              Text("Free", style: TextStyle(color: Colors.white, fontSize: 20)),
            ],
          ),
          Divider(color: Colors.white, thickness: 0),
          Gap(180),
          Row(
            children: [
              Text("Est. Total", style: TextStyle(color: Colors.white, fontSize: 20)),
              Gap(230),
              Text("\$ $totalPrice", style: TextStyle(color: Colors.orangeAccent, fontSize: 20)),
            ],
          ),
          Gap(10),
          Catomboutton(
            ispicc: true,
            title: "Checkout",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlaceOrder(
                      image: widget.image,
                      descr: widget.descr,
                      name: widget.name,
                      price: widget.price,
                      Totalprice: totalPrice,
                      coantety: quantity,
                      shippingInfo: '', // Will be updated inside PlaceOrder
                    ),
                  ),
                );
              }

          ),
          Gap(5),
        ],
      ),
    );
  }
}
