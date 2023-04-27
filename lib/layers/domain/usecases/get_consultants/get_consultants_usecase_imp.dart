import 'package:team_view_ti/layers/domain/entities/consultant_entity.dart';
import 'package:team_view_ti/layers/domain/repositories/get_consultants_repository.dart';
import 'package:team_view_ti/layers/domain/usecases/get_consultants/get_consultants_usecase.dart';

class GetConsultantsUseCase implements IGetConsultantsUseCase {
  final IGetConsultantsRepository _getConsultantsRepository;

  GetConsultantsUseCase(this._getConsultantsRepository);

  @override
  Future<List<ConsultantEntity>> call(int managementId) async {
    return await _getConsultantsRepository.call(managementId);
  }
}
