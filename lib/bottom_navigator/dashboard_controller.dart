

import 'dart:math';

import 'package:flutter/widgets.dart' ;
import 'package:get/get_state_manager/get_state_manager.dart';

class DashboardController extends GetxController {

  int currentScreen = 0;
  final formkEY = GlobalKey<FormState>();


  bool XO(String str){
      int xcount = str.toLowerCase().split('').where((a) => a =='x').length;
      int ocount = str.toLowerCase().split('').where((a) => a =='o').length;
      return xcount == ocount;
  }


  bool XOa(String str) {
  int xCount = 0;
  int oCount = 0;

  for (var char in str.toLowerCase().runes) {
    if (char == 'x'.codeUnitAt(0)) xCount++;
    if (char == 'o'.codeUnitAt(0)) oCount++;
  }

  return xCount == oCount;
}

bool XOq(str) {
  var s = str.toLowerCase();
  return 'x'.allMatches(s).length == 'o'.allMatches(s).length;
}
int binaryArrayToNumber(List<int> arr) {
  return int.parse(arr.join(), radix: 2);
}
List<String> a = ['4','4','4'];
String expandedForm(int num) {
  
  var temp = '';
  
  List<String> dividedNum = num.toString().split('');
  for(int a = 0; a < dividedNum.length ; a++){
    
    temp = temp + (dividedNum[a] + '*' + ('1${dividedNum.indexOf(dividedNum[a]) - 1}')); 
  }
  return '';
}

int duplicateCount(String text) {
  var lower = text.toLowerCase();
  Map<String, int> freq = {};
  
  for (var char in lower.split('')) {
    freq[char] = (freq[char] ?? 0) + 1;
  }

  return freq.values.where((count) => count > 1).length;
}


bool isSquare(int n) {
  if (n < 0) return false;
  int root = sqrt(n).toInt();
  return root * root == n;
}



  
}