class DemoListModel {
  final int id;
  final String title;

  const DemoListModel({required this.id, required this.title});

  factory DemoListModel.fromJson(Map<String, dynamic> json) {
    DemoListModel demoListModel =
        DemoListModel(id: json['id'], title: json['title']);
    return demoListModel;
  }
}
