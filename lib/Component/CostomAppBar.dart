
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
class CostomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CostomAppBar({super.key});
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(80);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child :AppBar(
        backgroundColor:Colors.black,
        actionsPadding: EdgeInsets.symmetric(horizontal: 0),
        centerTitle: true,
        leadingWidth: 25,
        scrolledUnderElevation: 0.0,
        title: Image.asset("assets/AppBarImages/Group.png"),
        leading: Image.asset("assets/AppBarImages/Menu.png"),
        actions: [
          Image.asset("assets/AppBarImages/Search.png",height: 28,width: 28,),
          Gap(20),
          Image.asset("assets/AppBarImages/shoppingbag.png",height: 28,width: 28,),

        ],

      )

    );
  }


}