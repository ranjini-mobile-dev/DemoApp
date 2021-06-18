import 'package:equatable/equatable.dart';

class DemoList extends Equatable {
  final String title;
  final int id;

  DemoList({
    required this.title,
    required this.id,
  });

  @override
  List<Object?> get props => [title, id];
}
