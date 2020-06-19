import 'package:crud_flutter/models/product.dart';
import 'package:crud_flutter/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, Object> _formData = {};

  void _loadFormData(Product product) {
    if (product != null) {
      _formData['id'] = product.id;
      _formData['name'] = product.name;
      _formData['price'] = product.price;
      _formData['shelfLife'] = product.shelfLife;
      _formData['imageUrl'] = product.imageUrl;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Product product = ModalRoute.of(context).settings.arguments;
    _loadFormData(product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Produtos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();

              if (isValid) {
                _form.currentState.save();
                Provider.of<ProductsProvider>(context, listen: false).put(
                  Product(
                    id: _formData['id'],
                    name: _formData['name'],
                    price: _formData['price'],
                    shelfLife: _formData['shelfLife'],
                    imageUrl: _formData['imageUrl'],
                  ),
                );
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: _formData['name'],
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nome inválido';
                    }
                  },
                  onSaved: (value) => _formData['name'] = value,
                ),
                TextFormField(
                  initialValue: _formData['price'] == null
                      ? _formData['price']
                      : _formData['price'].toString(),
                  decoration: InputDecoration(labelText: 'Preço'),
                  onSaved: (value) => _formData['price'] = double.parse(value),
                ),
                TextFormField(
                  initialValue: _formData['shelfLife'],
                  decoration: InputDecoration(labelText: 'Data de validade'),
                  onSaved: (value) => _formData['shelfLife'] = value,
                ),
                TextFormField(
                  initialValue: _formData['imageUrl'],
                  decoration: InputDecoration(labelText: 'URL da imagem'),
                  onSaved: (value) => _formData['imageUrl'] = value,
                ),
              ],
            ),
          )),
    );
  }
}
