import 'package:team_view_ti/layers/domain/entities/consultant_entity.dart';

abstract class IGetConsultantsRepository {
  Future<List<ConsultantEntity>> call(int managementId);
}
