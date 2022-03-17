// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:healthng/controller/covidtest_controller.dart';
import 'package:healthng/controller/hospital_controller.dart';
import 'package:healthng/models/covidtest.dart';
import 'package:healthng/models/hospital.dart';
import 'package:healthng/pages/home.dart';
import 'package:healthng/repository/covt_repository.dart';
import 'package:healthng/repository/fedhos_repository.dart';
import 'package:healthng/repository/govcovt_repository.dart';
import 'package:healthng/repository/statcovt_repository.dart';
import 'package:healthng/utils/loading_cards.dart';
import 'package:healthng/utils/next_screen.dart';
import 'package:healthng/widgets/custom_cache_image.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';



class Statest extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {    
    var stcovidtController = CovidtestController(StatCovidtRepository());
    double w = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15, top: 10,),
          child: Row(children: <Widget>[
            Text('State Covid Test Laboratories', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.grey[800]),),
            Spacer(),
            IconButton(icon: Icon(Icons.arrow_forward),
              onPressed: () => nextScreen(context, HomePage()),            
            )
          ],),
        ),
        
        Container(
          height: 260,
          //color: Colors.green,
          width: MediaQuery.of(context).size.width,
          
          child: FutureBuilder<List<Covidtest>>(
            future: stcovidtController.fetchCovtList(),
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
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              var stcov = snapshot.data?[index];
             // if(snapshot.data.isEmpty) return LoadingPopularPlacesCard();
              return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
                  child: InkWell(
                    child: Stack(
                      children: <Widget>[
                        Hero(
                          tag: '${stcov?.name}',
                          child: Container(
                            height: 220,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CustomCacheImage(imageUrl:'${stcov?.image}'))
                          ),
                        ),
                        Positioned(
                          height: 120,
                          width: w * 0.70,
                          left: w * 0.11,
                          bottom: 10,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      offset: Offset(0, 2),
                                      blurRadius: 2)
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                      child: Text(
                                      '${stcov?.name}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(
                                        Icons.location_on,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
                                      Expanded(
                                            child: Text('${stcov?.state}',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,),
                                      )
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.grey[300],
                                    height: 20,
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(
                                          LineIcons.map_signs,
                                          size: 18,
                                          color: Colors.orange,
                                        ),
                                        Expanded(
                                          child: Text(
                                            '${stcov?.address}',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey[700]),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () => nextScreen(context, HomePage()),
                  ),
                
              );
              //return LoadingCard1();
           },
          );
            } ,),
           
        )
        
        
      ],
    );
  }
}




