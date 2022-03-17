// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:healthng/config/config.dart';
import 'package:healthng/pages/search.dart';
import 'package:healthng/widgets/fedhos.dart';
import 'package:healthng/widgets/healthtip.dart';
import 'package:healthng/widgets/spear.dart';
import 'package:healthng/widgets/speye.dart';
import 'package:healthng/widgets/spneuro.dart';
import 'package:healthng/widgets/sporth.dart';
import 'package:healthng/widgets/teachhos.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with AutomaticKeepAliveClientMixin {

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
                    HealthTip(),
                    TeachHos(),
                    FedHos(),
                    SpneuroHos(),
                    SporthHos(),
                    SpearHos(),
                    SpeyeHos(),
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
            height: 25,
          ),
          InkWell(
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 5, right: 5),
              padding: EdgeInsets.only(left: 15, right: 15),
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border.all(color: Colors.grey.shade300, width: 0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Feather.search,
                      color: Colors.grey[600],
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'search federal hospitals',
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage()));
            },
           )
       ],
      ),
    );
  }
}



class CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.green,
      padding: EdgeInsets.only(top: 10, bottom: 5, left: 15, right: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Config().appName,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[700]),
              ),
              Text(
                'Explore ${Config().countryName}',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.green),
              )
            ],
          ),
          Spacer(),
          IconButton(
              icon: Icon(
                Feather.bell,
                size: 20,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Feather.search,
                size: 20,
              ),
              onPressed: () {})
        ],
      ),
    );
  }
}
