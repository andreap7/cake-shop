import 'package:flutter/material.dart';
import 'package:hello_flutter/screens/cake.dart';

import 'screens/cake.dart';

/*
1. Napraviti novu flutter aplikaciju
2. Dodati sliku kolaca u assets
3. Na pocetnom screenu aplikacije napraviti dugme, na tap ovog dugmeta se otvara stranica sa slike
4. Napraviti stranicu kao sa slike, obratiti paznju na sljedece:
	- pritiskom na bilo koje dugme sa kilogramima, oznaciti ga kao selektovano tj. promijeniti mu izgled, samo jedno dugme moze biti selektovano
	- counter treba da povecava i smanjuje broj
	- cijenu izdvojiti u poseban widget
	- sliku ucitati iz asset-a
5. Pritiskom na back vratiti se na prethodnu stranicu

Napomena:

Kao dodatak na ovaj izazov napraviti:

- Loading na slici prilikom izmjene količine(kilogrami sa gornjeg dijela screena)
- Prikaz druge slike torte u zavisnosti koji button je odabran(kilogrami sa gornjeg dijela screena)
*/

void main() {
  runApp(Cake());
}
