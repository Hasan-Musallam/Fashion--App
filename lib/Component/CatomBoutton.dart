import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class  Catomboutton extends StatelessWidget {
  const Catomboutton ({super.key, required this.ispicc, required this.title,required this.onTap});
  final bool ispicc;
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    bool ispic=ispicc;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.redAccent,
        width: double.infinity,
        child: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ispic?
                Image.asset("assets/AppBarImages/shoppingbag.png",height: 40,width: 28,): SizedBox.shrink(),
                Gap(10),
                Text(title.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 20,letterSpacing: 5),)
              ],
            ),
          ),
        ),
      ),

    );
  }
}
