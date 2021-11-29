import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  final dynamic _id;
  const Profile({Key? key, dynamic id})
      : _id = id,
        super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _programOfStudyController = TextEditingController();
  TextEditingController _nameOfSchoolController = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  int levelOfEducation = 100;

  @override
  Widget build(BuildContext context) {
    print(widget._id);
    var _space = MediaQuery.of(context).size.height / 11;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Stack(
                    // fit: StackFit.loose,
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        maxRadius: 40,
                        backgroundColor: Colors.grey,

                        //TODO: ask use to either select a photo from gallery or take a photo with device
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            //TODO: display camera_enhance if no picture is put there picture of user
                            Icons.person,
                            size: 50,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: -25,
                        child: CircleAvatar(
                          backgroundColor: Colors.amberAccent,
                          //TODO: ask use to either select a photo from gallery or take a photo with device
                          child: GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.camera_enhance,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text("Name", style: GoogleFonts.quicksand(fontSize: 15)),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.amberAccent,
                  validator: (input) {
                    if (input!.isEmpty) {
                      return "please enter a username";
                    }
                    return null;
                  },
                  controller: _usernameController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.amberAccent)),
                    hintStyle:
                        TextStyle(fontSize: 15, color: Colors.amberAccent),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Name of school",
                    style: GoogleFonts.quicksand(fontSize: 15)),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.amberAccent,
                  validator: (input) {
                    if (input!.isEmpty) {
                      return "please enter name of school";
                    }
                    return null;
                  },
                  controller: _nameOfSchoolController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.amberAccent)),
                    hintStyle:
                        TextStyle(fontSize: 15, color: Colors.amberAccent),
                  ),
                ),
                SizedBox(height: 10),
                Text("Program Of study",
                    style: GoogleFonts.quicksand(fontSize: 15)),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.amberAccent,
                  validator: (input) {
                    if (input!.isEmpty) {
                      return "please enter program of study";
                    }
                    return null;
                  },
                  controller: _programOfStudyController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.amberAccent)),
                    hintStyle:
                        TextStyle(fontSize: 15, color: Colors.amberAccent),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select level",
                      style: GoogleFonts.quicksand(
                          color: Colors.black, fontSize: 20),
                    ),
                    // Container(
                    //   alignment: Alignment.centerRight,
                    //   child: DropdownButton(
                    //     value: levelOfEducation,
                    //     onChanged: (int? level) {
                    //       setState(() {
                    //         levelOfEducation = level!;
                    //       });
                    //     },
                    //     items: User.getUserLevels
                    //         .map(
                    //           (level) => DropdownMenuItem(
                    //             value: level,
                    //             child: Text(
                    //               level.toString(),
                    //               style: GoogleFonts.quicksand(
                    //                   fontSize: 25,
                    //                   fontWeight: FontWeight.bold,
                    //                   color: Colors.black),
                    //             ),
                    //           ),
                    //         )
                    //         .toList(),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  height: _space,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: RawMaterialButton(
                    //TODO: implement push user info into database
                    onPressed: () {},
                    child: Text(
                      "submit",
                      style: GoogleFonts.quicksand(
                          color: Colors.amberAccent, fontSize: 20),
                    ),
                    fillColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// an svg image in the container of the modalBottom sheet,
// ask user to proceed or check the overview
// in the container ...do some animation
