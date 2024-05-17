import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../ui/pages/airportshoppingstores_page/model/airport_shopping_stores_model.dart';

class AirportShoppingStoresController extends GetxController {
  TextEditingController searchController = TextEditingController();

  List<AirportBrand> airportBrands = [
    AirportBrand(
      name: 'H&M',
      image: 'https://assets.turbologo.com/blog/en/2021/07/07050018/hm-color-logo.png',
      products: [
        AirportProduct(id: 1, name: 'Basic T-shirt', price: 19.99, image: "https://lp2.hm.com/hmgoepprod?set=source%5B/16/90/1690ecd75377a91fe270a8de3c1785702078e881.jpg%5D,origin%5Bdam%5D,category%5B%5D,type%5BDESCRIPTIVESTILLLIFE%5D,res%5Bm%5D,hmver%5B2%5D&call=url%5Bfile:/product/style%5D"),
        AirportProduct(id: 2, name: 'Slim Fit Jeans', price: 39.99, image: "https://static.zara.net/assets/public/03c9/6341/197941ad9cff/9b5a25822622/1689235453177/1689235453177.jpg?ts=1701867134395&w=824"),
        AirportProduct(id: 3, name: 'Hooded Sweatshirt', price: 29.99, image: "https://static.zara.net/assets/public/d113/f5ef/e19b43e48e76/69231aa0e3b7/05584408800-e1/05584408800-e1.jpg?ts=1701085161816&w=1920"),
      ],
    ),
    AirportBrand(
      name: 'Zara',
      image: 'https://brandemia.org/contenido/subidas/2019/02/zara-nuevo-logo-960x640.jpg',
      products: [
        AirportProduct(
          id: 4,
          name: 'Regular Jeans',
          price: 49.99,
          image: "https://static.zara.net/assets/public/97b2/31bc/422c4ce6a0be/9b16415aaa72/1690381062337/1690381062337.jpg?ts=1702071891598&w=824",
        ),
        AirportProduct(id: 5, name: 'Trençkot', price: 79.99, image: "https://static.zara.net/assets/public/6584/d93f/89884a0581f4/7a9e85dc24f7/03811040450-e1/03811040450-e1.jpg?ts=1706702332993&w=1920"),
        AirportProduct(id: 6, name: 'Deri Bot', price: 89.99, image: "https://static.zara.net/assets/public/9147/0ee8/ac834c388e26/723edda74d88/12030320800-e2/12030320800-e2.jpg?ts=1701174790622&w=1920"),
      ],
    ),
    AirportBrand(
      name: 'Mango',
      image: 'https://logowik.com/content/uploads/images/808_mango_logo.jpg',
      products: [
        AirportProduct(id: 7, name: 'Deri Ceket', price: 89.99, image: "https://static.zara.net/assets/public/d7f0/ad42/1acb43e8aa2b/5b11f83f8b5a/03046037800-e1/03046037800-e1.jpg?ts=1708505721107&w=824"),
        AirportProduct(id: 8, name: 'Comfort Jeans', price: 59.99, image: "https://static.zara.net/assets/public/24a5/cb12/ff524e9db278/59b8d3d570e3/08228029800-e1/08228029800-e1.jpg?ts=1704356987300"),
        AirportProduct(id: 9, name: 'Spor Ayakkabı', price: 69.99, image: "https://static.zara.net/assets/public/625c/d5b7/25994d7fb139/18df72d028a2/13426330102-e2/13426330102-e2.jpg?ts=1699888335541&w=824"),
      ],
    ),
  ];

  List<AirportProduct> shoppingCart = [];

  void addToCart(AirportProduct product) {
    int existingIndex = shoppingCart.indexWhere((item) => item.id == product.id);
    if (existingIndex != -1) {
      shoppingCart[existingIndex].quantity += 1;
    } else {
      AirportProduct newProduct = AirportProduct(
        id: product.id,
        image: product.image,
        name: product.name,
        price: product.price,
        quantity: 1,
      );
      shoppingCart.add(newProduct);
    }
  }

  String calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var product in shoppingCart) {
      totalPrice += product.price * product.quantity;
    }
    String formattedValue = totalPrice.toStringAsFixed(2);
    return formattedValue;
  }

  void makePayment() async {
    double payment = double.tryParse(calculateTotalPrice()) ?? 0.0;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Firestore'dan mevcut kullanıcının kart bilgilerini getir
      CollectionReference cardsCollection = FirebaseFirestore.instance.collection('mycards').doc(user.uid).collection('cards');
      QuerySnapshot cardsQuery = await cardsCollection.get();

      // Kullanıcının kart bilgilerini kontrol et
      if (cardsQuery.docs.isNotEmpty) {
        List<dynamic> cards = cardsQuery.docs.map((doc) => doc.data()).toList(); // Kullanıcının kartları

        double totalLimit = 0.0;
        for (var card in cards) {
          totalLimit += card['limit'];
        }

        // Toplam limit kontrolü
        if (payment > totalLimit) {
          Get.closeAllSnackbars();
          Get.snackbar("Hata", "Kart limitiniz yetersiz.");
          Navigator.pop(Get.context!);
          return;
        }

        double paymentPerCard = payment / cards.length; // Her kart için düşecek tutar

        // Her bir kartın limitinden ödeme tutarını düş
        List<Map<String, dynamic>> updatedCards = [];
        for (int i = 0; i < cards.length; i++) {
          double currentLimit = cards[i]['limit']; // Kartın mevcut limiti
          double updatedLimit = currentLimit - paymentPerCard; // Güncellenmiş limit

          updatedCards.add({'limit': updatedLimit});
        }

        // Her bir kartın limitinden ödeme tutarını düş
        for (var i = 0; i < cards.length; i++) {
          double currentLimit = cards[i]['limit']; // Kartın mevcut limiti
          double updatedLimit = currentLimit - paymentPerCard; // Güncellenmiş limit

          // Güncellenmiş kart limitini Firestore'a geri kaydet
          await FirebaseFirestore.instance.collection('mycards').doc(user.uid).collection('cards').doc(cardsQuery.docs[i].id).update({
            'limit': updatedLimit,
          });
        }

        shoppingCart.clear();
        update();
        Navigator.pop(Get.context!);
        calculateTotalPrice();
      } else {
        Get.closeAllSnackbars();
        Get.snackbar("Hata", "Kayıtlı Kartınız Bulunmamaktadır");
        Navigator.pop(Get.context!);
      }
    }
  }
}
