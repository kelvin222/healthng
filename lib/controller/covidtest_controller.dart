
import 'package:healthng/models/covidtest.dart';
import 'package:healthng/repository/repository.dart';

class CovidtestController {
  final CovtRepository _covtrepository;
  
  CovidtestController(this._covtrepository);

  Future<List<Covidtest>> fetchCovtList() async{
    return _covtrepository.getCovtList();
  }
}