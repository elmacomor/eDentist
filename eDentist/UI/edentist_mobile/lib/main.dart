import 'package:edentist_mobile/providers/appointment_provider.dart';
import 'package:edentist_mobile/providers/blogpost_provider.dart';
import 'package:edentist_mobile/providers/cart_provider.dart';
import 'package:edentist_mobile/providers/comment_provider.dart';
import 'package:edentist_mobile/providers/favorites_provider.dart';
import 'package:edentist_mobile/providers/login_provider.dart';
import 'package:edentist_mobile/providers/order_details_provider.dart';
import 'package:edentist_mobile/providers/order_providet.dart';
import 'package:edentist_mobile/providers/product_provider.dart';
import 'package:edentist_mobile/providers/recommendResult_provider.dart';
import 'package:edentist_mobile/providers/transakcijaZaUslugu_provider.dart';
import 'package:edentist_mobile/providers/transakcija_provider.dart';
import 'package:edentist_mobile/providers/user_provider.dart';
import 'package:edentist_mobile/screens/login_screen.dart';
import 'package:edentist_mobile/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyMaterialApp());
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
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => AppointmentsProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => ProductDetailState()),
        ChangeNotifierProvider(create: (_) => LogInProvider()),
        ChangeNotifierProvider(create: (_) => RecommendResultProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => OrderDetailsProvider()),
        ChangeNotifierProvider(create: (_) => BlogPostProvider()),
        ChangeNotifierProvider(create: (_) => TransakcijaProvider()),
        ChangeNotifierProvider(create: (_) => TransakcijaZaUsluguProvider()),
        ChangeNotifierProvider(create: (_) => CommentProvider()),
      ],
      child: MaterialApp(
        title: 'RS II Material app',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: ProductListScreen(),
      ),
    );
  }
}
