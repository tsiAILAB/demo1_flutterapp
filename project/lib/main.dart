import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MaterialApp(
  home: Landing(),
));

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  File imageFile;

  Future _openGallery() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = picture;
    });
  }

  Future _openCamera() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile = picture;
    });
  }

  /* Future<void> _showChoiceDialog(BuildContext context){
    return showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Please select a Option'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text('Open Gallery'),
                onTap: (){
                  _openGallery(context);
                },
              ),
              SizedBox(height: 20),
              GestureDetector(
                child: Text('Open Camera'),
                onTap: (){
                  _openCamera(context);
                },
              ),
            ],
          ),
        ),
      );
    });
  }*/

  /*Widget _decideImageView(){
    if(imageFile == null){
      return Text('No Image Selected!');
    }else{
      Image.file(imageFile, width: 400, height: 400);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Image Check',
          style: TextStyle(
              letterSpacing: 2.0
          ),
        ),
        backgroundColor: Colors.teal[800],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              imageFile == null ? Text('No Image selected') : Image.file(imageFile, width: 250, height: 300),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton.icon(
                    onPressed: (){
                      _openGallery();
                    },
                    icon: Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Gallery',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    color: Colors.teal[800],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  RaisedButton.icon(
                    onPressed: (){
                      _openCamera();
                    },
                    icon: Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                    ),
                    label: Text(
                      'New Photo',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    color: Colors.teal[800],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        icon: Icon(Icons.camera_alt),
        label: Text('Upload Photo'),
        backgroundColor: Colors.teal[800],

      ),
    );
  }
}



