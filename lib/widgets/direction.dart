import 'package:flutter/material.dart';
import 'package:healthng/models/hospital.dart';
import 'package:healthng/utils/next_screen.dart';
import 'package:line_icons/line_icons.dart';

class DirectWidget extends StatelessWidget {
  final Hospital? data;
  const DirectWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Locate',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                )),
        Container(
          margin: EdgeInsets.only(top: 5, bottom: 5),
          height: 3,
          width: 50,
          
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(40)),
        ),
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 30),
          child: GridView.count(
            padding: EdgeInsets.all(0),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 1,
            childAspectRatio: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              InkWell(
                child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.green.shade800,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.green.shade600,
                                      offset: Offset(5, 5),
                                      blurRadius: 2)
                                        ]),
                                child: Icon(
                                            LineIcons.hospital_o,
                                            size: 30,
                                              ),
                                              ),
                                  Text(
                                    'Get direction to this Hospital',
                                    style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                          ),
                        ])),
                //onTap: () => nextScreen(context, HotelPage(placeData: placeData,)),
              ),
              
            ],
          ),
        )
      ],
    );
  }
}
