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
      image:
          'https://www.terracity.com.tr/fileadmin/user_upload/GLOBAL/brand_stores/logos/samsonite.jpg',
      products: [
        AirportProduct(
            id: 21,
            name: 'Deri Çanta',
            price: 299.99,
            image:
                "https://akn-samsonite.a-cdn.akinoncloud.com/products/2019/09/06/14144/0e4c7ea7-f008-462d-917c-a586e6d27fd5_size470x707.jpg"),
        AirportProduct(
            id: 22,
            name: 'BACKPACK 13.3',
            price: 129.99,
            image:
                "https://akn-samsonite.a-cdn.akinoncloud.com/products/2024/01/30/23936/bad73316-9322-4340-8c9b-33e70db6ffac_size470x707.jpg"),
        AirportProduct(
            id: 23,
            name: 'Laptop Bag',
            price: 99.99,
            image:
                "https://akn-samsonite.a-cdn.akinoncloud.com/products/2021/08/06/19335/ea05c40e-6b40-4713-b7c3-45abf127689e_size470x707.jpg"),
        AirportProduct(
            id: 24,
            name: 'Sırt Çantası',
            price: 149.99,
            image:
                "https://akn-samsonite.a-cdn.akinoncloud.com/products/2024/02/02/28267/0870ba16-644d-46b7-9abd-3fcbdab3a96a_size470x707.jpg"),
        AirportProduct(
            id: 25,
            name: 'Valiz',
            price: 49.99,
            image:
                "https://akn-samsonite.a-cdn.akinoncloud.com/products/2024/05/21/30098/a1c7afe0-cec0-47a3-9aa4-53a6311dcafc_size470x707.jpg"),
        AirportProduct(
            id: 26,
            name: 'Valiz',
            price: 29.99,
            image:
                "https://akn-samsonite.a-cdn.akinoncloud.com/products/2020/08/05/16937/79378074-50a5-4d4f-89e4-56b46b39e9de_size470x707.jpg"),
        AirportProduct(
            id: 27,
            name: 'Bel Çantası',
            price: 9.99,
            image:
                "https://akn-samsonite.a-cdn.akinoncloud.com/products/2023/11/13/25643/1b4b4b34-284c-494b-bafc-51a3a937f4fb_size470x707.jpg"),
        AirportProduct(
            id: 28,
            name: 'Kırmızı Valiz',
            price: 19.99,
            image:
                "https://akn-samsonite.a-cdn.akinoncloud.com/products/2022/02/17/21017/a32fde3c-f910-43f9-ad4b-58e727f41fba.jpg"),
        AirportProduct(
            id: 29,
            name: 'Travel Çantası',
            price: 24.99,
            image:
                "https://akn-samsonite.a-cdn.akinoncloud.com/products/2023/03/09/23840/5f7e1cdc-b624-488a-b162-ef387658d238_size470x707.jpg"),
        AirportProduct(
            id: 30,
            name: 'Pembe Valiz',
            price: 39.99,
            image:
                "https://akn-samsonite.a-cdn.akinoncloud.com/products/2022/05/16/21622/0a033443-06f0-448c-8dfc-650146541238_size470x707.jpg"),
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
          'https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/1200px-Starbucks_Corporation_Logo_2011.svg.png',
      products: [
        AirportProduct(
            id: 41,
            name: 'Şehir Temalı Termos',
            price: 399,
            image:
                "https://static.ticimax.cloud/cdn-cgi/image/width=480,quality=85/56041/uploads/urunresimleri/buyuk/starbucks-sehir-temali-termos-turkiye--152757.jpg"),
        AirportProduct(
            id: 42,
            name: 'Mozaik Desenli Seramik Kupa',
            price: 449,
            image:
                "https://static.ticimax.cloud/cdn-cgi/image/width=480,quality=85/56041/uploads/urunresimleri/buyuk/starbucks-mozaik-desenli-seramik-kupa---4c16-.jpg"),
        AirportProduct(
            id: 43,
            name: 'Anahtarlık',
            price: 259,
            image:
                "https://static.ticimax.cloud/cdn-cgi/image/width=480,quality=85/56041/uploads/urunresimleri/buyuk/starbucks-anahtarlik-turuncu-11150177-3d7213.jpg "),
        AirportProduct(
            id: 44,
            name: 'Plastik Soğuk Içecek Bardağı',
            price: 479,
            image:
                "https://static.ticimax.cloud/cdn-cgi/image/width=480,quality=85/56041/uploads/urunresimleri/buyuk/starbucks-psl-plastik-soguk-icecek-bar--4c54-.jpg "),
        AirportProduct(
            id: 45,
            name: 'Indonesia Gunung Leuser',
            price: 499,
            image:
                "https://static.ticimax.cloud/cdn-cgi/image/width=480,quality=85/56041/uploads/urunresimleri/buyuk/starbucks-reserve-250-g-indonesia-gunu-fbc0d9.jpg "),
        AirportProduct(
            id: 46,
            name: 'Yeniden Kullanılabilir Sıcak İçecek Bardağı',
            price: 349,
            image:
                "https://static.ticimax.cloud/cdn-cgi/image/width=480,quality=85/56041/uploads/urunresimleri/buyuk/starbucks-yeniden-kullanilabilir-sicak-62b614.jpg "),
        AirportProduct(
            id: 47,
            name: 'Kahve Presi Özellikli Paslanmaz Çelik Termos',
            price: 650,
            image:
                "https://static.ticimax.cloud/cdn-cgi/image/width=480,quality=85/56041/uploads/urunresimleri/buyuk/starbucks-kahve-presi-ozellikli-paslan-6ef686.jpg "),
        AirportProduct(
            id: 48,
            name: 'Seramik Kupa',
            price: 259,
            image:
                "https://static.ticimax.cloud/cdn-cgi/image/width=480,quality=85/56041/uploads/urunresimleri/buyuk/starbucks-seramik-kupa-turuncu-355-ml--bdc629.jpg "),
        AirportProduct(
            id: 49,
            name: 'Paslanmaz Çelik Termos',
            price: 850,
            image:
                "https://static.ticimax.cloud/cdn-cgi/image/width=480,quality=85/56041/uploads/urunresimleri/buyuk/starbucks-paslanmaz-celik-termos-laciv-45763-.jpg "),
        AirportProduct(
            id: 50,
            name: 'Plastik Soğuk İçecek Bardağı',
            price: 590,
            image:
                "https://static.ticimax.cloud/cdn-cgi/image/width=480,quality=85/56041/uploads/urunresimleri/buyuk/starbucks-parlak-paslanmaz-celik-termo-48f4-b.jpg "),
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
    AirportBrand(
      name: 'Swarovski',
      image: 'https://asset.brandfetch.io/idgQKdIOpA/idId7bSupp.png',
      products: [
        AirportProduct(
            id: 51,
            name: 'Passage Chrono Saat',
            price: 999.99,
            image:
                "https://img-swarovski.mncdn.com/Content/Images/Thumbs/0036956_passage-chrono-saat-deri-kayis-pembe-pembe-altin-rengi-pvd-m5580342120-4268.jpeg "),
        AirportProduct(
            id: 52,
            name: 'Saat',
            price: 799.99,
            image:
                "https://img-swarovski.mncdn.com/Content/Images/Thumbs/0047515_saat-m5630840120-6422.jpeg "),
        AirportProduct(
            id: 53,
            name: 'Crystalline Delight Saat',
            price: 199.99,
            image:
                "https://img-swarovski.mncdn.com/Content/Images/Thumbs/0036968_crystalline-delight-saat-metal-bileklik-beyaz-paslanmaz-celik-m5580530101-4263.jpeg "),
        AirportProduct(
            id: 54,
            name: 'Cosmopolitan Saat',
            price: 299.99,
            image:
                "https://img-swarovski.mncdn.com/Content/Images/Thumbs/0043501_cosmopolitan-saat-m5517794120-5714.jpeg "),
        AirportProduct(
            id: 55,
            name: 'Gema Kolye',
            price: 1299.99,
            image:
                "https://img-swarovski.mncdn.com/Content/Images/Thumbs/0048854_gema-kolye-m5662493120-6650.jpeg"),
        AirportProduct(
            id: 56,
            name: 'Mesmera damla küpeler',
            price: 1499.99,
            image:
                "https://img-swarovski.mncdn.com/Content/Images/Thumbs/0050781_mesmera-damla-kupeler-m5665878112-7000.jpeg"),
        AirportProduct(
            id: 57,
            name: 'Mesmera Bileklik',
            price: 299.99,
            image:
                "https://img-swarovski.mncdn.com/Content/Images/Thumbs/0050203_mesmera-bileklik-m5669927101-6864.jpeg"),
        AirportProduct(
            id: 58,
            name: 'Saat',
            price: 199.99,
            image:
                "https://img-swarovski.mncdn.com/Content/Images/Thumbs/0048948_swarovski-iconic-swan-kolye-m5647872101-6677.jpeg"),
        AirportProduct(
            id: 59,
            name: 'Bileklik',
            price: 999.99,
            image:
                "https://img-swarovski.mncdn.com/Content/Images/Thumbs/0052895_swarovski-swan-kolye-m5680868102-7311.jpeg "),
        AirportProduct(
            id: 60,
            name: 'Saat',
            price: 149.99,
            image:
                "https://img-swarovski.mncdn.com/Content/Images/Thumbs/0052131_swarovski-swan-damla-kupeler-m5647543152-7147.jpeg"),
      ],
    ),
    AirportBrand(
      name: 'Apple',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/640px-Apple_logo_black.svg.png',
      products: [
        AirportProduct(
            id: 51,
            name: 'Iphone 15',
            price: 999.99,
            image:
                "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-card-40-iphone14-202209_FMT_WHH?wid=508&hei=472&fmt=p-jpg&qlt=95&.v=1693086370007"),
        AirportProduct(
            id: 52,
            name: 'Saat',
            price: 799.99,
            image:
                "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/airtag-4pack-select-202104_FMT_WHH?wid=890&hei=890&fmt=jpeg&qlt=90&.v=1617761669000"),
        AirportProduct(
            id: 53,
            name: 'Iphone 13',
            price: 199.99,
            image:
                "https://cdn03.ciceksepeti.com/cicek/kcm59984040-1/L/apple-iphone-13-pro-max-128-gb-mavi-teshir-urun-apple-turkiye-garantili-kcm59984040-1-56c505cc9bb04f5aabd15098f88a9519.jpg"),
        AirportProduct(
            id: 54,
            name: 'Tablet',
            price: 299.99,
            image:
                "https://shiftdelete.net/wp-content/uploads/2021/10/en-ucuz-apple-urunleri-9.jpg"),
        AirportProduct(
            id: 55,
            name: 'TV Stick',
            price: 1299.99,
            image: "https://cdn.webrazzi.com/uploads/2015/09/apple-tv-1.jpg"),
        AirportProduct(
            id: 56,
            name: 'Iphone 14',
            price: 1499.99,
            image:
                "https://cdn.tet.lv/tetveikals-prd-images/grid_product_image_webp/products/viedtalrunis-apple-iphone-15-7-65017700cec75.jpg.webp"),
        AirportProduct(
            id: 57,
            name: 'Iphone 14',
            price: 299.99,
            image:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYHhYtrOnsoH5IinJcTzF6-rFZSlBcvtKJczzcB7tk6A&s"),
        AirportProduct(
            id: 58,
            name: 'Saat',
            price: 199.99,
            image:
                "https://img-swarovski.mncdn.com/Content/Images/Thumbs/0048948_swarovski-iconic-swan-kolye-m5647872101-6677.jpeg"),
        AirportProduct(
            id: 59,
            name: 'Kulaklık',
            price: 999.99,
            image:
                "https://istyle.rs/media/catalog/product/cache/image/700x700/e9c3970ab036de70892d86c6d221abfe/m/m/mmef2_av3_9.jpeg"),
        AirportProduct(
            id: 60,
            name: 'Apple Watch',
            price: 149.99,
            image:
                "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/49-cell-titanium-trail-green-gray-ultra_GEO_TR?wid=4000&hei=4000&fmt=p-jpg&qlt=95&.v=1693685920826"),
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
