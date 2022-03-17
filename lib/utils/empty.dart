import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  final IconData icon;
  final String message;
  final String message1;
  const EmptyPage({ required this.icon, required this.message, required this.message1}) ;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 80, color: Colors.grey,),
          SizedBox(height: 20,),
          Text(message, 
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w500,
            color: Colors.grey[700]
          ),),
          SizedBox(height: 5,),
          Text(message1, 
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400,
            color: Colors.grey[700]
          ),)
        ],
      ),
    );
  }
}