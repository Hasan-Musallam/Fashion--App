import 'package:fhasion/screens/shippingPage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../Component/CatomBoutton.dart';
import '../Component/CostomAppBar.dart';
import '../models/itemCounter.dart';
class Lastpage extends StatelessWidget {
  final String cardHolderName;
  final String maskedCardNumber;
  final String image;
  final String name;
  final int price;
  late final int quantity;
  final String descr;
  final int Totalprice;
  final String shippingInfo;





  Lastpage({
    super.key,
    required this.cardHolderName,
    required this.maskedCardNumber,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.descr,
   required this.Totalprice,
    required this.shippingInfo,


  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: const CostomAppBar(),
      body: Column(
        children: [
          const Center(
            child: Text(
              "CHECKOUT",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 12,
              ),
            ),
          ),
          const Gap(10),
          Image.asset("assets/AppBarImages/line.png", height: 40, width: 240),
          const Gap(20),

          /// Shipping Info
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Shipping address".toUpperCase(), style: TextStyle(color: Colors.grey, fontSize: 15)),
                    const Gap(7),
                    Text(shippingInfo, style: TextStyle(color: Colors.white, fontSize: 10)),
                  ],
                ),
                const Icon(Icons.arrow_forward_ios_outlined, color: Colors.white),
              ],
            ),
          ),

          const Divider(color: Colors.white30, height: 30, thickness: 0.5, indent: 20, endIndent: 20),
          Gap(10),
          /// Payment Info
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("assets/icons/Mastercard.png", height: 30, width: 50),
                    const SizedBox(width: 10),
                    Text("Master Card ending $maskedCardNumber", style: TextStyle(color: Colors.white, fontSize: 20)),
                  ],
                ),
                const Icon(Icons.arrow_forward_ios_outlined, color: Colors.white),
              ],
            ),
          ),
          Gap(10),
          const Divider(color: Colors.white30, height: 30, thickness: 0.5, indent: 20, endIndent: 20),
            Gap(15),
          /// Product Info


             Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(image, width: 150, height: 150),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name.toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 25)),
                    const Gap(10),
                    Text(descr, style: const TextStyle(color: Colors.white, fontSize: 15)),
                    const Gap(10),
                    QuantityCounter(
                  onQuantityChanged: (newQuantity) {
                    quantity = quantity;

                  }
                    ),
                    const Gap(8),
                    Row(
                      children: [
                        const Text("\$", style: TextStyle(color: Colors.orangeAccent, fontSize: 20)),
                        Text(price.toString(), style: const TextStyle(color: Colors.orangeAccent, fontSize: 20)),
                      ],
                    ),
                  ],
                ),
              ],
            ),


          const Gap(180),

          /// Total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text("Est. Total", style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text("\$ $Totalprice", style: const TextStyle(color: Colors.orangeAccent, fontSize: 20)),
              ),
            ],
          ),

          const Gap(10),
          Catomboutton(
            ispicc: true,
            title: "checkout",
            onTap: () {
              showPaymentSuccessDialog(context);
            },
          ),
        ],
      ),
    );
  }
}
void showPaymentSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 400,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                Text("PAYMENT SUCCESS", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 2)),
                SizedBox(height: 20),
                Icon(Icons.check_circle_outline, size: 60, color: Colors.brown),
                SizedBox(height: 20),
                Text("Your payment was success", style: TextStyle(fontSize: 16)),
                SizedBox(height: 5),
                Text("Payment ID 15263541", style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
            const Column(
              children: [
                Text("Rate your purchase", style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.sentiment_dissatisfied, size: 28, color: Colors.grey),
                    SizedBox(width: 20),
                    Icon(Icons.sentiment_satisfied, size: 28, color: Colors.grey),
                    SizedBox(width: 20),
                    Icon(Icons.sentiment_very_satisfied, size: 28, color: Colors.orange),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () {
                      Navigator.pop(context); // close dialog
                      Navigator.pop(context); // back to previous screen
                    },
                    child: const Text("SUBMIT", style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () {

                        Navigator.of(context).popUntil((route) => route.isFirst); // Go to home

                    },
                    child: const Text("HOME", style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 10),

              ],
            )
          ],
        ),
      ),
    ),
  );
}

