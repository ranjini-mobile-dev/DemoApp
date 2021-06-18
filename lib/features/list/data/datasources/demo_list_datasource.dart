import 'package:cleanarch_bloc_demo_app/features/list/data/models/demo_list_model.dart';

class DemoListDataSource {
  List<DemoListModel> demoLists = [];

  DemoListModel getDemoList(){
    DemoListModel list = DemoListModel(id: 0, title: "");
     for(int i = 0; i< result.length; i++){
      DemoListModel listModel = DemoListModel.fromJson(result[i]);
      demoLists.add(listModel);
      list = listModel;
    }
     return list;
  }
}

List<Map<String, dynamic>> result = [
  {
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
  },
  {
    "userId": 1,
    "id": 2,
    "title": "quis ut nam facilis et officia qui",
    "completed": false
  },
  {
    "userId": 1,
    "id": 3,
    "title": "fugiat veniam minus",
    "completed": false
  },
  {
    "userId": 1,
    "id": 4,
    "title": "et porro tempora",
    "completed": true
  }
];
