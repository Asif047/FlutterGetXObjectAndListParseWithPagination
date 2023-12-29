import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:practice_getx/controller/CountryController.dart';

class CountryScreen extends StatefulWidget {

  final CountryController _controller;

  const CountryScreen(this._controller);



  @override
  State<CountryScreen> createState() => _CountryScreenState(_controller);
}

class _CountryScreenState extends State<CountryScreen> {

  final CountryController _controller;
  _CountryScreenState(this._controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Countries"),
      ),
      body: Obx(() => ListView.builder(
        itemCount: _controller.country.data.length,
        itemBuilder: (context, index) {
          final country = _controller.country.data[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Name: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          SizedBox(width: 10,),
                          Text(country.country!,style: TextStyle(fontSize: 16)),
                        ],
                      ),

                      SizedBox(height: 10,),


                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(country.iso3!, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent), textAlign: TextAlign.center,),
                        ],
                      ),

                      SizedBox(height: 20,),


                    ],
                  ),
                ),
              ),
            ),
          );
        },
      )),
    );
  }
}
