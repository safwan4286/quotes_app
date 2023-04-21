import 'package:flutter/material.dart';
import 'package:quotes_app/models/quotes_list_model.dart';
import 'package:quotes_app/screens/display_screen.dart';

class QuotesListWidgwt extends StatelessWidget {
  const QuotesListWidgwt(
      {super.key, required this.quotesList, required this.categoryId});
  final QuotesListModel quotesList;
  final int categoryId;

  List<ProductList>? get itemById {
    return quotesList.productList?.where(
      (element) {
        return element.categoryId == categoryId;
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    final boxHeight = MediaQuery.of(context).size.height;

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: itemById?.length ?? 0,
        itemBuilder: (context, index) {
          final item = itemById?[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DisplayScreen(
                        name: item?.categoryName ?? '',
                        imageUrl: item?.productImage ?? '',
                        title: item?.productTitle ?? ''),
                  ));
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              elevation: 5,
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  height: boxHeight * 0.3,
                  width: double.infinity,
                  child: Image.network(
                    item?.productImage ?? '',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Center(child: Text('Loading...')),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    item?.productTitle ?? '',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
