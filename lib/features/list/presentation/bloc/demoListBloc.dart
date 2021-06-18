import 'package:cleanarch_bloc_demo_app/features/list/data/datasources/demo_list_datasource.dart';
import 'package:cleanarch_bloc_demo_app/features/list/data/models/demo_list_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DemoListEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class FetchDemoList extends DemoListEvent{
  @override
  List<Object> get props => [];
}

class DemoListState extends Equatable{
  @override
  List<Object> get props => [];
}

class DemoListIsLoading extends DemoListState {

}

class DemoListIsLoaded extends DemoListState {
  final demoList;

  DemoListIsLoaded(this.demoList);

  DemoListModel get getListInfo => demoList;

  @override
  List<Object> get props => [demoList];
}

class DemoListIsNotLoaded extends DemoListState {

}

class DemoListBloc extends Bloc<DemoListEvent, DemoListState>{

  DemoListDataSource demoListDataSource;

  DemoListBloc(DemoListState initialState, this.demoListDataSource) : super(DemoListIsLoading());

  @override
  Stream<DemoListState> mapEventToState(DemoListEvent event) async* {
    if(event is FetchDemoList){
      yield DemoListIsLoading();

      try{
        DemoListModel demoList = await demoListDataSource.getDemoList();
        yield DemoListIsLoaded(demoList);
      }
      catch(_){
        yield DemoListIsNotLoaded();
      }
    }
  }
  
}