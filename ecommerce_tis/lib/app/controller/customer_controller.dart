import 'dart:convert';

import 'package:ecommerce_tis/app/model/customer_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../core/service/api.dart';
import '../../core/service/urls.dart';

class CustomerController extends GetxController{

 
  TextEditingController searchController = TextEditingController();
   
  RxList<Customer> customerList=<Customer>[].obs;


   getCustomer({required String query}) async {

     final response = await http.get(Uri.parse('${baseUrl}/customers'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to load products');
    }
   
    

    
    
  }



  @override
  void onInit() async {
    super.onInit();

   customerList.value=   await getCustomer(query: "");
    
    
  }


  
}