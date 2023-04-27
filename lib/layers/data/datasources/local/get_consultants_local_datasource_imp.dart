import 'package:team_view_ti/core/http/http_client.dart';
import 'package:team_view_ti/layers/data/datasources/entpoints/get_consultants_endpoint.dart';
import 'package:team_view_ti/layers/data/datasources/get_consultants_datasource.dart';
import 'package:team_view_ti/layers/data/dtos/consultants_dto.dart';
import 'package:team_view_ti/layers/data/mock/list_consultants_mock_api.dart';

class GetConsultantsLocalDataSourceImp implements IGetConsultantsDataSource {
  final IHttpClient httpClient;

  GetConsultantsLocalDataSourceImp(this.httpClient);

  @override
  Future<List<ConsultantsDto>> getConsultants(int managementId) async {
    final response =
        await httpClient.get(GetConsultantEndPoint.url(managementId));

    if (response.statusCode == 200) {
      List<ConsultantsDto> listConsultants = [];

      consultantsListMock.map((consultant) {
        listConsultants.add(ConsultantsDto.fromMap(consultant));
      }).toList();

      return listConsultants;
    }
    throw Exception();
  }
}
