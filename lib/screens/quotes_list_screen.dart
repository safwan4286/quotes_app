import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quotes_app/models/quotes_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:quotes_app/widgets/quotes_list_widget.dart';

import '../models/message_snackbar.dart';

class QuotseListScreen extends StatefulWidget {
  const QuotseListScreen({
    required this.title,
    required this.categoryId,
    super.key,
  });
  static const routeName = '/quotes_screen';
  final int categoryId;
  final String title;
  @override
  State<QuotseListScreen> createState() => _QuotseListScreenState();
}

class _QuotseListScreenState extends State<QuotseListScreen> {
  QuotesListModel _quotesList = QuotesListModel();

  @override
  void initState() {
    super.initState();
    _quotesListApi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        body: ListView(shrinkWrap: true, children: [
          QuotesListWidgwt(
              quotesList: _quotesList, categoryId: widget.categoryId),
        ]),
      ),
    );
  }

  void _quotesListApi() async {
    final uri = Uri.parse(
        'https://akashsir.in/myapi/at-quotes/api/api-list-product.php');
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    int flag = int.parse(json['flag']);

    if (response.statusCode == 200 && flag == 1) {
      setState(() {
        _quotesList = QuotesListModel.fromJson(json);
      });
    } else {
      MessageSnackBar.errorMessage(json['message'], context);
    }
  }
}
