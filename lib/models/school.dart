class School {
  final String name;
  final String field;
  final String location;
  final String description;
  final String duration;
  final String startTime;
  final String graduation;

  School(
      {required this.name,
      required this.field,
      this.location = "Morocco",
      this.description = "",
      required this.startTime,
      this.duration = "",
      this.graduation = 'Present'});
}
