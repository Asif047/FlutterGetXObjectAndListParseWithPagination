import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:practice_getx/controller/CatController.dart';

class CatScreen extends StatefulWidget {

  final CatController _controller;

  const CatScreen(this._controller);



  @override
  State<CatScreen> createState() => _CatScreenState(_controller);
}

class _CatScreenState extends State<CatScreen> {

  final CatController _controller;
  _CatScreenState(this._controller);

  bool getLoadLastPage() {
    print("##AA:${_controller.lastPage}");
    return _controller.lastPage;
  }

  bool getNextPage() {
    print("##ZZ:${_controller.lastPage}");
    return _controller.lastPage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Passengers"),
      ),
      body: Obx(() => Column(
        children: [
          Expanded(
            child: LazyLoadScrollView(
                onEndOfPage: _controller.loadNextPage,
                isLoading: getLoadLastPage(),
                child: ListView.builder(
                  itemCount: _controller.cats.length,
                  itemBuilder: (context, index) {
                    final passengers = _controller.cats[index];

                    if(index == _controller.cats.length-1 && _controller.isMoreDataAvailable == true) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        width: 60,
                                        child: Text("Name:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
                                    SizedBox(width: 20,),
                                    Text(passengers.id, style: TextStyle( fontSize: 16),),
                                  ],
                                ),

                                SizedBox(height: 10,),

                                Row(
                                  children: [
                                    Container(
                                        width: 60,
                                        child: Text("Id:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
                                    SizedBox(width: 20,),
                                    Text(passengers.id, style: TextStyle( fontSize: 16),),
                                  ],
                                ),

                                SizedBox(height: 10,),

                                Row(
                                  children: [
                                    Container(
                                        width: 60,
                                        child: Text("Trips:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
                                    SizedBox(width: 20,),
                                    Text('${passengers.height}', style: TextStyle( fontSize: 16),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
            ),
          ),

          //CircularProgressIndicator()
        ],
      )),
    );
  }
}
