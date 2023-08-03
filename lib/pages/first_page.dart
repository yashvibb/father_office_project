import 'package:father_office_project/pages/second_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class First_Page extends StatelessWidget {
  const First_Page({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffB5C0FF),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.device_hub, color: Color(0xff152228)),
        ),
        title: const Text(
          "Main Page",
          style: TextStyle(
            color: Color(0xff152228),
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              SizedBox(
                height: 160,
                width: double.maxFinite,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Card(
                    color: const Color(0xff152228),
                    shadowColor: const Color(0xffB5C0FF),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                              color: Color(0xffB5C0FF),
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 27),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_circle_up,
                                    color: Colors.green,
                                    size: 35,
                                  ),
                                  SizedBox(width: 4),
                                  Column(
                                    children: const [
                                      Text(
                                        "Income",
                                        style: TextStyle(
                                          color: Color(0xffB5C0FF),
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text("100",
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 18,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_circle_down,
                                    color: Colors.red,
                                    size: 35,
                                  ),
                                  SizedBox(width: 4),
                                  Column(
                                    children: const [
                                      Text(
                                        "Expand",
                                        style: TextStyle(
                                          color: Color(0xffB5C0FF),
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        "20",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 474,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color:Color(0xffB5C0FF),),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12,right: 12,top: 8),
                      child: Row(
                        children: [
                          Text("Add Details",
                            style: TextStyle(
                              color:  Color(0xff152228),
                              fontSize: 22,
                            ),),
                          SizedBox(width: 140),
                         CircleAvatar(
                           radius: 24,
                           backgroundColor: Color(0xff152228),
                           child: IconButton(
                             onPressed: (){
                               Navigator.push(context, CupertinoPageRoute(builder: (context)=>Second_Page()));
                             },
                             icon: Icon(Icons.add),
                           )
                         ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xff152228),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
