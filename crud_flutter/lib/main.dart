import 'package:crud_flutter/provider/products_provider.dart';
import 'package:crud_flutter/routes/app_routes.dart';
import 'package:crud_flutter/views/product_form.dart';
import 'package:crud_flutter/views/product_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ProductsProvider(),
      child: MaterialApp(
        title: 'CRUD demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routes: {
          AppRoutes.HOME: (_) => ProductList(),
          AppRoutes.PRODUCT_FORM: (_) => ProductForm(),
        },
      ),
    );
  }
}
