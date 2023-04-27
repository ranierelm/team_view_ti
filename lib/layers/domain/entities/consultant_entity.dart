class ConsultantEntity {
  final int id;
  final String name;
  final String email;
  final String specialty;
  final List<String> knowleadgeTools;
  final int experience;

  ConsultantEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.specialty,
    required this.knowleadgeTools,
    required this.experience,
  });
}
