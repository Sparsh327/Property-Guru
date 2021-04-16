import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_guru/screens/data.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';
import 'package:toast/toast.dart';

class SellProperty extends StatefulWidget {
  // SellProperty({Key key}) : super(key: key);
  String userId;
  String name;
  SellProperty(this.userId, this.name);
  @override
  _SellPropertyState createState() => _SellPropertyState();
}

class _SellPropertyState extends State<SellProperty> {
  List<Property> property = getPropertyList();
  final picker = ImagePicker();
  List<File> _Image = [];
  File _image;
  String id;
  String url;
  bool showPassword = false;
  double val = 0;
  FirebaseStorage _storage = FirebaseStorage.instance;
  // CollectionReference imgRef;

  TextEditingController textEditingController1 = new TextEditingController();
  TextEditingController textEditingController2 = new TextEditingController();
  TextEditingController textEditingController3 = new TextEditingController();
  TextEditingController textEditingController4 = new TextEditingController();
  TextEditingController textEditingController5 = new TextEditingController();
  TextEditingController textEditingController6 = new TextEditingController();
  final db = FirebaseFirestore.instance;

  getUserLocation() async {
    //call this async method from whereever you need

    LocationData myLocation;
    String error;
    Location location = new Location();
    try {
      myLocation = await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'please grant permission';
        print(error);
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'permission denied- please enable it from app settings';
        print(error);
      }
      myLocation = null;
    }
    var currentLocation = myLocation;
    final coordinates =
        new Coordinates(myLocation.latitude, myLocation.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    // print(
    //     ' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
    textEditingController6.text = '${first.subLocality}   ';

    return first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
            child: Text('Sell Property')),
        backgroundColor: Colors.indigo[900],
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[Colors.indigo[900], Colors.indigo[400]])),
        ),
        actions: [
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
                icon: new Image.asset('assets/house.png'), onPressed: () {}),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Create Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/user.png",
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            // getImage();
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.indigo,
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  controller: textEditingController1,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 3),
                    labelText: "Property Name",
                    labelStyle: TextStyle(fontSize: 18.0),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  controller: textEditingController2,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 3),
                    labelText: 'Mobile No',
                    labelStyle: TextStyle(fontSize: 18.0),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  controller: textEditingController3,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 3),
                    labelText: 'Sale/Rent',
                    labelStyle: TextStyle(fontSize: 18.0),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  controller: textEditingController4,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 3),
                    labelText: 'Selling Price / Rent Price Per Month',
                    labelStyle: TextStyle(fontSize: 18.0),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  controller: textEditingController5,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 3),
                    labelText: 'Area sq/m',
                    labelStyle: TextStyle(fontSize: 18.0),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TextField(
                  controller: textEditingController6,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        getUserLocation();
                      },
                      icon: Icon(
                        Icons.location_searching_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(bottom: 3),
                    hintText: "India, Delhi",
                    labelText: 'Location',
                    labelStyle: TextStyle(fontSize: 18.0),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Upload Property Images",
                    style: TextStyle(fontSize: 20, color: Colors.grey[600])),
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 380,
                      height: 270,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.grey[100]),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: _image == null
                                  ? NetworkImage(
                                      "https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80",
                                    )
                                  : FileImage(_image))),
                    ),
                    Positioned(
                        bottom: 10,
                        right: 10,
                        child: GestureDetector(
                          onTap: () {
                            getImage();
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.indigo,
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              GridView.builder(
                  physics:
                      NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                  shrinkWrap: true,
                  itemCount: _Image.length + 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return index == 0
                        ? Center(
                            child: IconButton(
                              // color: Colors.indigo,
                              splashColor: Colors.indigo,
                              icon: Icon(Icons.add),
                              onPressed: () {
                                chooseImage();
                              },
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: FileImage(_Image[index - 1]),
                                    fit: BoxFit.cover)),
                          );
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ignore: deprecated_member_use

                    // ignore: deprecated_member_use
                    RaisedButton(
                      onPressed: () {
                        addData();
                      },
                      color: Colors.indigo,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "SAVE",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) => DetailPage()));
                      },
                      color: Colors.indigo,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _Image.add(File(pickedFile?.path));
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
    _uploadImageToFirebase(_image);
  }

  Future<void> _uploadImageToFirebase(File image) async {
    try {
      // Make random image name.
      int randomNumber = Random().nextInt(100000);
      String imageLocation = 'images/image${randomNumber}.jpg';

      // Upload image to firebase.
      Reference reference = _storage.ref().child(imageLocation);
      UploadTask uploadTask = reference.putFile(image).whenComplete(() {
        _addPathToDatabase(imageLocation);
      });
    } catch (e) {
      print(e.message);
    }
  }

  Future<void> _addPathToDatabase(String txt) async {
    try {
      final ref = _storage.ref().child(txt);
      url = await ref.getDownloadURL();
      print("URLs:$url");
      //  await db.collection('users').doc().set({'url':imageString , 'location':txt});
    } catch (err) {
      print("Error:$err");
    }
  }

  addData() {
    db.collection("Property").doc(widget.userId).set({
      "UN": widget.name,
      "N": textEditingController1.text.trim(),
      "Mob": textEditingController2.text.trim(),
      "Lable": textEditingController3.text.trim(),
      "P": textEditingController4.text.trim(),
      "A": textEditingController5.text.trim(),
      "LoC": textEditingController6.text.trim(),
      "Img": url
    }).then((value) {
      Toast.show("Property Details Uploaded", context);
    });
  }
}
