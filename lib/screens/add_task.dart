import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:my_movies/models/provider_class_of_tasks_list.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:my_movies/constants.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTaskTitle = '';
  String newDirector = '';
  var _imageFile;

  Future takeInput() async {
    print('On tap is fine');
    final ImagePicker picker = ImagePicker();
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    final tempImage = File(pickedFile.path);
    setState(() {
      _imageFile = tempImage;
      print(_imageFile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 20.0,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                height: 150.0,
                width: 100.0,
                decoration: _imageFile != null
                    ? BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(
                            _imageFile,
                          ),
                        ),
                      )
                    : BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.grey.shade100,
                      ),
                child: GestureDetector(
                  child: _imageFile == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_photo_alternate_outlined,
                              color: Colors.grey,
                              size: 55.0,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'CLICK TO UPLOAD POSTER',
                              style: TextStyle(
                                  color: kMainBackground,
                                  fontSize: 13.0,
                                  fontFamily: 'Spartan'),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      : null,
                  onTap: takeInput,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'MOVIE NAME',
              style: TextStyle(
                fontFamily: 'Spartan',
                fontSize: 18.0,
                color: Color(0xFF457b9d),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                //color: Colors.grey.shade100,
                border: Border.all(
                  width: 4.0,
                  color: Colors.grey.shade100,
                ),
              ),
              child: Center(
                child: TextField(
                  cursorHeight: 30.0,
                  cursorWidth: 2.0,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  decoration: const InputDecoration(
                    //contentPadding: EdgeInsets.only(bottom: 5.0),
                    border: InputBorder.none,
                  ),
                  //textAlign: TextAlign.center,
                  onChanged: (newText) {
                    newTaskTitle = newText;
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'DIRECTOR NAME',
              style: TextStyle(
                fontFamily: 'Spartan',
                fontSize: 18.0,
                color: Color(0xFF457b9d),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                //color: Colors.grey.shade100,
                border: Border.all(
                  width: 4.0,
                  color: Colors.grey.shade100,
                ),
              ),
              child: Center(
                child: TextField(
                  cursorHeight: 30.0,
                  cursorWidth: 2.0,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  decoration: const InputDecoration(
                    //contentPadding: EdgeInsets.only(bottom: 5.0),
                    border: InputBorder.none,
                  ),
                  //textAlign: TextAlign.center,
                  onChanged: (newD) {
                    newDirector = newD;
                  },
                ),
              ),
            ),
            // TextField(
            //   textAlign: TextAlign.center,
            //   onChanged: (newD) {
            //     newDirector = newD;
            //   },
            // ),
            const SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle, newDirector, _imageFile);
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.white,
                width: double.infinity,
                height: 40.0,
                // padding: EdgeInsets.symmetric(
                //   horizontal: 20.0,
                // ),
                child: Container(
                  color: kFloating,
                  child: const Center(
                    child: Text(
                      'ADD',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
