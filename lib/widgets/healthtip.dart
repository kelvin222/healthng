import 'package:flutter/material.dart';
import 'package:healthng/controller/health_controller.dart';
import 'package:healthng/models/health.dart';
import 'package:healthng/pages/home.dart';
import 'package:healthng/repository/health_repository.dart';
import 'package:healthng/utils/loading_cards.dart';
import 'package:healthng/utils/next_screen.dart';
import 'package:healthng/widgets/custom_cache_image.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';



class HealthTip extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {    
    var healthController = HealthController(HealthRepository());

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15, top: 10,),
          child: Row(children: <Widget>[
            Text('Health Tips', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.grey[800]),),
            Spacer()   
          ],),
        ),
        
        Container(
          height: 360,
          //color: Colors.green,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder<List<Health>>(
            future: healthController.fetchHealthList(),
            builder: (context, snapshot) {

               if (snapshot.connectionState == ConnectionState.waiting){
                return LoadingPopularPlacesCard();
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
              var health = snapshot.data?[index];
             // if(snapshot.data.isEmpty) return LoadingPopularPlacesCard();
              return InkWell(
              child: Container(
                margin: EdgeInsets.only(left: 0, right: 10, top: 5, bottom: 5),
                width: MediaQuery.of(context).size.width * 0.70,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)
                  
                ),
                child: Stack(
                   children: [
                     Hero(
                       tag: '${health?.name}',
                        child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CustomCacheImage(imageUrl: '${health?.image}')
                       ),
                     ),
                   ],
                ),
                
              ),

              onTap: () => nextScreen(context, HomePage()),
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




