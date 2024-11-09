import 'dart:io';

void main(){
  dynamic product = [];
  stdout.write("Enter number of products:");
  int? numOfPro = int.parse(stdin.readLineSync()!);
  // double? totalgrand;
  double totalgrand=0.0;
  double? totalgrandR = 0.0;

  for(int i=1; i<=numOfPro; i++){
    stdout.write("Enter Product Name:");
    String? name = stdin.readLineSync();
    stdout.write("Enter Product Qty:");
    double? qty = double.parse(stdin.readLineSync()!);
    stdout.write("Enter Product Price:");
    double? price = double.parse(stdin.readLineSync()!);
    stdout.write("Enter Product Discount(%):");
    double? dis = double.parse(stdin.readLineSync()!);
    print("--------------------------------------");

    double disprice = price * qty;
    double? totalprice = discount(disprice: disprice, dis: dis);

    totalgrand += totalprice!;
    // totalgrand = total(totalgrand!, totalprice!);
    totalgrandR = totalriel(totalgrandR!, totalprice);

    product.add({
      'name': name,
      'qty': qty,
      'price' : price,
      'dis': dis,
      'totalprice': totalprice

    });
  }
    print("ID\tName\tQty\t\tPrice\tDis(%)\t\tTotalPrice");
  for(int i=0; i< product.length; i++){
    var p = product[i];
    print("${i+1}\t${p['name']}\t${p['qty']}\t\t${p['price']}\t\t${p['dis']}\t\t\t${p['totalprice']}");
  }
  print("------------------------------");
  print("Total Grand: ${totalgrand?.toStringAsFixed(2)} \$");
  print("Total Grand(Riel): ${totalgrandR?.truncate()} Riel");
}
double discount({required double disprice, required double dis}){
  double discount = (disprice * dis!)/100;
  double totalprice = disprice - discount;
  return totalprice;
}

double? totalriel(double totalgrandR, double totalprice){
  totalgrandR += totalprice * 4100;
  return totalgrandR;
}
