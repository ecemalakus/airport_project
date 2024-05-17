import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/pages/services_page/model/airport_service_model.dart';

class ServicesController extends GetxController {
  List<AirportService> airportServices = [
  AirportService(
    name: 'Restoran',
    iconData: 'restaurant', 
    details: 'Geniş menü seçenekleri ve hızlı servis ile yemek keyfi yaşayın.',
  ),
  AirportService(
    name: 'Kafe',
    iconData: 'local_cafe', 
    details: 'Taze kahve ve atıştırmalıklarla mola vermek için ideal.',
  ),
  AirportService(
    name: 'Duty Free Mağaza',
    iconData: 'store', 
    details: 'Seyahatinize özel alışveriş deneyimi için zengin ürün yelpazesi.',
  ),
  AirportService(
    name: 'Oto Kiralama',
    iconData: 'directions_car', 
    details: 'Rahat bir yolculuk için en iyi araç kiralama seçenekleri.',
  ),
  AirportService(
    name: 'Havalimanı Transferi',
    iconData: 'airport_shuttle',
    details: 'Konforlu ve güvenli bir yolculuk için havalimanı transfer hizmeti.',
  ),
  AirportService(
    name: 'Wi-Fi',
    iconData: 'wifi', 
    details: 'Hızlı ve güvenli Wi-Fi ağı ile internet bağlantınızı kesintisiz kullanın.',
  ),
  AirportService(
    name: 'Tuvalet',
    iconData: 'wc', 
    details: 'Temiz ve hijyenik tuvaletlerle rahat bir mola verin.',
  ),
  AirportService(
    name: 'Eczane',
    iconData: 'local_pharmacy',
    details: 'Acil durumlar için ilaç ve sağlık ürünleri temin edebileceğiniz eczane.',
  ),
  AirportService(
    name: 'Banka/ATM',
    iconData: 'local_atm', 
    details: 'Para çekme ve diğer bankacılık işlemleri için ATM ve banka hizmeti.',
  ),
  AirportService(
    name: 'Kuaför',
    iconData: 'local_hairdresser',
    details: 'Yorgun görünümünüzü yenileyerek uçuşa hazırlanın.',
  ),
];

  IconData getIconDataFromString(String iconName) {
    switch (iconName) {
      case 'restaurant':
        return Icons.restaurant;
      case 'local_cafe':
        return Icons.local_cafe;
      case 'store':
        return Icons.store;
      case 'directions_car':
        return Icons.directions_car;
      case 'airport_shuttle':
        return Icons.airport_shuttle;
      case 'wifi':
        return Icons.wifi;
      case 'wc':
        return Icons.wc;
      case 'local_pharmacy':
        return Icons.local_pharmacy;
      case 'local_atm':
        return Icons.local_atm;
      case 'local_hairdresser':
        return Icons.store;
      default:
        return Icons.error; // Belirtilen ikon bulunamadığında hata ikonu döndürülür
    }
  }

  TextEditingController searchController = TextEditingController();
}
