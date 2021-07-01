import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_world/add_fav.dart';
import 'package:the_world/countries.dart';
import 'package:the_world/details.dart';
import 'package:the_world/add_fav.dart';
import 'package:the_world/favCountry.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Favorite',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              centerTitle: true,
              backgroundColor: Colors.orangeAccent[400],
            ),
            body: AddFavorite.fav.length == 0 ?
                Center(child: Text("Your Favorite List Is Empty",style: TextStyle(fontSize: 25,fontStyle: FontStyle.italic),)) :
                ListView.builder(
                  itemCount: AddFavorite.fav.length,
                    itemBuilder: (context,index){
                    return Center(
                      child: Card(
                        margin: EdgeInsets.all(10),
                        color: Colors.lightBlue[100],
                        elevation: 25,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: (){
                            
                          },
                          child: GestureDetector(
                            onTap: (){
                              var flag = AddFavorite.fav[index].flag;
                              var name = AddFavorite.fav[index].name;
                              var native = AddFavorite.fav[index].native;
                              var phone = AddFavorite.fav[index].phone;
                              var capital = AddFavorite.fav[index].capital;
                              var currency = AddFavorite.fav[index].currency;
                              var language = AddFavorite.fav[index].languages;
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Details(flag: flag, name: name,
                                  native: native, phone: phone, capital: capital, currency: currency, languages: language,)));
                            },
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AddFavorite.fav[index].flag,style: TextStyle(fontSize: 20),),
                            SizedBox(width: 8,),
                            Expanded(
                              child: Text(AddFavorite.fav[index].name,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic)),
                            ),
                            ],
                            ),
                          ),
                        ),
                        ),
                      ),
                    );
                    }
                )

          );
  }
}



