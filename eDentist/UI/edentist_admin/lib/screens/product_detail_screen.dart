import 'dart:convert';
import 'dart:io';

import 'package:eprodaja_admin/main.dart';
import 'package:eprodaja_admin/models/product.dart';
import 'package:eprodaja_admin/models/product_type.dart';
import 'package:eprodaja_admin/models/search_result.dart';
import 'package:eprodaja_admin/providers/product_provider.dart';
import 'package:eprodaja_admin/providers/product_type_provider.dart';
import 'package:eprodaja_admin/screens/products_page.dart';
import 'package:eprodaja_admin/widgets/master_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  Product? product;
  ProductDetailScreen({super.key, this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  Map<String, dynamic> _initialValue = {};
  late ProductTypeProvider _vrsteProizvodaProvider;
  late ProductProvider _productProvider;

  SearchResult<ProductType>? VrsteProizvodaResult;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initialValue = {
      'barcode': widget.product?.barcode,
      'productName': widget.product?.productName,
      'productPrice': widget.product?.productPrice.toString(),
      'productDescription': widget.product?.productDescription.toString(),
      'productTypeId': widget.product?.productTypeId.toString(),
    };

    _vrsteProizvodaProvider = context.read<ProductTypeProvider>();
    _productProvider = context.read<ProductProvider>();

    initForm();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future initForm() async {
    VrsteProizvodaResult = await _vrsteProizvodaProvider.get();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var productDetailState =
        Provider.of<ProductDetailState>(context, listen: false);

    return MasterScreenWidget(
      child: Column(children: [
        isLoading ? Container() : _buildForm(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () async {
                    final isNameValid = _formKey
                        .currentState!.fields['productName']
                        ?.validate();
                    final isCodeValid =
                        _formKey.currentState!.fields['barcode']?.validate();
                    final isPriceValid = _formKey
                        .currentState!.fields['productPrice']
                        ?.validate();
                    final isTypeValid = _formKey
                        .currentState!.fields['productTypeId']
                        ?.validate();
                    final isDescriptionValid = _formKey
                        .currentState!.fields['productDescription']
                        ?.validate();

                    if (isNameValid == null ||
                        !isNameValid ||
                        isCodeValid == null ||
                        !isCodeValid ||
                        isPriceValid == null ||
                        !isPriceValid ||
                        isTypeValid == null ||
                        !isTypeValid ||
                        isDescriptionValid == null ||
                        !isDescriptionValid) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Molimo popunite sva obavezna polja prije spasavanja.'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    if (_base64Image == null || _base64Image!.isEmpty) {
                      _base64Image = base64Encode(
                          File('assets/images/no-image.jpg').readAsBytesSync());
                    }
                    _formKey.currentState?.saveAndValidate();

                    print(_formKey.currentState?.value);

                    var request = new Map.from(_formKey.currentState!.value);
                    request['slika'] = _base64Image;

                    try {
                      if (widget.product == null) {
                        await _productProvider.insert(request);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Proizvod je uspjesno dodan.'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        _formKey.currentState?.reset();
                        Navigator.of(context).pop();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => ProductsPage(),
                          ),
                        );
                      } else {
                        print(request);
                        await _productProvider.update(
                            widget.product!.productId!, request);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Proizvod je uspjesno uređen.'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.of(context).pop();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => ProductsPage(),
                          ),
                        );
                      }
                    } on Exception catch (e) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                title: Text("Error"),
                                content: Text(e.toString()),
                                actions: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text("OK"))
                                ],
                              ));
                    }
                  },
                  child: Text("Save")),
            )
          ],
        )
      ]),
      title: this.widget.product?.productName ?? "Product details",
    );
  }

  FormBuilder _buildForm() {
    return FormBuilder(
        key: _formKey,
        initialValue: _initialValue,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    decoration: InputDecoration(labelText: "Product code"),
                    name: 'barcode',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Kod je obavezan';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: FormBuilderTextField(
                    decoration: InputDecoration(labelText: "Product name"),
                    name: 'productName',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Naziv proizvoda je obavezan';
                      }
                      return null;
                    },
                  ),
                ),
                Expanded(
                  child: FormBuilderTextField(
                    decoration: InputDecoration(labelText: "Detalji"),
                    name: 'productDescription',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Opis proizvoda je obavezan';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: FormBuilderDropdown<String>(
                    name: 'productTypeId',
                    decoration: InputDecoration(
                      labelText: 'Product Type',
                      suffix: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          _formKey.currentState!.fields['vrstaId']?.reset();
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tip proizvoda je obavezan';
                      }
                      return null;
                    },
                    items: VrsteProizvodaResult?.result
                            .map((item) => DropdownMenuItem(
                                  alignment: AlignmentDirectional.center,
                                  value: item.typeId.toString(),
                                  child: Text(item.typeName ?? ""),
                                ))
                            .toList() ??
                        [],
                  ),
                ),
                Expanded(
                    child: FormBuilderTextField(
                  decoration: InputDecoration(labelText: "Price"),
                  name: 'productPrice',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Cijena je obavezna";
                    }
                    final price = int.tryParse(value);
                    if (price == null) {
                      return "Cijena treba biti cijeli broj";
                    }
                    if (price < 1 || price > 10000) {
                      return "Cijena treba biti izmedju 1 i 10 000";
                    }
                    return null;
                  },
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: FormBuilderField(
                  name: 'slika',
                  builder: ((field) {
                    return InputDecorator(
                      decoration: InputDecoration(
                          label: Text('Select image'),
                          errorText: field.errorText),
                      child: ListTile(
                        leading: Icon(Icons.photo),
                        title: Text('Select image here'),
                        trailing: Icon(Icons.file_upload),
                        onTap: getImage,
                      ),
                    );
                  }),
                ))
              ],
            )
          ],
        ));
  }

  File? _image;
  String? _base64Image;

  Future getImage() async {
    var result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null && result.files.single.path != null) {
      _image = File(result.files.single.path!);
      _base64Image = base64Encode(_image!.readAsBytesSync());
    } else {
      _base64Image =
          base64Encode(File('assets/no-image.jpg').readAsBytesSync());
    }
  }
}
