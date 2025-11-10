import 'package:flutter/material.dart';

import '../Component/CatomBoutton.dart';
import '../Component/CostomAppBar.dart';
import 'ChickOut.dart';
class Prodactdetalspage extends StatelessWidget {
  const Prodactdetalspage({super.key, required this.image, required this.name, required this.price, required this.descr

  });
  final String image;
  final String name;
  final int price;
  final String descr;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        appBar:const CostomAppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  image,
                  height: 250,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '\$${price}',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.orangeAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
               Text(
                name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              const SizedBox(height: 10),
              Text(
                descr,
                style: TextStyle(fontSize: 16,color: Colors.white),

              ),
              const SizedBox(height: 250),
              Center(
                child:Catomboutton(
                    ispicc: true,
                    title: "Add to cart",
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Chickout( image: image,
                      name: name,
                      price: price,
                      descr: descr,
                    )));
                    }

                ),

              ),
            ],
          ),
        ),
    );
  }
}
