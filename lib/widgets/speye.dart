// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:healthng/controller/hospital_controller.dart';
import 'package:healthng/models/hospital.dart';
import 'package:healthng/pages/home.dart';
import 'package:healthng/pages/hospital_details.dart';
import 'package:healthng/repository/speye_repository.dart';
import 'package:healthng/utils/loading_cards.dart';
import 'package:healthng/utils/next_screen.dart';
import 'package:healthng/widgets/custom_cache_image.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';



class SpeyeHos extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {    
    var hosController = HospitalController(SpeyeRepository());
    double w = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15, top: 10, bottom: 10),
          child: Row(children: <Widget>[
            Text('National Eye Centre', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.grey[800]),),
            Spacer(),          
          ],),
        ),
        
        Container(
          height: 150,
          //color: Colors.gree
          width: MediaQuery.of(context).size.width,
          
          child: FutureBuilder<List<Hospital>>(
            future: hosController.fetchHosList(),
            builder: (context, snapshot) {

               if (snapshot.connectionState == ConnectionState.waiting){
                return LoadingFeaturedCard();
              }
              if (snapshot.hasError){
                return Center(child: Text('error'));
              }
              return ListView.builder(
            padding: EdgeInsets.only(left: 15, right: 15),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              var hospital = snapshot.data?[index];
             // if(snapshot.data.isEmpty) return LoadingPopularPlacesCard();
              return InkWell(
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.bottomRight,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 15, bottom: 0),
            //color: Colors.grey[200],
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 15, left: 25, right: 10, bottom: 10),
                    alignment: Alignment.topLeft,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, left: 115),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${hospital?.name}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Icon(Feather.map_pin, size: 12, color: Colors.grey,),
                              SizedBox(width: 3,),
                              Expanded(
                                child: Text(
                                  '${hospital?.town}'+', '+'${hospital?.state}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[700]
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8, bottom: 20),
                            height: 2,
                            width: 120,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                LineIcons.map_signs,
                                size: 18,
                                color: Colors.orangeAccent,
                              ),
                              Expanded(
                                child: Text(
                                  '${hospital?.address}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[600]
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                
              ],
            ),
          ),
          Positioned(
              bottom: 30,
              left: 5,
              child: Hero(
                tag: '${hospital?.name}',
                child: Container(
                    height: 120,
                    width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CustomCacheImage(imageUrl: '${hospital?.image}'))),
              ))
        ],
      ),
      onTap: () => nextScreen(context, HospitalDetails(data: hospital, tag: '${hospital?.name}')),
    );
           },
          );
            } ,),
           
        )
        
        
      ],
    );
  }
}




