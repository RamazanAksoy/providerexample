import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:providerproject/item.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ItemResetScreen extends StatefulWidget {
  const ItemResetScreen({super.key});

  @override
  State<ItemResetScreen> createState() => _ItemResetScreenState();
}

class _ItemResetScreenState extends State<ItemResetScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer(builder: (context,Item value, child) {
        return Scaffold(
        
        body: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [
          Container(
            child: Text("Ürün adeti : "+value.cartCounts.toString()),
          ),
          GestureDetector(
            onTap: () {
              
              value.reset();
            },
            child: Container(
              width: 70.w,
              height: 6.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(1.h),color: Colors.red),
              child: Text("SIFIRLA"),
            ),
          ),
        ]),
      );
      },)
    );
  }
}
