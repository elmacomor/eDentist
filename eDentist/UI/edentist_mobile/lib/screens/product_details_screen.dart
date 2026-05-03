import 'package:edentist_mobile/models/favorite.dart';
import 'package:edentist_mobile/models/product.dart';
import 'package:edentist_mobile/providers/cart_provider.dart';
import 'package:edentist_mobile/providers/favorites_provider.dart';
import 'package:edentist_mobile/providers/user_provider.dart';
import 'package:edentist_mobile/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen(this.product, {Key? key}) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late UserProvider _korisniciProvider;
  final TextEditingController _reviewController = TextEditingController();
  late CartProvider _cartProvider;
  late FavoritesProvider _favoritesProvider;

  @override
  void initState() {
    super.initState();
    _korisniciProvider = UserProvider();
    _favoritesProvider = Provider.of<FavoritesProvider>(context, listen: false);
    _cartProvider = Provider.of<CartProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(widget.product.productName ?? "Detalji",
              style: TextStyle(color: Colors.white))),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              child: Center(
                child: widget.product.slika != ""
                    ? imageFromBase64String(widget.product.slika!)
                    : const Text("No Image"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.productName ?? "",
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Cijena: ${"${widget.product.productPrice} KM"}",
                    style: const TextStyle(fontSize: 22),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Šifra proizvoda: ${widget.product.barcode}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Detalji proizvoda:",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.product.productDescription ?? "",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LoggedIn.isLoggedIn ? ElevatedButton(
                        onPressed: () async {
                          final isProductFavorite = await _favoritesProvider
                              .exists(widget.product.productId);

                          if (!isProductFavorite) {
                            int korisnikId = await getPatientId();
                            Favorite noviFavorit = Favorite(
                                0, korisnikId, widget.product.productId!);

                            try {
                              await _favoritesProvider.insert(noviFavorit);

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.green,
                                  duration: Duration(milliseconds: 1000),
                                  content: Text(
                                      "Proizvod: ${widget.product.productName} uspješno dodan u favorite."),
                                ),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      "Greška sa dodavanjem proizvoda, pokušajte ponovo."),
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Proizvod je već u dodan."),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        child: Text("Dodaj u omiljene"),
                      ):Container(),
                      LoggedIn.isLoggedIn? ElevatedButton(
                        onPressed: () {
                          _cartProvider.addToCart(widget.product);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            backgroundColor: Colors.green,
                            duration: Duration(milliseconds: 1000),
                            content: Text("Uspješno dodano u košaricu."),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: Text("Dodaj u košaricu"),
                      ):Container(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<int> getPatientId() async {
    final pacijenti = await _korisniciProvider.get(filter: {
      'tipKorisnika': 'pacijent',
    });

    final pacijent = pacijenti.result
        .firstWhere((korisnik) => korisnik.username == Authorization.username);

    return pacijent.userId!;
  }
}
