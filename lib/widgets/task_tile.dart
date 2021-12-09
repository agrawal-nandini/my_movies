import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_movies/models/provider_class_of_tasks_list.dart';
import 'package:my_movies/constants.dart';

class TaskTile extends StatelessWidget {
  String taskTitle;
  Function checkBoxCallback;
  String directorName;
  var movieImage;

  TaskTile(
      {required this.taskTitle,
      required this.checkBoxCallback,
      required this.directorName,
      required this.movieImage});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: kRemove,
      elevation: 5.0,
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: kMainBackground,
                // color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                //     .withOpacity(0.5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              decoration: BoxDecoration(
                image: movieImage != null
                    ? DecorationImage(
                        image: FileImage(
                          movieImage,
                        ),
                        fit: BoxFit.fill,
                      )
                    : null,
                color: Colors.grey.shade300,
                // borderRadius: BorderRadius.only(
                //   topLeft: Radius.circular(10.0),
                //   bottomLeft: Radius.circular(10.0),
                // ),
              ),
              child: movieImage == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.movie_outlined,
                          color: Colors.grey,
                          size: 50.0,
                        ),
                      ],
                    )
                  : null,
            ),
          ),
          Expanded(
            flex: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskTitle,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Spartan',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    directorName,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              width: 60.0,
              color: kRemove,
              child: GestureDetector(
                child: Icon(
                  Icons.clear,
                  color: Colors.grey.shade100,
                ),
                onTap: () => checkBoxCallback(),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
