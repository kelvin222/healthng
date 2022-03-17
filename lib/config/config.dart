

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Config {
  final String appName = 'Health NG';
  //final String mapAPIKey = 'AIzaSyA-fE7BtlehhXxsO_sWnHpayW**********';
  final String countryName = 'locate health care';
  final String splashIcon = 'assets/images/splash.jpg';
  final String supportEmail = '3nitysoft@gmail.com';
  //final String privacyPolicyUrl = 'https://www.freeprivacypolicy.com/pri************';
  final String ourWebsiteUrl = 'https://www.health.gov.ng/';
  //final String iOSAppId = '000000000';

  //final String specialState1 = 'Sylhet';
  //final String specialState2 = 'Chittagong';

  

  // your country lattidtue & logitude
  final CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(9.0820,8.6753),
    zoom: 10,
  );

  
  //google maps marker icons
  final String hotelIcon = 'assets/images/hotel.png';
  final String restaurantIcon = 'assets/images/restaurant.png';
  final String hotelPinIcon = 'assets/images/hotel_pin.png';
  final String restaurantPinIcon = 'assets/images/restaurant_pin.png';
  final String drivingMarkerIcon = 'assets/images/driving_pin.png';
  final String destinationMarkerIcon = 'assets/images/destination_map_marker.png';

  
  
  //Intro images
  final String introImage1 = 'assets/images/n0.jpg';
  final String introImage2 = 'assets/images/n1.jpg';
  final String introImage3 = 'assets/images/n2.png';

  

  
}