import 'package:get/get.dart';

import '../ui/pages/shopping_page/model/shopping_pages_model.dart';

class ShoppingController extends GetxController {
  List<Category> categories = [
    Category(
      name: 'Aksesuar',
      brands: [
        Brand(name: 'Accessorize', location: 'Terminal A'),
        Brand(name: 'Swarovski', location: 'Terminal B'),
      ],
    ),
    Category(
      name: 'Giyim',
      brands: [
        Brand(name: 'Beymen', location: 'Terminal C'),
        Brand(name: 'Boyner', location: 'Terminal D'),
      ],
    ),
    Category(
      name: 'Elektronik',
      brands: [
        Brand(name: 'Apple', location: 'Terminal E'),
        Brand(name: 'Samsung', location: 'Terminal F'),
        Brand(name: 'MadiaMarkt', location: 'Terminal G'),
      ],
    ),
    Category(
      name: 'Ayakkabı Çanta',
      brands: [
        Brand(name: 'Hotiç', location: 'Terminal H'),
        Brand(name: 'Desa', location: 'Terminal I'),
        Brand(name: 'Samsonite', location: 'Terminal J'),
      ],
    ),
    Category(
      name: 'Cafe Restaurant',
      brands: [
        Brand(name: 'Starbucks', location: 'Terminal K'),
        Brand(name: 'Nero Cafe', location: 'Terminal L'),
        Brand(name: 'Simitci Dünyasi', location: 'Terminal M'),
        Brand(name: 'Mezzaluna', location: 'Terminal N'),
        Brand(name: 'Neuhouse', location: 'Terminal O'),
        Brand(name: 'ATU WineHouse', location: 'Terminal O'),
      ],
    ),
    Category(
      name: 'Fast Food',
      brands: [
        Brand(name: 'Buger King', location: 'Terminal P'),
        Brand(name: 'KFC', location: 'Terminal Q'),
        Brand(name: 'Dominos Pizza', location: 'Terminal R'),
      ],
    ),
    Category(
      name: 'Sağlık Kişisel Bakım',
      brands: [
        Brand(name: 'Yeşim Eczanesi', location: 'Terminal S'),
        Brand(name: 'Watsons', location: 'Terminal T'),
        Brand(name: 'Gratis', location: 'Terminal U'),
        Brand(name: 'Sephora', location: 'Terminal U'),
      ],
    ),
    Category(
      name: 'Kitap Kırtasiye',
      brands: [
        Brand(name: 'D&R', location: 'Terminal V'),
        Brand(name: 'Office', location: 'Terminal W'),
      ],
    ),
    Category(
      name: 'Duty Free',
      brands: [
        Brand(name: 'ATU Duty Free', location: 'Terminal X'),
      ],
    ),
  ];
}
