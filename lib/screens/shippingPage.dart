import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../Component/AddressForm.dart';
import '../Component/CatomBoutton.dart';
import '../Component/CostomAppBar.dart';
import 'LastPage.dart';
import 'PaymentMethodPage.dart';
import 'PlaceOrder.dart';
class Shippingpage extends StatelessWidget {
  Shippingpage({super.key, required this.image, required this.name, required this.price, required this.descr, required this.Totalprice, required this.coantety

  });
  final String image;
  final String name;
  final int price;
  final String descr;
  final int Totalprice;
  final int coantety ;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: CostomAppBar(),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Text(
                "ADD SHIPPING ADRESS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 8,
                ),
              ),
            ),
            const Gap(10),
            Image.asset("assets/AppBarImages/line.png"),
            const Gap(20),
            AddressForm(
              firstNameController: firstNameController,
              lastNameController: lastNameController,
              addressController: addressController,
              cityController: cityController,
              stateController: stateController,
              zipController: zipController,
              phoneController: phoneController,
            ),
            const Gap(205),
            Catomboutton(
              ispicc: false,
              title: "Add now",
              onTap: () {


                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlaceOrder(

                      image: image,
                      name: name,
                      price: price,
                      descr: descr,
                      Totalprice: Totalprice,
                      coantety: coantety,
                      shippingInfo:
                      '${firstNameController.text} ${lastNameController.text}\n${addressController.text}\n${cityController.text}, ${stateController.text} ${zipController.text}\nPhone: ${phoneController.text}',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

