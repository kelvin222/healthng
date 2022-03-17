

import 'package:healthng/models/covidtest.dart';
import 'package:healthng/models/health.dart';
import 'package:healthng/models/hospital.dart';

abstract class HRepository{
  Future<List<Health>> getHealthList();
}
abstract class HosRepository{
  Future<List<Hospital>> getHosList();
}
abstract class CovtRepository{
  Future<List<Covidtest>> getCovtList();
}
abstract class EvRepository{
  Future<List<Health>> getEvList();
}