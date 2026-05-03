import 'package:edentist_mobile/models/favorite.dart';
import 'package:edentist_mobile/models/product.dart';
import 'package:edentist_mobile/models/search_result.dart';
import 'package:edentist_mobile/providers/cart_provider.dart';
import 'package:edentist_mobile/providers/favorites_provider.dart';
import 'package:edentist_mobile/providers/product_provider.dart';
import 'package:edentist_mobile/providers/recommendResult_provider.dart';
import 'package:edentist_mobile/providers/user_provider.dart';
import 'package:edentist_mobile/screens/product_details_screen.dart';
import 'package:edentist_mobile/utils/util.dart';
import 'package:edentist_mobile/widgets/master_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late ProductProvider _productProvider;
  late CartProvider _cartProvider;
  late FavoritesProvider _favoritesProvider;
  late UserProvider _korisniciProvider;
  SearchResult<Product>? result;
  SearchResult<Product>? resultRecomm;
  bool isLoading = true;
  TextEditingController _ftsController = TextEditingController();
  TextEditingController _sifraController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();
  List<Product> dataRecomm = [];

  late RecommendResultProvider _recommendResultProvider =
      RecommendResultProvider();

  @override
  void initState() {
    super.initState();
    _fetchProducts();
    _favoritesProvider = Provider.of<FavoritesProvider>(context, listen: false);
    _recommendResultProvider =
        Provider.of<RecommendResultProvider>(context, listen: false);
    _korisniciProvider = Provider.of<UserProvider>(context, listen: false);
  }

  Future<void> _fetchProducts() async {
    try {
      _productProvider = Provider.of<ProductProvider>(context, listen: false);
      _cartProvider = Provider.of<CartProvider>(context, listen: false);
      var data =
          await _productProvider.get(filter: {'FTS': _ftsController.text});

      setState(() {
        result = data;
        isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MasterScreenWidget(
      titleWidget: Text("Products"),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearch(),
            SizedBox(height: 15),
            Text(
              "Svi proizvodi:",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: MediaQuery.of(context).size.height - 400,
              child: SingleChildScrollView(
                child: Column(
                  children: _buildProductCardList(result, false),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Preporuceno za vas:",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 230,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _buildProductCardList(resultRecomm, true),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(labelText: "Product name"),
                controller: _ftsController,
                onChanged: (_) => _fetchProducts(),
              ),
            ),
            SizedBox(width: 8),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildProductCardList(dataX, bool rec) {
    if (rec == true && (result?.result.isEmpty ?? true)) {
      return [Text("Nema preporuka")];
    }
    if (rec == false && (result?.result.isEmpty ?? true)) {
      return [Text("Loading...")];
    }

    List<Widget> list = (dataX?.result ?? [])
        .map((x) => Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(x),
                        ),
                      );
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      child: x.slika == null
                          ? Text("No image")
                          : imageFromBase64String(x.slika!),
                    ),
                  ),
                  Text(x.productName ?? ""),
                  Text("${x.productPrice.toString()} KM"),
                  Row(
                    children: [LoggedIn.isLoggedIn?
                      IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () async {
                          _cartProvider.addToCart(x);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            backgroundColor: Colors.green,
                            duration: Duration(milliseconds: 1000),
                            content: Text("Uspjesno dodano u kosaricu."),
                          ));
                          Product _x = x;

                          int id = _x.productId!;
                          try {
                            var recommendResult =
                                await _recommendResultProvider.get();

                            print(recommendResult.result);
                            var filteredRecommendation = recommendResult.result
                                .where((x) => x.proizvodId == id)
                                .toList();
                            if (filteredRecommendation.isNotEmpty) {
                              var matchingRecommendation =
                                  filteredRecommendation.first;

                              print(recommendResult.result);
                              print(recommendResult.result.length);

                              int prviProizvodID =
                                  matchingRecommendation.prviProizvodId!;
                              print(prviProizvodID);
                              int drugiProizvodID =
                                  matchingRecommendation.drugiProizvodId!;
                              print(drugiProizvodID);
                              int treciProizvodID =
                                  matchingRecommendation.treciProizvodId!;
                              print(treciProizvodID);

                              var prviRecommendedProduct =
                                  await _productProvider
                                      .getById(prviProizvodID);
                              var drugiRecommendedProduct =
                                  await _productProvider
                                      .getById(drugiProizvodID);
                              var treciRecommendedProduct =
                                  await _productProvider
                                      .getById(treciProizvodID);

                              setState(() {
                                resultRecomm = SearchResult<Product>()
                                  ..result = [
                                    prviRecommendedProduct,
                                    drugiRecommendedProduct,
                                    treciRecommendedProduct
                                  ]
                                  ..count = 3;
                              });
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content:
                                    Text("Nema preporuka za dati proizvod."),
                              ));
                            }
                          } on Exception catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Error. Something bad happened."),
                            ));
                          }
                        },
                      ):IconButton(onPressed: (){showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Log In Required'),
        content: Text('Please log in to proceed.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );}, icon: Icon(Icons.shopping_cart)),
                     LoggedIn.isLoggedIn? IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: () async {
                          final isProductFavorite =
                              await _favoritesProvider.exists(x.productId!);

                          print(isProductFavorite.toString());

                          if (!isProductFavorite) {
                            int korisnikId = await getPatientId();
                            Favorite noviFavorit =
                                new Favorite(0, korisnikId, x.productId!);

                            try {
                              await _favoritesProvider.insert(noviFavorit);

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.green,
                                  duration: Duration(milliseconds: 1000),
                                  content: Text(
                                      "Proizvod ${x.productName} uspjesno dodan u favorite."),
                                ),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text("Greska sa dodavanjem u favorite."),
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Proizvod je vec u favoritima."),
                              ),
                            );
                          }
                        },
                      ):IconButton(onPressed: (){showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Log In Required'),
        content: Text('Please log in to proceed.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );}, icon: Icon(Icons.favorite)),
                    ],
                  ),
                ],
              ),
            ))
        .cast<Widget>()
        .toList();
    return list;
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
