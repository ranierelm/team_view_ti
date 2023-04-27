import 'package:team_view_ti/layers/data/dtos/consultants_dto.dart';

abstract class IGetConsultantsDataSource {
  Future<List<ConsultantsDto>> getConsultants(int managementId);
}
