// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthng/config/config.dart';
import 'package:healthng/widgets/covacclist.dart';
import 'package:healthng/widgets/govtest.dart';
import 'package:healthng/widgets/pritest.dart';
import 'package:healthng/widgets/statest.dart';

class Covid extends StatefulWidget {
  @override
  _CovidState createState() => _CovidState();
}

class _CovidState extends State<Covid> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 0)).then((_) {

      //context.read<FeaturedBloc>().getData();
      //context.read<PopularPlacesBloc>().getData();
      //context.read<RecentPlacesBloc>().getData();

    });
  }




  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: Colors.white,
          body: SafeArea(
                      child: RefreshIndicator(
              onRefresh: () async{
                //context.read<FeaturedBloc>().onRefresh();
                //context.read<PopularPlacesBloc>().onRefresh(mounted);
                //context.read<RecentPlacesBloc>().onRefresh(mounted);
              },
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Header(),
                    Covidvacclist(),
                    Privatest(),
                    Govtest(),
                    Statest()
                   // RecommendedPlaces()
                  ],
                ),
              ),
            ),
          )
    );
  }

  @override
  bool get wantKeepAlive => true;
}




class Header extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    Config().appName,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey[800]),
                  ),
                  Text(
                    'locate health care',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.green),
                  )
                ],
              ),
                ],
              ),
          SizedBox(
            height: 5,
          ),
       ],
      ),
    );
  }
}
