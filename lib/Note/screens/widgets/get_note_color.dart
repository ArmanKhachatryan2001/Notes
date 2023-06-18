
import 'package:flutter/material.dart';

class GetNoteColor{
  static Color? getNoteCardColor(int index) {
    List<Color?> colors = [
      Colors.red[200],
      Colors.blue[200],
      Colors.green[200],
      Colors.yellow[200],
      Colors.orange[200],
      Colors.purple[200],
      Colors.teal[200],
      Colors.pink[200],
      Colors.indigo[200],
      Colors.amber[200],
      Colors.cyan[200],
      Colors.lime[200],
      Colors.deepOrange[200],
      Colors.lightBlue[200],
      Colors.deepPurple[200],
      Colors.lightGreen[200],
      Colors.amber[200],
      Colors.brown[200],
      Colors.grey[200],
      Colors.blueGrey[200]
    ];

    int colorIndex = index % colors.length;
    return colors[colorIndex];
  }

}