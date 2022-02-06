class Enterprise {
  final String name;
  final String imageURL;
  final String post;
  final String location;
  final ContractType contract;
  final String description;
  final String duration;
  final String startTime;
  final String endTime;

  Enterprise(
      {required this.name,
      required this.imageURL,
      required this.post,
      this.location = "Morocco",
      this.description = "",
      this.contract = ContractType.entern,
      required this.startTime,
      this.duration = "",
      this.endTime = 'Present'});
}

enum ContractType {
  freelance,
  entern,
  fulltime,
  parttime,
  independant,
  contract,
}

extension ContractExtention on ContractType {
  String getName() {
    switch (this) {
      case ContractType.entern:
        return "Enternship";
      case ContractType.contract:
        return "Contract";
      case ContractType.freelance:
        return "Freelance";
      case ContractType.fulltime:
        return "Full-time";
      case ContractType.parttime:
        return "Part-time";
      case ContractType.independant:
        return "Self-employed";

      default:
        return "";
    }
  }
}
