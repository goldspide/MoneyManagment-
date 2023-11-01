import 'package:cobay/data/1data.dart';

List<Money> geter_top(){
  Money snap_food = Money();
  snap_food.name = 'snap_food';
  snap_food.fee = '-\$650';
  snap_food.time ='jan 30,2022';
  snap_food.image = 'food.png';
  snap_food.buy =true;

  Money snap = Money();
  snap.buy = true;
  snap.fee ='-\$15';
  snap.image = 'Education.png';
  snap.name = 'snap';
  snap.time ='today';

  Money transfer = Money();
  transfer.buy=true;
  transfer.fee='-\$100';
  transfer.image='Transfer.png';
  transfer.name ='transfer for sam';
  transfer.time = 'jan 30,2022';
  return[snap_food, snap, transfer];
}