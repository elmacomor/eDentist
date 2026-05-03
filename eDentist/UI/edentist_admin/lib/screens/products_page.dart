import 'dart:async';
import 'package:eprodaja_admin/models/product.dart';
import 'package:eprodaja_admin/models/search_result.dart';
import 'package:eprodaja_admin/providers/product_provider.dart';
import 'package:eprodaja_admin/providers/recommendResult_provider.dart';
import 'package:eprodaja_admin/screens/product_detail_screen.dart';
import 'package:eprodaja_admin/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductsPage> {
  late ProductProvider _productProvider;
  late RecommendResultProvider _recommendResultProvider;
  SearchResult<Product>? result;
  bool isLoading = true;
  String searchText = "";
  late bool isSortAscending;

  @override
  void initState() {
    super.initState();
    _productProvider = Provider.of<ProductProvider>(context, listen: false);
    _recommendResultProvider =
        Provider.of<RecommendResultProvider>(context, listen: false);
    _fetchProducts();
    isSortAscending = true;
  }

  Future<void> _fetchProducts() async {
    try {
      var data = await _productProvider.get();

      setState(() {
        result = data;

        result?.result.sort((a, b) {
          if (isSortAscending) {
            return a.productPrice!.compareTo(b.productPrice!);
          } else {
            return b.productPrice!.compareTo(a.productPrice!);
          }
        });

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Proizvodi', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 16),
          _buildSearchInput(),
          _buildSortDropdown(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () async {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      "Molimo ne izlazite sa stranice dok se ne izvrsi treniranje modela"),
                  duration: Duration(seconds: 5),
                ),
              );

              try {
                await _recommendResultProvider.trainData();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Model je uspješno treniran."),
                    duration: Duration(seconds: 3),
                  ),
                );
              } catch (e) {
                String errorMessage =
                    'Došlo je do pogreške prilikom treniranja modela.';

                if (e is Exception && e.toString().isNotEmpty) {
                  final regex = RegExp(r'status code: (.+)$');
                  final match = regex.firstMatch(e.toString());

                  if (match != null) {
                    errorMessage = match.group(1)!;
                  }
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(errorMessage),
                    duration: Duration(seconds: 3),
                  ),
                );
              }
            },
            child: Text(
              "Train Data",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: _buildProductList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(
                product: null,
              ),
            ),
          );
          _fetchProducts();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildSearchInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FormBuilderTextField(
        name: 'search',
        decoration: InputDecoration(
          labelText: 'Search by product name',
        ),
        onChanged: (value) {
          setState(() {
            searchText = value ?? "";
          });
        },
      ),
    );
  }

  Widget _buildSortDropdown() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<bool>(
        value: isSortAscending,
        onChanged: (value) {
          setState(() {
            isSortAscending = value!;
            _fetchProducts(); // Refresh products when changing sorting order
          });
        },
        items: [
          DropdownMenuItem<bool>(
            value: true,
            child: Text('Sortiraj rastuce'),
          ),
          DropdownMenuItem<bool>(
            value: false,
            child: Text('Sortiraj opadajuce'),
          ),
        ],
        hint: Text('Select Sorting Order'),
      ),
    );
  }

  Widget _buildProductList() {
    if (result?.result == null) {
      return Center(
        child: Text('Nema proizvoda.'),
      );
    }

    // Filter products based on the search text
    List<Product> filteredProducts = result?.result
            ?.where((product) =>
                product.productName
                    ?.toLowerCase()
                    .contains(searchText.toLowerCase()) ==
                true)
            .toList() ??
        [];

    return ListView.builder(
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        Product product = filteredProducts[index];

        return Card(
          margin: EdgeInsets.all(8),
          child: ListTile(
            title: Text(product.productName ?? ""),
            subtitle: Text(
                'Sifra: ${product.barcode} - Cijena: ${product.productPrice}'),
            leading: product.slika != ""
                ? Container(
                    width: 60,
                    height: 60,
                    child: imageFromBase64String(product.slika!),
                  )
                : Icon(Icons.image),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _showDeleteConfirmationDialog(product);
              },
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    product: product,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(Product product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Potvrda brisanja'),
          content: Text('Jeste li sigurni da zelite obrisati?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await _deleteProduct(product);
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteProduct(Product product) async {
    try {
      await _productProvider.delete(product.productId);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Product deleted successfully.'),
          duration: Duration(seconds: 2),
        ),
      );
      _fetchProducts();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to delete product.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
