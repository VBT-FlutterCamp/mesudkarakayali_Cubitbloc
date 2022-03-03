import 'package:bloc_sample_project/core/strings/homepage_strings.dart';
import 'package:bloc_sample_project/feature/homepage/service/photo_service.dart';
import 'package:bloc_sample_project/feature/homepage/view_model/cubit/homepage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageView extends StatelessWidget {
  HomePageView({Key? key}) : super(key: key);
  PhotoService _photoService = PhotoService();

  @override
  Widget build(BuildContext context) {
    _photoService.getData();
    return BlocProvider(
      create: (context) => HomepageCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){
           context.read<HomepageCubit>().fetchData();
        }),

        appBar: AppBar(title: Text(HomePageString.appbarTitleString)),
        body: SafeArea(
            child: BlocConsumer<HomepageCubit, HomepageState>(
          listener: (context, state) {
          
          },
          builder: (context, state) {
             return state is HomePageLoadingState? Center(child: CircularProgressIndicator(),):
             ListView.builder(
               itemCount: context.watch<HomepageCubit>().homepagelist.length,
               itemBuilder: (context,index){
               return Padding(padding: EdgeInsets.all(8),
               child:  Card(child: ListTile(
                 title: Text(context.watch<HomepageCubit>().homepagelist[index].albumId.toString()),
                 
               
               )),
               );
             });
          },
        )),
      ),
    );
  }
}
