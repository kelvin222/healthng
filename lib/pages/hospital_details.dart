// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:healthng/models/hospital.dart';
import 'package:healthng/widgets/custom_cache_image.dart';
import 'package:healthng/widgets/direction.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';


class HospitalDetails extends StatefulWidget {

  final Hospital? data;
  final String tag;

  const HospitalDetails({required this.data, required this.tag});

  @override
  _HospitalDetailsState createState() => _HospitalDetailsState();
}

class _HospitalDetailsState extends State<HospitalDetails> {

  @override
  void initState() { 
    super.initState();
  }

  String collectionName = 'places';



  


  
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              
              children: <Widget>[
                Hero(
                  tag: widget.tag,
                    child: Container(
                      color: Colors.white,
                      child: Container(
                      height: 320,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                    
                        color: Colors.white,
                        
                      ),
                      child: CustomCacheImage(imageUrl:'${widget.data?.image}')
                  ),
                    ),
                ),

                
                Positioned(
                  top: 20,
                  left: 15,
                  child: SafeArea(
                      child: CircleAvatar(
                      backgroundColor: Colors.blue.withOpacity(0.9),
                      child: IconButton(
                        icon: Icon(
                          LineIcons.arrow_left,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                   
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.location_on, size: 20, color: Colors.grey,),
                      Expanded(child: Text('${widget.data?.town}'', ''${widget.data?.state}', style: TextStyle(fontSize: 13, color: Colors.grey[600],),maxLines: 2, overflow: TextOverflow.ellipsis,   )),
                      
                    ],
                  ),
                  Text('${widget.data?.name}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Colors.grey[800])),
                  
                  Container(
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                    height: 3,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(40)),
                  ),
                  Row(children: <Widget>[
                    Icon(
                         LineIcons.map_signs,
                         size: 18,
                         color: Colors.orange,
                         ),
                      Expanded(child: Text('${widget.data?.address}', style: TextStyle(fontSize: 13, color: Colors.grey[600],),maxLines: 2, overflow: TextOverflow.ellipsis,   )),
                      
                  ],),

                  SizedBox(height: 30,),
                  
                  Html(data: '''${widget.data?.detail}''',defaultTextStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.grey[800]),),
                  SizedBox(height: 30,),
                  DirectWidget(data: widget.data),
                 // SizedBox(height: 15,),
                  //OtherPlaces(stateName: widget.data.state, timestamp: widget.data.timestamp,),
                  //SizedBox(height: 15,),
                ],
              ),
              
              )

            
          ],
        ),
      ),
    );
  }
}




