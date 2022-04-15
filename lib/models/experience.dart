class Experience {
  int id;
  String title;
  String workPlace;
  String duration;
  String? url;
  List<String> workDone;

  Experience({
    required this.id,
    required this.title,
    required this.workPlace,
    required this.workDone,
    required this.url,
    required this.duration,
  });
}
