library uplabs_view;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bloc_sample_project/core/style.dart';
import 'package:bloc_sample_project/feature/uplabs_page/model/userlist_model.dart';
import 'package:bloc_sample_project/feature/uplabs_page/service/userlist_service.dart';
import 'package:bloc_sample_project/feature/uplabs_page/view_model/cubit/uplabsview_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/uplabs_urls.dart';
import '../../../core/strings/uplabsview_strings.dart';
import '../model/popular_title_model.dart';
import '../model/trend_title_model.dart';
part "parts/buildUserList.dart";
part 'parts/build_appbar.dart';
part 'parts/build_dot_widget.dart';
part 'parts/build_popular_list.dart';
part 'parts/build_trend_list.dart';

class UplabsView extends StatelessWidget {
  UplabsView({Key? key}) : super(key: key);

  UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => UplabsviewCubit(),
      child: BlocConsumer<UplabsviewCubit, UplabsviewState>(
        listener: (context, state) {},
        builder: (context, state) {
          var data = context.read<UplabsviewCubit>();
          return Scaffold(
            appBar: _buildAppBar(),
            body: context.read<UplabsviewCubit>().isLoading
                ? Container(
                    color: Colors.black,
                    child: Center(child: CircularProgressIndicator()))
                : Container(
                    padding: EdgeInsets.all(2),
                    color: Colors.black,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          _buildUserList(height, width, data.userList?.data),
                          _buildTitleTrend(),
                          _buildTrendList(height, width, data.trendingList,
                              data.userList?.data),
                          _buildDotWidget(height, width, data.trendingList),
                          _buildPopularTitle(),
                          _buildPopularList(height, width, data.popularList,
                              data.userList?.data),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }

  Align _buildTitleTrend() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "#Trending",
          style: headline6,
        ));
  }

  Align _buildPopularTitle() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "#Popular",
          style: headline6,
        ));
  }
}
