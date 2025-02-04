import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:sjk/Attendence/present_service.dart';
import 'attendence.dart';

class Present extends StatefulWidget {
  const Present({Key? key}) : super(key: key);

  @override
  State<Present> createState() => _PresentState();
}

class _PresentState extends State<Present> {

  int _shiftValue = 0;
  String value = "Worker Type";
  List<String> items = [
    "Worker Type",
    "Electrician",
    "Plumber",
    "Mason",
    "Labour",
    "Carpenter"
  ];
  String? one;
  String? two;
  TextEditingController date =  TextEditingController();
  TextEditingController name =  TextEditingController();
  TextEditingController site =  TextEditingController();
  TextEditingController type =  TextEditingController();
  TextEditingController shift = TextEditingController();
  void enterdata() async {
    DocumentReference docRef =
    FirebaseFirestore.instance.collection("attendance").doc();

    DocumentSnapshot docSnap = await docRef.get();
    var doc = docSnap.reference.id;
    Map<String, String> data = {
      "Name": name.text,
      "Date": date.text,
      "Type":type.text,
    " Shift":shift.text,
      "Site":site.text,
      "doc id": doc,
    };
    await FirebaseFirestore.instance
        .collection("attendance")
        .doc(doc)
        .set(data)
    // .whenComplete(() => toast('Saved Successfully', Colors.blue))
        .whenComplete(() => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const  Data4())));
  }

  @override
  Widget build(BuildContext context) {
    //var inputType;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            backgroundColor:  const Color(0xff01579B),
            leading: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => const  Data4()));
              },
              child: const  Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 20,
              ),
            ),
            title:  const Text(
              "PRESENT",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
        body: Container(
          margin: const  EdgeInsets.all(20),
          height: 400,
          width: 400,
          decoration: BoxDecoration(
              color: const  Color(0xffe6f2ff),
              border: Border.all(
                width: 3,
                color: Colors.black,
              ),
              borderRadius:  const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              )),
          child: Column(children: [
            Container(
                margin:
                const  EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 25),
                height: 52,
                width: 350,
                decoration: BoxDecoration(
                  boxShadow:  const [
                    BoxShadow(
                      blurRadius: 7,
                    )
                  ],
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),
                  borderRadius:  const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                child: TextFormField(
                  controller: site,
                  cursorColor: const  Color(0xff01579B),
                  keyboardType: TextInputType.name,
                  decoration:  const  InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Working Site*"),
                )),
            Container(
                //
                // Figma Flutter Generator Rectangle4Widget - RECTANGLE
                margin:  const EdgeInsets.only(right: 20, left: 20),
                height: 52,
                width: 350,
                decoration: BoxDecoration(
                  boxShadow: const  [
                    BoxShadow(
                      blurRadius: 7,
                    )
                  ],
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),
                  borderRadius: const  BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                child: TextFormField(
                  controller: name,
                  cursorColor: const  Color(0xff01579B),
                  keyboardType: TextInputType.name,
                  decoration:  const  InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Worker Name*"),
                )),
            Container(
                margin: const  EdgeInsets.only(top: 20, right: 20, left: 20),
                height: 52,
                width: 350,
                decoration: BoxDecoration(
                  boxShadow: const  [
                    BoxShadow(
                      blurRadius: 7,
                    )
                  ],
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),
                  borderRadius: const  BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                child: DropdownButton(
                    value: value,
                    items: items.map((String items) {
                      return DropdownMenuItem(
                          value: items,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(items),
                          ));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        value = newValue!;
                        type.text=value;
                      });
                    })),


// Your widget
    Container(
      margin:  const EdgeInsets.only(top: 20, right: 20, left: 20),
      height: 52,
      width: 350,
      decoration: BoxDecoration(
        boxShadow: const  [
          BoxShadow(
            blurRadius: 7,
          )
        ],
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.zero,
            child: const  Text(
              'Shift',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(height: 38, width: 120),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _shiftValue++;
                    shift.text = _shiftValue.toString(); // Save to controller
                  });
                },
                child: Container(
                  padding: const  EdgeInsets.symmetric(horizontal: 10),
                  child: const  Icon(Icons.add_circle_outlined),
                ),
              ),
              Text(shift.text),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _shiftValue--;
                    shift.text = _shiftValue.toString(); // Save to controller
                  });
                },
                child: Container(
                  padding: const  EdgeInsets.symmetric(horizontal: 10),
                  child:  const Icon(Icons.remove_circle),
                ),
              ),
            ],
          ),
        ],
      ),
    ),



        Container(
              margin: const  EdgeInsets.only(top: 20, right: 20, left: 20),
              height: 52,
              width: 350,
              decoration: BoxDecoration(
                boxShadow: const  [
                  BoxShadow(
                    blurRadius: 7,
                  )
                ],
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Container(
                height: 62,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: TextField(
                    controller: date,
                    decoration:  const InputDecoration(
                      hintText: "Date",
                      icon: Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.calendar_today,
                          color: Colors.black,
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2100),
                      );

                      if (pickedDate != null) {
                        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                        setState(() {
                          date.text = formattedDate;  // Update 'start' controller's text
                        });
                      } else {
                        setState(() {
                          date.text = "";
                        });
                      }
                    },
                  ),
                ),
              ),
            )
          ]),
        ),
        bottomNavigationBar: Container(
            height: 100,
            width: 300,
            color: Colors.white30,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(
                  child: GestureDetector(
                onTap: () {
                  enterdata();
                },
                child: Container(
                    margin: const  EdgeInsets.all(20),
                    height: 50,
                    width: 100,
                    decoration: const  BoxDecoration(
                        color: Color(0xff01579B),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        )),
                    alignment: Alignment.center,
                    child:  const Text("SAVE",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
              )),
            ])));
  }


  }

