import 'dart:convert';
import 'package:healthng/models/hospital.dart';
import 'package:healthng/repository/repository.dart';
import 'package:http/http.dart' as http;

class SpearRepository implements HosRepository{
  String dataURL = 'https://floating-lake-60221.herokuapp.com';
  @override
  Future<List<Hospital>> getHosList() async{
    List<Hospital> hospitalList = [];
    var url = Uri.parse('$dataURL/getspechos');
    var data = {
       "spec": "Ear"
    };
    http.Response response = await http.post(url,headers: {"Content-Type": "application/json; charset=utf-8"}, body: json.encode(data));
    print('status code : ${response.statusCode}');

    var body = json.decode(response.body);
    //parse
    for (var i = 0; i < body.length; i++){
      hospitalList.add(Hospital.fromJson(body[i]));
    }
    return hospitalList;
  }
}