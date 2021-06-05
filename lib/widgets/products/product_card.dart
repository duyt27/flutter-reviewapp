import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'price_tag.dart';
import 'package:project_app/widgets/ui_elements/title_default.dart';
import 'address_tag.dart';
import 'package:project_app/models/product.dart';
import 'package:project_app/scoped-model/main.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  Widget _buildTitlePriceRow() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitleDefault(product.title),
          SizedBox(
            width: 8.0,
          ),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed<bool>(
              context, '/product/' + model.allProducts[productIndex].id),
          child: FadeInImage(
            image: NetworkImage(product.image),
            height: 300.0,
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/placeholder.jpg'),
          ),
        );
      },
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ButtonBar(alignment: MainAxisAlignment.center, children: [
          IconButton(
            icon: Icon(Icons.info),
            color: Theme.of(context).accentColor,
            onPressed: () => Navigator.pushNamed<bool>(
                context, '/product/' + model.allProducts[productIndex].id),
          ),
          IconButton(
            icon: Icon(model.allProducts[productIndex].isFavorite
                ? Icons.favorite
                : Icons.favorite_border),
            color: Colors.deepPurple,
            onPressed: () {
              model.selectProduct(model.allProducts[productIndex].id);
              model.toggleProductFavoriteStatus();
            },
          ),
        ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          _buildImage(context),
          _buildTitlePriceRow(),
          AddressTag('United States'),
          Text('Tác giả: '+ product.userEmail),
          _buildActionButtons(context),
        ],
      ),
    );
  }
}
