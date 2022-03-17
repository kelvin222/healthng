
import 'package:healthng/models/hospital.dart';
import 'package:healthng/repository/repository.dart';

class HospitalController {
  final HosRepository _hrepository;
  
  HospitalController(this._hrepository);

  Future<List<Hospital>> fetchHosList() async{
    return _hrepository.getHosList();
  }
}