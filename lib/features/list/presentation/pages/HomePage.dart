import 'package:cleanarch_bloc_demo_app/features/list/data/datasources/demo_list_datasource.dart';
import 'package:cleanarch_bloc_demo_app/features/list/data/models/demo_list_model.dart';
import 'package:cleanarch_bloc_demo_app/features/list/presentation/bloc/demoListBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PreferredSizeWidget appbar(BuildContext context){
    return AppBar(
      centerTitle: true,
      title: Text("Todo List", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),),
    );
  }

  Widget getList(DemoListModel demoListModel, int id, String title){
    return ListView.separated(
      itemCount: result.length,
      itemBuilder: (context, index){
        return Container(
          margin: EdgeInsets.all(6),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            child: Container(
              padding: EdgeInsets.all(16),
              child: ListTile(
                title: Row(
                  children: [
                    Text("ID: ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                    Text(id.toString(), style: TextStyle(color: Colors.red, fontSize: 16),)
                  ],
                ),
                subtitle: Text(title, style: TextStyle(color: Colors.black, fontSize: 16),),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (_, __) => SizedBox(),
    );
  }

  Widget body(BuildContext context, demoListBog){
    return BlocBuilder<DemoListBloc, DemoListState>(
        builder: (context, state){
          if(state is DemoListIsLoading){
            demoListBog.add(FetchDemoList());
            return Center(child: CircularProgressIndicator());
          }
          else if(state is DemoListIsLoaded){
            return getList(state.getListInfo, state.getListInfo.id, state.getListInfo.title);
          }
          else {
            return Center(child: Text("Something went Wrong!!"));
          }
        }
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final demoListBog = BlocProvider.of<DemoListBloc>(context);
    return Scaffold(
      appBar: appbar(context),
      body: body(context, demoListBog),
    );
  }
}

