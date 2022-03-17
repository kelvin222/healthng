import 'dart:convert';
import 'package:healthng/models/health.dart';
import 'package:healthng/repository/repository.dart';
import 'package:http/http.dart' as http;

class HealthRepository implements HRepository{
  String dataURL = 'https://floating-lake-60221.herokuapp.com';
  @override
  Future<List<Health>> getHealthList() async{
    List<Health> healthList = [];
    var url = Uri.parse('$dataURL/getallhealth');
    var response = await http.get(url);
    print('status code : ${response.statusCode}');

    var body = json.decode(response.body);
    //parse
    for (var i = 0; i < body.length; i++){
      healthList.add(Health.fromJson(body[i]));
    }
    return healthList;
  }
}