import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';




class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  File? image ;
  final imagepicker = ImagePicker();
  selectImageFromGallery() async {
    var pickedImage = await imagepicker.getImage(source: ImageSource.gallery);
    if(pickedImage != null){
      setState(() {
        image = File(pickedImage.path);
      });
    }else{}

  }
  selectImageFromCamera() async {
    var getImage = await imagepicker.getImage(source: ImageSource.camera);
    if(getImage != null){
      setState(() {
        image = File(getImage.path);
      });
    }else{}

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:Text(" Upload Image", style: TextStyle(color:Color(0xff223263), fontWeight: FontWeight.bold,fontSize: 25),),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace_outlined, color: Color(0xff223263)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      //width: double.infinity, height: double.infinity
      body:SafeArea(
          child:SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 350,
                  width: 400,
                  margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: Color(0xffD9D9D9),
                  ),
                  child:image ==null ? Center(child: Text("No image Selected",
                    style: TextStyle(fontSize: 30 ,fontWeight: FontWeight.w900,),),)
                      : Container(child: Image.file(image!)),
                ),
                SizedBox(height: 20,),
                Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: selectImageFromGallery ,
                    child: Text("Upload FromGallery", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      primary: Color(0xff004494),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                //Divider
                Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Container(
                      width: 150,
                      child: Divider(
                        height: 25,
                        thickness: 2,
                        color: Colors.black26,
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      "OR",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 150,
                      child: Divider(
                        height: 25,
                        thickness: 2,
                        color: Colors.black26,
                        indent: 10,
                        endIndent: 10,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: selectImageFromCamera ,
                    child: Text("Upload FromCamera", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      primary: Color(0xff004494),
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}



