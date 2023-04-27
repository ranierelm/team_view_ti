import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:team_view_ti/layers/data/datasources/get_consultants_datasource.dart';
import 'package:team_view_ti/layers/data/dtos/consultants_dto.dart';
import 'package:team_view_ti/layers/data/repositories/get_consultants_repository/get_consultants_repository_imp.dart';

class MockGetConsultantsDatasource extends Mock
    implements IGetConsultantsDataSource {}

void main() {
  final datasource = MockGetConsultantsDatasource();
  final repository = GetConsultantsRepositoryImp(datasource);

  const managementId = 1;

  final tConsultantEntityList = [
    ConsultantsDto(
      id: 1,
      name: 'João',
      email: 'joao@gmail.com',
      specialty: 'Desenvolvimento Web',
      knowleadgeTools: ['React', 'Node.js', 'JavaScript'],
      experience: 5,
    )
  ];

  void runSuccessMock() {
    when(() => datasource.getConsultants(managementId))
        .thenAnswer((_) async => tConsultantEntityList);
  }

  test(
      'when the repository gets called it should also call the GetConsultantsDataSource inside',
      () async {
    runSuccessMock();

    await repository.call(managementId);

    verify(() => datasource.getConsultants(managementId)).called(1);
  });

  test(
      'when the repository gets called it should returns a List of ConsultantEntity',
      () async {
    runSuccessMock();

    final result = await repository.call(managementId);

    expect(result, tConsultantEntityList);
  });
}
