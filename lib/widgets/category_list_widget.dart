import 'package:flutter/material.dart';
import 'package:quotes_app/models/category_list_model.dart';
import 'package:quotes_app/screens/quotes_list_screen.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key, required this.categoryList});
  final CategoryListModel categoryList;

  @override
  Widget build(BuildContext context) {
    final boxHeight = MediaQuery.of(context).size.height;
    final boxWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: categoryList.categoryList?.length ?? 0,
        itemBuilder: (context, index) {
          final item = categoryList.categoryList?[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuotseListScreen(
                        title: item?.categoryName ?? '',
                        categoryId: item?.categoryId ?? 0),
                  ));
            },
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              elevation: 5,
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 20),
                height: boxHeight * 0.11,
                color: Colors.amber.shade100,
                width: double.infinity,
                child: ListTile(
                  leading: Container(
                    width: boxWidth * 0.25,
                    child: Image.network(
                      item?.categoryImage ?? '',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Text('Loading...'),
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      item?.categoryName ?? '',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
