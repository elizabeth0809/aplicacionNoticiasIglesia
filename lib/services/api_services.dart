import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wordpressiglesia/config.dart';
import 'package:wordpressiglesia/model/category_model.dart';
import 'package:wordpressiglesia/model/newsModel.dart';

class APIService {
  static var client = http.Client();
  static Future<List<CategoryModel>> fetchCategories() async {
    var response = await client.get(Uri.parse(Config.apiURL + Config.category));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return categoryModelFromJson(jsonString);
    } else {
      print(response.body);
      throw Exception('error en datos ${response.statusCode}');
    }
  }

  static Future<List<NewsModel>> fetchPosts(int categoryId) async {
    var response = await client.get(Uri.parse(Config.apiURL + Config.postsURL));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return postsFromJson(jsonString);
    }
  }
}
