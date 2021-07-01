import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc/theme.dart';
import 'countries.dart';

class Continents extends StatefulWidget {

  // the value of dark mode function.
  @override
  _ContinentsState createState() => _ContinentsState();
}

class _ContinentsState extends State<Continents> {
  bool _switchValue = false;

  List<String> continent = <String> ["Africa","Antarctica","Asia","Europe","North America","Oceania","South America"];

  List<String> keys = <String> ["AF","AN","AS", "EU","NA","OC","SA"];

  @override
  Widget build(BuildContext context) {
    // to add dark mode.
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('DSC World',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent[400],
      ),
      drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Column(
                  children: [Expanded(child: Image.asset('images/earth.png',width: 200,)),
                    Text('Athar Hasan Hosney',
                      style: TextStyle(fontSize:20,color: Colors.blue ),)],
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('DARK MODE',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  SizedBox(width: 100,),
                  CupertinoSwitch(
                    activeColor: Colors.pink[900],
                    value: _switchValue,
                    onChanged: (value){
                      setState(() {
                        _switchValue = value;
                        if (_switchValue == false){
                          _themeChanger.setTheme(ThemeData.light());
                        }else{
                          _themeChanger.setTheme(ThemeData.dark());
                        }
                      });
                    },
                  ),
                ],
              )
            ],
          )
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
            (crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),
          itemCount: continent.length,
          itemBuilder: (BuildContext context,int index){
            return
              Card(
                elevation: 15,
                child: GestureDetector(
                  onTap: (){
                    var id = keys[index];
                    var name = continent[index];
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Countries(id: id,name: name)));
                  },
                  child: Container(
                    width: 200,
                    height: 200,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      color: Colors.lightBlue[100],),

                    child: Column( mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Image.asset("images/${continent[index]}.png")),
                        Text(continent[index],style: TextStyle(fontSize: 15),)
                      ],
                    ),
                  ),
                ),
              );
          }
      ),
    );
  }
}
