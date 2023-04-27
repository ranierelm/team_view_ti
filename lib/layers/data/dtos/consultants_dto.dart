import 'package:team_view_ti/layers/domain/entities/consultant_entity.dart';

class ConsultantsDto extends ConsultantEntity {
  ConsultantsDto(
      {required super.id,
      required super.name,
      required super.email,
      required super.specialty,
      required super.knowleadgeTools,
      required super.experience});

  factory ConsultantsDto.fromMap(Map<String, dynamic> map) {
    return ConsultantsDto(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      specialty: map['specialty'],
      knowleadgeTools: List<String>.from(map['knowleadgeTools'] as List),
      experience: map['experience'],
    );
  }
}
