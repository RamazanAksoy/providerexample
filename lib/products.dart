import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:providerproject/item.dart';
import 'package:providerproject/itemreset.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  
  
    Consumer(
      builder: (context, Item item, child) {
        return
         FutureBuilder(
                future: item.loadJsonData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return  
          Scaffold(
            backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Sepetteki ürün  " + item.toplam().toString()),
          ),
          body:    
          Column(children: [
            SizedBox(
              height: 80.h,
              width: 100.w,
              child:         
               ListView.builder(
                itemCount:  snapshot.data!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100.w,
                    height: 8.h,
                    margin: EdgeInsets.only(bottom: 1.h),
                    padding: EdgeInsets.only(right: 3.w, left: 3.w),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 25.w,
                                height: 25.w,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          snapshot.data![index]["Resim"],
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5.w),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                       snapshot.data![index]["UrunAdi"],
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                    Text(
                                       snapshot.data![index]["Fiyat"] + " TL",
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  item.decrease1(index);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 1.w),
                                  width: 4.h,
                                  height: 4.h,
                                  padding: EdgeInsets.only(bottom: 10.h),
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey.shade200,
                                      borderRadius: BorderRadius.circular(7.h)),
                                  child: Icon(Icons.minimize),
                                ),
                              ),
                              Text(item.count[index].toString()),
                              InkWell(
                                onTap: () {
                                  item.increase1(index);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 1.w),
                                  width: 4.h,
                                  height: 4.h,
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey.shade200,
                                      borderRadius: BorderRadius.circular(7.h)),
                                  child: Icon(Icons.add),
                                ),
                              )
                            ],
                          ),
                        ]),
                  );
                },
              ),
            ),

               Container(width: 90.w,height: 2.h,child: Text(item.toplamfiyat(item.fiyatlar()).toString()),),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ItemResetScreen()));
                },
                child: Container(
                  color: Colors.red,
                  width: 50.w,
                  height: 5.h,
                  child: Text("Sıfırla"),
                ))
          ]),
        );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
    
                  // By default, show a loading spinner.
                  return Center(child: const CircularProgressIndicator());
                },
              );
        
        
        
       
      },
    );
  }
}
