import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_movies/widgets/task_tile.dart';
import 'package:my_movies/models/provider_class_of_tasks_list.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      //Consumer automatically listens without having to explicitly notifying listeners.
      builder: (context, taskData, child) {
        return ListView.builder(
          itemExtent: 110.0,
          //We use it because it is dynamic
          itemBuilder: (context, index) {
            return TaskTile(
              movieImage: taskData.movies[index].movieImage,
              taskTitle: taskData.movies[index].name,
              directorName: taskData.movies[index].director,
              checkBoxCallback: () {
                taskData.deleteTask(taskData.movies[index]);
              },
            );
          }, //This is a build function, one of the arguments of ListView.builder
          itemCount: taskData.movieCount,
        );
      },
    );
  }
}
