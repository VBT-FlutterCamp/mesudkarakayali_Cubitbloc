import 'dart:ffi';

import 'package:bloc_sample_project/core/strings/homepage_strings.dart';
import 'package:bloc_sample_project/feature/homepage/service/photo_service.dart';
import 'package:bloc_sample_project/feature/homepage/view_model/cubit/homepage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/photo_model.dart';

class HomePageView extends StatelessWidget {
  HomePageView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomepageCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text(HomePageString.appbarTitleString)),
        body: SafeArea(
            child: BlocConsumer<HomepageCubit, HomepageState>(
          listener: (context, state) {
           
          },
          builder: (context, state) {
            if (state is HomepageInitial) {
              return _buildInitial(context);
            } else if (state is HomePageLoadingState) {
              return _buildLoading();
            } else if (state is HomePageCompleted) {
              return _buildCompleted(state);
            } else {
              final error = state as HomePageError;
              return Text("aaaaaaaaaaaaa"+error.toString());
            }
          },
        )),
      ),
    );
  }

  ListView _buildCompleted(HomePageCompleted state) {
    return ListView.builder(
        itemCount: state.list.length,
        itemBuilder: (context, index) {
          print(state.list.length);
          PhotoModel satirVeri =state.list[index];
          return Padding(
            padding: EdgeInsets.all(8),
            child: Card(
                child: ListTile(
                  leading: Image.network(satirVeri.thumbnailUrl.toString()),
              title: Text(satirVeri.title.toString()),
              trailing: Text(satirVeri.albumId.toString()),
            )),
          );
        });
  }

  Center _buildInitial(BuildContext context) => Center(
        child: FloatingActionButton(
            onPressed: () async =>
                await context.read<HomepageCubit>().fetchData()),
      );

  Center _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
