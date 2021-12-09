import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_movies/models/task.dart';
import 'package:image_picker/image_picker.dart';

class TaskData extends ChangeNotifier {
  List<Movie> movies = [
    // Movie(name: 'Harry Potter: Prisoner of Azkaban', director: 'JK'),
    // Movie(name: 'Twilight', director: 'Stephanie Meyers'),
  ];

  int get movieCount {
    return movies.length;
  }

  void addTask(String taskName, String directorName, var movieimage) {
    movies.add(
      Movie(
        name: taskName,
        director: directorName,
        movieImage: movieimage,
      ),
    );
    print(taskName);
    print(directorName);
    print(movieimage);
    notifyListeners();
  }

  void deleteTask(Movie task) {
    movies.remove(task);
    notifyListeners();
  }
}
