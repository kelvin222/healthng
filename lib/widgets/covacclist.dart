// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:healthng/controller/health_controller.dart';
import 'package:healthng/models/health.dart';
import 'package:healthng/models/states.dart';
import 'package:healthng/pages/home.dart';
import 'package:healthng/repository/health_repository.dart';
import 'package:healthng/utils/loading_cards.dart';
import 'package:healthng/utils/next_screen.dart';
import 'package:healthng/widgets/custom_cache_image.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';



class Covidvacclist extends StatelessWidget {

  @override
  Widget build(BuildContext context) {    

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15, top: 10,),
          child: Row(children: <Widget>[
            Text('Covid Vaccination Centres', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.grey[800]),),
            Spacer()   
          ],),
        ),
        
        Container(
          height: 140,
          //color: Colors.green,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 5, right: 5),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: NState.samples.length,
          itemBuilder: (BuildContext context, int index) {
            var cv = NState.samples[index];
            return GestureDetector(
              // 8
           child: Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.green.shade800,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                Icon(Feather.map_pin, size: 50, color: Colors.white,),
                SizedBox(height: 5,),
                Text(
                              cv.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600,
                                color: Colors.white
                              ),
                            ),
                            SizedBox(height: 5,),
                            
                                
          ],
        ),
      ),
            ),
    ),
              onTap: () => nextScreen(context, HomePage()), 
                );
              },
              // 11
              
            ),
            ),
           
        
        
        
      ],
    );
  }
}



