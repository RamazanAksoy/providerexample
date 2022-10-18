import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Item with ChangeNotifier{
  int _cartCount;
  List<int> _count;
   List ?data;

 List<int> get count => this._count;

 set count(List<int> value) => this._count = value;



 Future<dynamic> get loadJsonData async {
 
    var jsonText = await rootBundle.loadString('assets/item.json');
      data = json.decode(jsonText);
    return data;
  }


  List<int> fiyatlar(){
List<int> fiyat=List.generate(data!.length, (index) => 0);
for(int i=0;i<data!.length;i++)
{
  fiyat[i]=int.parse(data![i]["Fiyat"]);

}
    return fiyat;
  }

 int  toplam (){
 int toplam=0;
 for(int i=0;i<_count.length;i++)
  {
     toplam=toplam+_count[i];
  }

    return toplam;
 } 

 int  toplamfiyat (List<int> deger){
 int toplamfiyat=0;
 for(int i=0;i<_count.length;i++)
  {
     toplamfiyat+=_count[i]*deger[i];
  }

    return toplamfiyat;
 } 


void increase1(int index){
    _count[index]++;
    notifyListeners();
  }

    void decrease1(int index){
     _count[index]--;

    notifyListeners();
  }


 
Item(this._cartCount,this._count);







  int get cartCounts=>_cartCount;
  set cartCount(int value){
    _cartCount=value;
  }

  void increase(){
    _cartCount++;
    notifyListeners();
  }

    void decrease(){
    _cartCount--;
    notifyListeners();
  }

    void reset(){
    _cartCount=0;
    notifyListeners();
  }



}