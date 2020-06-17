import 'package:crud_flutter/models/product.dart';
import 'package:crud_flutter/provider/products_provider.dart';
import 'package:crud_flutter/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    final image = product.imageUrl == null || product.imageUrl.isEmpty
        ? Container(
            child: Icon(Icons.camera_alt),
            height: 50,
            width: 50,
            color: Colors.grey[300],
          )
        : Container(
            child: Image.network(product.imageUrl),
            height: 50,
            width: 50,
            padding: EdgeInsets.all(5),
            color: Colors.grey[300],
          );
    return ListTile(
      leading: image,
      title: Text(product.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('R\$ ${product.price.toStringAsFixed(2)}'),
          Text('Validade: ${product.shelfLife}'),
        ],
      ),
      trailing: Container(
        width: 100,
        child: Row(children: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.PRODUCT_FORM,
                arguments: product,
              );
            },
            color: Colors.blue[600],
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Excluir Produto'),
                  content: Text('Tem certeza?'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Não'),
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                    FlatButton(
                      child: Text('Sim'),
                      onPressed: () => Navigator.of(context).pop(true),
                    ),
                  ],
                ),
              ).then((confirmed) {
                if (confirmed) {
                  Provider.of<ProductsProvider>(context, listen: false)
                      .remove(product);
                }
              });
            },
            color: Colors.red[600],
          ),
        ]),
      ),
    );
  }
}
