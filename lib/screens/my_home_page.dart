import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quotes_app/models/category_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:quotes_app/models/message_snackbar.dart';
import 'package:quotes_app/widgets/category_list_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CategoryListModel _categoryList = CategoryListModel();

  @override
  void initState() {
    _categoryListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Text(
            _categoryList.message ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        body: ListView(children: [
          CategoryListWidget(categoryList: _categoryList),
        ]),
      ),
    );
  }

  void _categoryListApi() async {
    final uri = Uri.parse(
        'https://akashsir.in/myapi/at-quotes/api/api-list-category.php');
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    int flag = int.parse(json['flag']);

    if (response.statusCode == 200 && flag == 1) {
      setState(() {
        _categoryList = CategoryListModel.fromJson(json);
      });
    } else {
      MessageSnackBar.errorMessage(json['message'], context);
    }
  }
}
