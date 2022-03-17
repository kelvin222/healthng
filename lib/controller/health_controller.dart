
import 'package:healthng/models/health.dart';
import 'package:healthng/repository/repository.dart';

class HealthController {
  final HRepository _repository;

  HealthController(this._repository);

  Future<List<Health>> fetchHealthList() async{
    return _repository.getHealthList();
  }
}