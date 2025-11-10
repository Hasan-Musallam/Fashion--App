import 'package:flutter/material.dart';

import '../screens/PaymentMethodPage.dart';
import '../screens/shippingPage.dart';

class ShippingAndPaymentSection extends StatefulWidget {
  const ShippingAndPaymentSection({super.key, required this.image, required this.name, required this.price, required this.descr, required this.Totalprice, required this.coantety
  });
  final String image;
  final String name;
  final int price;
  final String descr;
  final int Totalprice;
  final int coantety;
  @override
  State<ShippingAndPaymentSection> createState() => _ShippingAndPaymentSectionState();
}

class _ShippingAndPaymentSectionState extends State<ShippingAndPaymentSection> {
  String selectedShippingMethod = 'Pickup at store';
  String selectedPaymentMethod = 'Select payment method';

  final List<String> shippingOptions = [
    'Pickup at store',
    'Home delivery',
  ];

  final List<String> paymentOptions = [
    'Select payment method',
    'Credit Card',
    'PayPal',
    'Cash on delivery',
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        height: screenHeight * 0.49, // 👈 Limit to half screen
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView( // 👈 Allow scroll inside half screen
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// ➕ Add shipping address
              GestureDetector(
                onTap: () {
                  // TODO: Handle address adding logic
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child:GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Shippingpage(
                        image: widget.image,
                        name: widget.name,
                        price: widget.price,
                        descr: widget.descr,
                        Totalprice: widget.Totalprice,
                        coantety:widget.coantety,

                      )));
                    },
                    child:Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Add shipping address',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                     Icon(Icons.add),
                    ],
                  ),),
                ),
              ),

              const SizedBox(height: 20),

              /// 📦 Shipping Method
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  'SHIPPING METHOD',
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 1.5,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedShippingMethod,
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_drop_down),
                          items: shippingOptions.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedShippingMethod = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    const Text(
                      'FREE',
                      style: TextStyle(color: Colors.black54),

                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// 💳 Payment Method
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  'PAYMENT METHOD',
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 1.5,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                child:
                GestureDetector(
                  onTap: () {
                    // TODO: Handle address adding logic
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child:GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Paymentmethodpage()));
                      },
                      child:Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Add Credit Card',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Icon(Icons.add),
                        ],
                      ),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
