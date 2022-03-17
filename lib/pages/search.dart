import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:healthng/utils/empty.dart';
import 'package:healthng/utils/list_card.dart';
import 'package:healthng/utils/loading_cards.dart';
import 'package:healthng/utils/snackbar.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  var scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //search bar

            Container(
              alignment: Alignment.center,
              height: 56,
              width: w,
              decoration: BoxDecoration(color: Colors.white),
              child: TextFormField(
                autofocus: true,
                //controller: context.watch<SearchBloc>().textfieldCtrl,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "search & explore",
                  hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800]),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 15),
                    child: IconButton(
                      icon: Icon(
                        Icons.keyboard_backspace,
                        color: Colors.grey[800],
                      ),
                      color: Colors.grey[800],
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.grey[800],
                      size: 25,
                    ),
                    onPressed: () {
                      //context.read<SearchBloc>().saerchInitialize();
                    },
                  ),
                ),
                textInputAction: TextInputAction.search,
                onFieldSubmitted: (value) {
                  if(value == ''){
                    openSnacbar(scaffoldKey, 'Type something!');
                  }else{
                    //context.read<SearchBloc>().setSearchText(value);
                  }
                },
              ),
            ),

            Container(
              height: 1,
              child: Divider(
                color: Colors.grey[300],
              ),
            ),

            // suggestion text

            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, bottom: 5),
              child: Text(
                //context.watch<SearchBloc>().searchStarted == false
                   // ? 'recent searchs'
                     'we have found',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            //context.watch<SearchBloc>().searchStarted == false
                AfterSearchUI()
          ],
        ),
      ),
    );
  }
}





class AfterSearchUI extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        //future: context.watch<SearchBloc>().getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0)
              return EmptyPage(
                icon: Feather.clipboard,
                message: 'no places found',
                message1: "try again",
              );
            else
              return ListView.separated(
                padding: EdgeInsets.all(10),
                itemCount: snapshot.data.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: 5,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ListCard(
                  );
                },
              );
          }
          return ListView.separated(
            padding: EdgeInsets.all(15),
            itemCount: 5,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              return LoadingCard(height: 120);
            },
          );
        },
      ),
    );
  }
}
