
import 'package:get/get.dart';

import '../ui/pages/shopping_page/model/shopping_pages_model.dart';

class ShoppingController extends GetxController {
List<Category> categories = [
  Category(
    name: 'Aksesuar',
    brands: [
      Brand(name: 'Accessorize', location: 'Terminal A'),
      Brand(name: 'H&M', location: 'Terminal B'),
    ],
  ),
  Category(
    name: 'Giyim',
    brands: [
      Brand(name: 'Zara', location: 'Terminal C'),
      Brand(name: 'Mango', location: 'Terminal D'),
    ],
  ),
  Category(
    name: 'Eğlence',
    brands: [
      Brand(name: 'GameStop', location: 'Terminal E'),
      Brand(name: 'LEGO Store', location: 'Terminal F'),
    ],
  ),
];
}
  