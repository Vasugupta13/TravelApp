import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_cubit/model/data_model.dart';
import 'package:http/http.dart' as http;

class DataServices{
    String baseUrl = 'http://mark.bslmeiyu.com/api';
 Future<List<DataModel>> getInfo() async {
    var apiUrl = '/getplaces';
    http.Response res = await http.get(Uri.parse(baseUrl+apiUrl));
    try{
      if(res.statusCode==200){
        List<dynamic> list = json.decode(res.body);
        if (kDebugMode) {
          print(list);
        }
        return list.map((e) => DataModel.fromJson(e)).toList();
      }else{
        return <DataModel>[];
      }
    }catch(e){
      if (kDebugMode) {
        print(e);
      }
      return <DataModel>[];
    }
  }
}