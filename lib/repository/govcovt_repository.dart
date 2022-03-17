import 'dart:convert';
import 'package:healthng/models/covidtest.dart';
import 'package:healthng/models/hospital.dart';
import 'package:healthng/repository/repository.dart';
import 'package:http/http.dart' as http;

class GovCovidtRepository implements CovtRepository{
  String dataURL = 'https://floating-lake-60221.herokuapp.com';
  @override
  Future<List<Covidtest>> getCovtList() async{
    List<Covidtest> covtList = [];
    var url = Uri.parse('$dataURL/gettypetest');
    var data = {
       "htype": "Federal"
    };
    http.Response response = await http.post(url,headers: {"Content-Type": "application/json; charset=utf-8"}, body: json.encode(data));
    print('status code : ${response.statusCode}');

    var body = json.decode(response.body);
    //parse
    for (var i = 0; i < body.length; i++){
      covtList.add(Covidtest.fromJson(body[i]));
    }
    return covtList;
  }
}