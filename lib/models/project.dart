class Project {
  final String name;
  final String startDate;
  final String endDate;
  final dynamic associated;
  final bool isEducationRelated;
  final String url;
  final String description;

  Project(
      {required this.name,
      required this.startDate,
      this.endDate = "Present",
      this.isEducationRelated = false,
      this.associated,
      required this.url,
      required this.description});
}
