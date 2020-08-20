import 'package:flutter/material.dart';
import 'logic.dart';
void main() {
  runApp(interactiveApp());
}
Logic applogic = new Logic();
class interactiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: mainApp(),
    );
  }
}

class mainApp extends StatefulWidget {
  @override
  _mainAppState createState() => _mainAppState();
}

class _mainAppState extends State<mainApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Card(
                color: Colors.white,
                child: Padding(padding: const EdgeInsets.all(8.0),
                child:Center(child: FittedBox(
                child: Text(
                  applogic.getStory()[0],
                  style: TextStyle(
                    color: Colors.black,fontSize: 22,
                  ),
                ),
                ),
                )
                  ,)


              ),

            ),
            choicebutton(context, applogic.getStory()[1] , (){
              setState(() {
                applogic.nextStory(1);
              });
            } , Colors.blue, true),
            choicebutton(context, applogic.getStory()[2] , (){
              setState(() {
                applogic.nextStory(2);
              });
            } , Colors.teal, applogic.isVisible()),
            choicebutton(context, applogic.getStory()[3] , (){
              setState(() {
                applogic.nextStory(3);
              });
            } , Colors.purple, applogic.isVisible()),

          ],
        ),
      ),
      appBar: AppBar(leading: Icon(Icons.person,color: Colors.white,),title: Text('MAKE YOUR OWN STORY',style: TextStyle(color: Colors.white),),),
    );
  }
}

Widget choicebutton(context , title , onpress , color , visibility)
{
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.only(bottom: 10.0),
    height: 70,
    child: Visibility(
      visible: visibility,
      child: RaisedButton(onPressed: onpress,
      child: FittedBox(
        child: Text(title,style: TextStyle(
          color: Colors.white,fontSize: 25,
        ),),
      ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: color,
      ),
    ),
  );
}