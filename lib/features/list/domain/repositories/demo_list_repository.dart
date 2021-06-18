import 'package:cleanarch_bloc_demo_app/features/list/domain/entities/list.dart';

abstract class DemoListRepository {
  Future<DemoList> getDemoList();
}
