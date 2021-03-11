import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final page = <Widget>[
    Monitor1(),
    Monitor2(),
    Monitor3(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding:false,
      body: Main(page[_currentIndex]),
      floatingActionButton: new FloatingActionButton(
        child: Icon(Icons.add), onPressed: () {
          showDialog(
            context: context,
            builder: (context){
              return TableDialog();
            }
          );
      },
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SizedBox(
        height: kBottomNavigationBarHeight+40.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              backgroundColor: Colors.white,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Container(
                      padding: const EdgeInsets.only(top:30.0),
                      child: Column(
                        children: [
                          Image.asset('assets/images/table.png',width: 30.0, height: 30.0,),
                        ],
                      ),
                    ), label: 'Table'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.article_rounded), label: 'History'),
              ],

              onTap: (index){
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
      ),
    );
  }
}

class Main  extends StatelessWidget{
  final _page;
  Main(this._page);
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _page,
          Positioned(
            top:0.0,
            left: 0.0,
            child: IconButton(
              icon: Icon(Icons.menu,size: 30.0,),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ],
      ),
    ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 15.0);
    path.quadraticBezierTo(size.width/2, -16.0, size.width, 15.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.moveTo(size.width/2-33, 0.0);
    path.arcToPoint( Offset(size.width/2+33.0, 0), radius: Radius.circular(20.0), clockwise: false);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) {
    return false;
  }
}

class Monitor1 extends StatelessWidget{
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      width: double.infinity,
      height: 400.0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromRGBO(237,237,237, 1)),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: ListView.builder(
          padding: const EdgeInsets.all(5.0),
          itemCount: 13,
          itemBuilder: (BuildContext context, int index){
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text('$index'),
                  ),
                  Text(
                      'какой то текст'
                  ),
                  ElevatedButton(
                    onPressed: (){},
                    child: Text('press'),
                    style: ElevatedButton.styleFrom(
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
class Monitor2 extends StatelessWidget{
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      width: double.infinity,
      height: 400.0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromRGBO(237,237,237, 1)),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: ListView.builder(
          padding: const EdgeInsets.all(5.0),
          itemCount: 13,
          itemBuilder: (BuildContext context, int index){
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text('$index'),
                  ),
                  Text(
                      'какой то столик'
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
class Monitor3 extends StatelessWidget{
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      width: double.infinity,
      height: 400.0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromRGBO(237,237,237, 1)),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: ListView.builder(
          padding: const EdgeInsets.all(5.0),
          itemCount: 13,
          itemBuilder: (BuildContext context, int index){
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text('$index'),
                  ),
                  Text(
                      'какая то история'
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class TableForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> TableFormState();
}
class TableFormState extends State<TableForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40.0, left:10.0, right: 10.0),
      child: Form(key: _formKey,
        child: Column(
          children: [
            Text('Введите код', style: TextStyle(
              fontSize: 20.0
            ),),
            TextFormField(
             validator: (value){
               if(value.isEmpty) return 'Введите код';
               try{
                 int.parse(value);
               } catch(e){
                 return 'Должны быть только числа';
               }
               return null;
             },
            ),
            SizedBox(height: 20.0,),
            ElevatedButton(
              onPressed: (){
                if(_formKey.currentState.validate()){
                  Navigator.of(context).pop();
                }
              },
              child: Text('Прикрепить стол'),
              style: ElevatedButton.styleFrom(
              ),
            ),
          ],
        )
      ),
    );

  }
}

class TableDialog extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      elevation: 16,
      child: Container(
        height: 400.0,
        width: 360.0,
        child: TableForm(),
      ),
    );
  }

}