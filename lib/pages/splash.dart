import 'package:flutter/material.dart';
import 'package:healthng/config/config.dart';
import 'package:healthng/pages/home.dart';
import 'package:healthng/utils/next_screen.dart';
import 'package:provider/provider.dart';


class SplashPage extends StatefulWidget {

   BuildContext context;
  SplashPage(this.context);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin{

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _controller.forward();
    Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                (context) =>HomePage())
          );
  }






  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: RotationTransition(

              turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
              child: Image(
                image: AssetImage(Config().splashIcon),
                height: 120,
                width: 120,
                fit: BoxFit.contain,
              )
            ),
    ));
  }
}
