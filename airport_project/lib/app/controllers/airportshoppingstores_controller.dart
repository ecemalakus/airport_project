import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../ui/pages/airportshoppingstores_page/model/airport_shopping_stores_model.dart';

class AirportShoppingStoresController extends GetxController {
  TextEditingController searchController = TextEditingController();

  List<AirportBrand> airportBrands = [
    AirportBrand(
      name: 'Duty Free',
      image:
          'https://www.smartertravel.com/wp-content/uploads/2019/10/AdobeStock_333915440-scaled-e1695846703202-1200x627.jpeg',
      products: [
        AirportProduct(
            id: 1,
            name: 'Basic T-shirt',
            price: 19.99,
            image: "https://example.com/image1.jpg"),
        AirportProduct(
            id: 2,
            name: 'Slim Fit Jeans',
            price: 39.99,
            image: "https://example.com/image2.jpg"),
        AirportProduct(
            id: 3,
            name: 'Hooded Sweatshirt',
            price: 29.99,
            image: "https://example.com/image3.jpg"),
        AirportProduct(
            id: 4,
            name: 'Sunglasses',
            price: 99.99,
            image: "https://example.com/image4.jpg"),
        AirportProduct(
            id: 5,
            name: 'Perfume',
            price: 59.99,
            image: "https://example.com/image5.jpg"),
        AirportProduct(
            id: 6,
            name: 'Watch',
            price: 199.99,
            image: "https://example.com/image6.jpg"),
        AirportProduct(
            id: 7,
            name: 'Handbag',
            price: 149.99,
            image: "https://example.com/image7.jpg"),
        AirportProduct(
            id: 8,
            name: 'Necklace',
            price: 49.99,
            image: "https://example.com/image8.jpg"),
        AirportProduct(
            id: 9,
            name: 'Chocolate Box',
            price: 19.99,
            image: "https://example.com/image9.jpg"),
        AirportProduct(
            id: 10,
            name: 'Liquor Bottle',
            price: 89.99,
            image: "https://example.com/image10.jpg"),
      ],
    ),
    AirportBrand(
      name: 'Boyner',
      image:
          'https://brandemia.org/contenido/subidas/2019/02/zara-nuevo-logo-960x640.jpg',
      products: [
        AirportProduct(
            id: 11,
            name: 'Regular Jeans',
            price: 49.99,
            image: "https://example.com/image11.jpg"),
        AirportProduct(
            id: 12,
            name: 'Trençkot',
            price: 79.99,
            image: "https://example.com/image12.jpg"),
        AirportProduct(
            id: 13,
            name: 'Deri Bot',
            price: 89.99,
            image: "https://example.com/image13.jpg"),
        AirportProduct(
            id: 14,
            name: 'Blazer Ceket',
            price: 99.99,
            image: "https://example.com/image14.jpg"),
        AirportProduct(
            id: 15,
            name: 'Gömlek',
            price: 29.99,
            image: "https://example.com/image15.jpg"),
        AirportProduct(
            id: 16,
            name: 'Elbise',
            price: 69.99,
            image: "https://example.com/image16.jpg"),
        AirportProduct(
            id: 17,
            name: 'Çanta',
            price: 59.99,
            image: "https://example.com/image17.jpg"),
        AirportProduct(
            id: 18,
            name: 'Kolye',
            price: 19.99,
            image: "https://example.com/image18.jpg"),
        AirportProduct(
            id: 19,
            name: 'Saat',
            price: 129.99,
            image: "https://example.com/image19.jpg"),
        AirportProduct(
            id: 20,
            name: 'Ayakkabı',
            price: 79.99,
            image: "https://example.com/image20.jpg"),
      ],
    ),
    AirportBrand(
      name: 'Samsonite',
      image: 'https://www.samsonite.com/images/logo.jpg',
      products: [
        AirportProduct(
            id: 21,
            name: 'Travel Luggage',
            price: 299.99,
            image: "https://example.com/image21.jpg"),
        AirportProduct(
            id: 22,
            name: 'Backpack',
            price: 129.99,
            image: "https://example.com/image22.jpg"),
        AirportProduct(
            id: 23,
            name: 'Laptop Bag',
            price: 99.99,
            image: "https://example.com/image23.jpg"),
        AirportProduct(
            id: 24,
            name: 'Briefcase',
            price: 149.99,
            image: "https://example.com/image24.jpg"),
        AirportProduct(
            id: 25,
            name: 'Wallet',
            price: 49.99,
            image: "https://example.com/image25.jpg"),
        AirportProduct(
            id: 26,
            name: 'Travel Pillow',
            price: 29.99,
            image: "https://example.com/image26.jpg"),
        AirportProduct(
            id: 27,
            name: 'Luggage Tag',
            price: 9.99,
            image: "https://example.com/image27.jpg"),
        AirportProduct(
            id: 28,
            name: 'Passport Holder',
            price: 19.99,
            image: "https://example.com/image28.jpg"),
        AirportProduct(
            id: 29,
            name: 'Travel Adapter',
            price: 24.99,
            image: "https://example.com/image29.jpg"),
        AirportProduct(
            id: 30,
            name: 'Umbrella',
            price: 39.99,
            image: "https://example.com/image30.jpg"),
      ],
    ),
    AirportBrand(
      name: 'D&R',
      image: 'https://www.dr.com.tr/Images/dr-logo.png',
      products: [
        AirportProduct(
            id: 31,
            name: 'Book',
            price: 19.99,
            image: "https://example.com/image31.jpg"),
        AirportProduct(
            id: 32,
            name: 'Music CD',
            price: 29.99,
            image: "https://example.com/image32.jpg"),
        AirportProduct(
            id: 33,
            name: 'DVD',
            price: 14.99,
            image: "https://example.com/image33.jpg"),
        AirportProduct(
            id: 34,
            name: 'Board Game',
            price: 49.99,
            image: "https://example.com/image34.jpg"),
        AirportProduct(
            id: 35,
            name: 'Puzzle',
            price: 24.99,
            image: "https://example.com/image35.jpg"),
        AirportProduct(
            id: 36,
            name: 'Stationery Set',
            price: 19.99,
            image: "https://example.com/image36.jpg"),
        AirportProduct(
            id: 37,
            name: 'Headphones',
            price: 39.99,
            image: "https://example.com/image37.jpg"),
        AirportProduct(
            id: 38,
            name: 'Bluetooth Speaker',
            price: 59.99,
            image: "https://example.com/image38.jpg"),
        AirportProduct(
            id: 39,
            name: 'Notebook',
            price: 9.99,
            image: "https://example.com/image39.jpg"),
        AirportProduct(
            id: 40,
            name: 'Pen Set',
            price: 14.99,
            image: "https://example.com/image40.jpg"),
      ],
    ),
    AirportBrand(
      name: 'Starbucks',
      image:
          'https://globalassets.starbucks.com/assets/3b5f516b6e6f484b8a36d7edaf6e00a8.jpg',
      products: [
        AirportProduct(
            id: 41,
            name: 'Coffee',
            price: 4.99,
            image: "https://example.com/image41.jpg"),
        AirportProduct(
            id: 42,
            name: 'Latte',
            price: 5.99,
            image: "https://example.com/image42.jpg"),
        AirportProduct(
            id: 43,
            name: 'Cappuccino',
            price: 5.49,
            image: "https://example.com/image43.jpg"),
        AirportProduct(
            id: 44,
            name: 'Espresso',
            price: 3.99,
            image: "https://example.com/image44.jpg"),
        AirportProduct(
            id: 45,
            name: 'Mocha',
            price: 5.99,
            image: "https://example.com/image45.jpg"),
        AirportProduct(
            id: 46,
            name: 'Frappuccino',
            price: 6.49,
            image: "https://example.com/image46.jpg"),
        AirportProduct(
            id: 47,
            name: 'Tea',
            price: 3.49,
            image: "https://example.com/image47.jpg"),
        AirportProduct(
            id: 48,
            name: 'Muffin',
            price: 2.99,
            image: "https://example.com/image48.jpg"),
        AirportProduct(
            id: 49,
            name: 'Cookie',
            price: 1.99,
            image: "https://example.com/image49.jpg"),
        AirportProduct(
            id: 50,
            name: 'Sandwich',
            price: 4.99,
            image: "https://example.com/image50.jpg"),
      ],
    ),
    AirportBrand(
      name: 'Beymen',
      image: 'https://www.beymen.com/images/logo.jpg',
      products: [
        AirportProduct(
            id: 51,
            name: 'Luxury Bag',
            price: 999.99,
            image: "https://example.com/image51.jpg"),
        AirportProduct(
            id: 52,
            name: 'Designer Shoes',
            price: 799.99,
            image: "https://example.com/image52.jpg"),
        AirportProduct(
            id: 53,
            name: 'Silk Scarf',
            price: 199.99,
            image: "https://example.com/image53.jpg"),
        AirportProduct(
            id: 54,
            name: 'Leather Wallet',
            price: 299.99,
            image: "https://example.com/image54.jpg"),
        AirportProduct(
            id: 55,
            name: 'Evening Dress',
            price: 1299.99,
            image: "https://example.com/image55.jpg"),
        AirportProduct(
            id: 56,
            name: 'Suit',
            price: 1499.99,
            image: "https://example.com/image56.jpg"),
        AirportProduct(
            id: 57,
            name: 'Sunglasses',
            price: 299.99,
            image: "https://example.com/image57.jpg"),
        AirportProduct(
            id: 58,
            name: 'Perfume',
            price: 199.99,
            image: "https://example.com/image58.jpg"),
        AirportProduct(
            id: 59,
            name: 'Watch',
            price: 999.99,
            image: "https://example.com/image59.jpg"),
        AirportProduct(
            id: 60,
            name: 'Belt',
            price: 149.99,
            image: "https://example.com/image60.jpg"),
      ],
    ),
  ];

  List<AirportProduct> shoppingCart = [];

  void addToCart(AirportProduct product) {
    int existingIndex =
        shoppingCart.indexWhere((item) => item.id == product.id);
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
      CollectionReference cardsCollection = FirebaseFirestore.instance
          .collection('mycards')
          .doc(user.uid)
          .collection('cards');
      QuerySnapshot cardsQuery = await cardsCollection.get();

      // Kullanıcının kart bilgilerini kontrol et
      if (cardsQuery.docs.isNotEmpty) {
        List<dynamic> cards = cardsQuery.docs
            .map((doc) => doc.data())
            .toList(); // Kullanıcının kartları

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

        double paymentPerCard =
            payment / cards.length; // Her kart için düşecek tutar

        // Her bir kartın limitinden ödeme tutarını düş
        List<Map<String, dynamic>> updatedCards = [];
        for (int i = 0; i < cards.length; i++) {
          double currentLimit = cards[i]['limit']; // Kartın mevcut limiti
          double updatedLimit =
              currentLimit - paymentPerCard; // Güncellenmiş limit

          updatedCards.add({'limit': updatedLimit});
        }

        // Her bir kartın limitinden ödeme tutarını düş
        for (var i = 0; i < cards.length; i++) {
          double currentLimit = cards[i]['limit']; // Kartın mevcut limiti
          double updatedLimit =
              currentLimit - paymentPerCard; // Güncellenmiş limit

          // Güncellenmiş kart limitini Firestore'a geri kaydet
          await FirebaseFirestore.instance
              .collection('mycards')
              .doc(user.uid)
              .collection('cards')
              .doc(cardsQuery.docs[i].id)
              .update({
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
