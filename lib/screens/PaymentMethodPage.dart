import 'package:fhasion/screens/LastPage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../Component/CatomBoutton.dart';
import '../Component/CostomAppBar.dart';
import '../models/PaymentModel.dart';
class Paymentmethodpage extends StatefulWidget {



  const Paymentmethodpage({super.key,
  });

  @override
  State<Paymentmethodpage> createState() => _PaymentmethodpageState();
}

class _PaymentmethodpageState extends State<Paymentmethodpage> {
  String cardHolderName = '';
  String cardNumber = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: CostomAppBar(),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                "Payment method".toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 12,
                ),
              ),
            ),
            const Gap(10),
            Center(
              child: Image.asset("assets/AppBarImages/line.png", height: 40, width: 240),
            ),
            const Gap(20),
            AddCard(
              onCardSaved: (name, number) {
                setState(() {
                  cardHolderName = name;
                  cardNumber = number;
                });
              },
            ),
            const Gap(150),
            Catomboutton(
              ispicc: false,
              title: "Add Card",
              onTap: () {
                final maskedNumber = cardNumber.length >= 2
                    ? '•••• ${cardNumber.substring(cardNumber.length - 2)}'
                    : '••••';
                  Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
