import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pasanaku_app_movil/src/config/enviroment/enviroment.dart';
import 'package:pasanaku_app_movil/src/models/response_api.dart';
import 'package:pasanaku_app_movil/src/models/user.dart';
import "package:http/http.dart" as http;
class UserProvider{


  String _url = Enviroment.API_URL;
  String _api = '/banco';

  BuildContext? context;

  Future? init(BuildContext contex){
    this.context = context;
  }


  Future<ResponseApi?> create(User user) async{
    try {
      Uri url = Uri.http(_url,'$_api');
      print(url);
      //String bodyParams = json.encode(user);
      
      //print('Parametros body: $bodyParams');
      
      Map<String,String> headers = {
        'Conten-type': 'application/json',
      };
      
      print('imprimiifodofdfodofodo');
      //final res = await http.post(url, headers: headers,body: bodyParams);
      final res = await http.get(url);
      print(res.body);
      //final data = jsonDecode(res.body);
      print('paso data');
      //ResponseApi responseApi = ResponseApi.fromJson(data);
    } catch (e) {
      print('errorrrrr: $e');
      return null;
    }

  }

}