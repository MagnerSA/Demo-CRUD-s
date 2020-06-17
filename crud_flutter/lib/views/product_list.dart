import 'package:crud_flutter/models/product.dart';
import 'package:crud_flutter/provider/products_provider.dart';
import 'package:crud_flutter/routes/app_routes.dart';
import 'package:crud_flutter/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductsProvider products = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.PRODUCT_FORM
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.count,
        itemBuilder: (ctx, i) => ProductTile(products.byIndex(i)),
        ),
    );
  }
}