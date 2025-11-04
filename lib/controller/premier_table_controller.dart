import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project_1/models/table_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PremierTableController extends GetxController{

  var isLoading = false.obs;
  var standings = <TeamStanding>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPremiereLeague();
  }
  
  Future<void> fetchPremiereLeague() async{
    const url = "https://www.thesportsdb.com/api/v1/json/3/lookuptable.php?l=4328&s=2025-2026";
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(url));
      print("status code: " + response.statusCode.toString());
      print("json result: " + response.body.toString());

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List standingdata = data['table'];
        standings.assignAll(standingdata.map((e) => TeamStanding.fromJson(e)).toList());
      } else {
        Get.snackbar("failed", "you smell like you farted", backgroundColor: Colors.redAccent, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("error", e.toString(), backgroundColor: Colors.redAccent, colorText: Colors.white);
    }
    isLoading.value = false;
  }
}