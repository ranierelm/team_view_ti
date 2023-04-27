import 'package:flutter/foundation.dart';
import 'package:team_view_ti/layers/data/datasources/get_consultants_datasource.dart';
import 'package:team_view_ti/layers/domain/entities/consultant_entity.dart';
import 'package:team_view_ti/layers/domain/repositories/get_consultants_repository.dart';

class GetConsultantsRepositoryImp implements IGetConsultantsRepository {
  final IGetConsultantsDataSource _iGetConsultantsDataSource;

  GetConsultantsRepositoryImp(this._iGetConsultantsDataSource);

  @override
  Future<List<ConsultantEntity>> call(managementId) async {
    try {
      return await _iGetConsultantsDataSource.getConsultants(managementId);
    } catch (e) {
      if (kDebugMode) {
        print('HTTP error: $e');
      }
      throw Exception('HTTP error: $e');
    }
  }
}
