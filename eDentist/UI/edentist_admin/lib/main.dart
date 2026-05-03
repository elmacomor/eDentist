import 'package:eprodaja_admin/providers/appointments_provider.dart';
import 'package:eprodaja_admin/providers/blog_post_provider.dart';
import 'package:eprodaja_admin/providers/city_provider.dart';
import 'package:eprodaja_admin/providers/color_prvider.dart';
import 'package:eprodaja_admin/providers/dentalService_provider.dart';
import 'package:eprodaja_admin/providers/login_provider.dart';
import 'package:eprodaja_admin/providers/medical_card_provider.dart';
import 'package:eprodaja_admin/providers/order_details_provider.dart';
import 'package:eprodaja_admin/providers/orders_provider.dart';
import 'package:eprodaja_admin/providers/product_provider.dart';
import 'package:eprodaja_admin/providers/product_type_provider.dart';
import 'package:eprodaja_admin/providers/recommendResult_provider.dart';
import 'package:eprodaja_admin/providers/transakcijaZaUslugu_provider.dart';
import 'package:eprodaja_admin/providers/transakcije_provider.dart';
import 'package:eprodaja_admin/providers/user_provider.dart';
import 'package:eprodaja_admin/screens/dental_service_page.dart';
import 'package:eprodaja_admin/screens/signup_page.dart';

import './screens/termini_page.dart';
import 'package:flutter/material.dart';
import './screens/login_page.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Europe/Belgrade'));
  runApp(MyMaterialApp());
}

class OrderDetailsState extends ChangeNotifier {
  Map<String, dynamic>? _orderDetails;

  Map<String, dynamic>? get orderDetails => _orderDetails;

  void updateOrderDetails(Map<String, dynamic> newOrderDetails) {
    _orderDetails = Map<String, dynamic>.from(newOrderDetails);
    notifyListeners();
  }
}

class ProductDetailState extends ChangeNotifier {
  Map<String, dynamic>? _productDetails;

  Map<String, dynamic>? get productDetails => _productDetails;

  void updateProductDetails(Map<String, dynamic> newProductDetails) {
    _productDetails = Map<String, dynamic>.from(newProductDetails);
    notifyListeners();
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LogInProvider()),
        ChangeNotifierProvider(create: (_) => DentalServiceProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => AppointmentsProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ColorProvider()),
        ChangeNotifierProvider(create: (_) => ProductTypeProvider()),
        ChangeNotifierProvider(create: (_) => ProductDetailState()),
        ChangeNotifierProvider(create: (_) => BlogPostProvider()),
        ChangeNotifierProvider(create: (_) => OrderDetailsProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => OrderDetailsState()),
        ChangeNotifierProvider(create: (_) => TransactionsProvider()),
        ChangeNotifierProvider(create: (_) => CityProvider()),
        ChangeNotifierProvider(create: (_) => RecommendResultProvider()),
        ChangeNotifierProvider(create: (_) => TransakcijaZaUsluguProvider()),
        ChangeNotifierProvider(create: (_) => MedicalCardProvider()),


      ],
      child: MaterialApp(
        title: 'RS II Material app',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: LoginPage(),
      ),
    );
  }
}
