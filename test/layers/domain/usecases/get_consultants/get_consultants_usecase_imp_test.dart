import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:team_view_ti/layers/domain/entities/consultant_entity.dart';
import 'package:team_view_ti/layers/domain/repositories/get_consultants_repository.dart';
import 'package:team_view_ti/layers/domain/usecases/get_consultants/get_consultants_usecase_imp.dart';

class MockGetConsultantsRepository extends Mock
    implements IGetConsultantsRepository {}

void main() {
  var repository = MockGetConsultantsRepository();
  var usecase = GetConsultantsUseCase(repository);

  const managementId = 1;

  final tConsultantEntityList = [
    ConsultantEntity(
      id: 1,
      name: 'João',
      email: 'joao@gmail.com',
      specialty: 'Desenvolvimento Web',
      knowleadgeTools: ['React', 'Node.js', 'JavaScript'],
      experience: 5,
    )
  ];

  void runSuccessMock() {
    when(() => repository.call(managementId))
        .thenAnswer((_) async => tConsultantEntityList);
  }

  test('should call the GetConsultantRepository', () async {
    runSuccessMock();

    await usecase.call(managementId);

    verify(() => repository.call(managementId)).called(1);
  });

  test('should return a List of ConsultantEntity', () async {
    const managementId = 1;

    runSuccessMock();

    final result = await usecase.call(managementId);

    expect(result, tConsultantEntityList);
  });
}
