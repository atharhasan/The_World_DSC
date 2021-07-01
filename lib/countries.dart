import 'dart:convert';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:the_world/add_fav.dart';
import 'package:the_world/details.dart';
import 'package:the_world/favCountry.dart';
import 'package:the_world/favorite.dart';

// ignore: must_be_immutable
class Countries extends StatefulWidget {
  String id;
  String name;

  Countries({Key key, @required this.id,this.name}) : super(key: key);

  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  Map _map  ;
  List country;
  List languages;
  List countries = [];
  List countLang = [];
  var favCountry;
  bool isSearching = false;
  List filterCountries = [];

  // to get countries for continents.
  Future<List> getCountry() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);

    setState(() {
      _map = data["countries"];
      country = _map.values.toList();
    });

    for (var i = 0; i < country.length; i++) {
      var countryOfCon = country[i]["continent"];
      if (widget.id == countryOfCon) {
        countries.add(country[i]);
      }
    }
    return countries ;
  }

 @override
 void initState(){
   getCountry();
   countries = filterCountries;
    super.initState();
 }
 //filter countries for searching.
 void _filterCountries (value){
    setState(() {
      filterCountries = countries.where((country) => country['name'].toLowerCase().contains(value.toLowerCase())).toList();
    });

 }

  Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: !isSearching? Text(widget.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              : TextField(
                onChanged: (value){
                  _filterCountries(value);
                },
                decoration: InputDecoration(icon: Icon(Icons.search),hintText: "Search Country Here",
                  hintStyle: TextStyle(color: Colors.white)),style: TextStyle(color: Colors.white,fontSize: 20),),
              centerTitle: true,
              actions: [
                isSearching ?
                IconButton(icon: Icon(Icons.cancel),
                    onPressed: (){
                  setState(() {
                    this.isSearching = false;
                    filterCountries = countries;
                  });
                    }
                )
                : IconButton(icon: Icon(Icons.search),
                    onPressed: (){
                  setState(() {
                    this.isSearching = true;
                  });
                }
                ),
              ],
              backgroundColor: Colors.lightBlueAccent,
            ),
            body: ListView.builder(
                padding: EdgeInsets.all(5),
                itemCount: filterCountries.length,
                itemBuilder: (BuildContext context, int index) {

                  return Card(
                    margin: EdgeInsets.all(10),
                    color: Colors.blue[800],
                    elevation: 25,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap:(){
                          var flag = filterCountries[index]["emoji"];
                          var name = filterCountries[index]["name"];
                          var native = filterCountries[index]["native"];
                          var phone = filterCountries[index]["phone"];
                          var capital = filterCountries[index]["capital"];
                          var currency = filterCountries[index]["currency"];
                          var language = filterCountries[index]["languages"];
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Details(flag: flag, name: name,
                              native: native, phone: phone, capital: capital, currency: currency, languages: language)));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(filterCountries[index]["emoji"],style: TextStyle(fontSize: 20,),),
                            SizedBox(width: 15,),
                            Expanded(
                              child: Text(filterCountries[index]["name"] ,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic)),
                            ),

                            FavoriteButton(
                              isFavorite: false,
                              valueChanged: (_isFavorite){
                                var flag = filterCountries[index]["emoji"];
                                var name = filterCountries[index]["name"];
                                var native = filterCountries[index]["native"];
                                var phone = filterCountries[index]["phone"];
                                var capital = filterCountries[index]["capital"];
                                var currency = filterCountries[index]["currency"];
                                var language = filterCountries[index]["languages"];
                                favCountry = FavCountry(flag, name, native, phone, capital, currency, language);
                               AddFavorite.add(favCountry, _isFavorite, name);
                              },
                              iconColor: Colors.red,
                            ),
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


