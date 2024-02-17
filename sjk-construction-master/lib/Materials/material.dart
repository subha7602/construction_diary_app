import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Homepage/Homepage.dart';
import 'Info.dart';
class Data3 extends StatefulWidget {
  final List data;
  const Data3({Key? key, required this.data}) : super(key: key);

  @override
  State<Data3> createState() => _Data3State();
}

class _Data3State extends State<Data3> {
  //String value = "Type of Building";
  //List<String> items = ["Residential", "Non-Residential","Others"];

  @override
  Widget build(BuildContext context) {
    //var inputType;
    return Scaffold(

        appBar: AppBar(
            backgroundColor: const Color(0xff01579B),
            leading: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => const Homepage()));
              },
              child:const  Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 20,
              ),
            ),
            title:const  Text(
              "MATERIALS",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
        body:
        Column(
          children: [
            Container(
              height: 50,color: const  Color(0xff01579B),
              child:const  Expanded(
                flex: 9,
                child: Row(
                  children: [
                    Expanded(flex:3,child: Center(child: Text('Material',style: TextStyle(color: Colors.white),))),
                    Expanded(flex:3,child: Center(child: Text('Amount',style: TextStyle(color: Colors.white),))),
                    Expanded(flex:3,child: Center(child: Text('Status',style: TextStyle(color: Colors.white),))),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 450,
              child:
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 105,
                    width:350,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(217, 217, 217, 1),
                    ),
                    child: Expanded(
                      flex:9,
                      child: Row(
                        children: [
                          const SizedBox(width: 10,),
                          Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          padding:const  EdgeInsets.all(20),
                          child: Text(
                            widget.data[index]["Material"],
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                          const  SizedBox(width: 10,),
                            Expanded(
                              flex: 3,
                              child: Container(

                                decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: Colors.black),
                                  borderRadius:const  BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                ),
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  widget.data[index]["NetAmount"],
                                  style:const  TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),

                          const SizedBox(width: 10,),
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black),
                              borderRadius:const  BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            padding:const  EdgeInsets.all(20),
                            child: Text(
                              widget.data[index]["DropdownValue"],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),

                          const  SizedBox(width: 10,),
                           ],

                          ),


                    ),

                  );
                },
                itemCount: widget.data.length,

              ),
            ),

          ],
        ),
bottomNavigationBar: Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ElevatedButton(

    onPressed: () {

      //_submitform();

      Navigator.of(context)

          .push(MaterialPageRoute(builder: (context) => const Info(data: [],)));

    },

    style: ElevatedButton.styleFrom(

      primary:const  Color(0xff01579B), // background color

      onPrimary: Colors.white, // text color

      shape: const RoundedRectangleBorder(

        borderRadius: BorderRadius.all(Radius.circular(5)),

      ),

      minimumSize:const  Size(200, 50),

    ),

    child: const Text(

      'ADD NEW MATERIAL+',

      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),

    ),

  ),
)
      ,
        );
  }


}
