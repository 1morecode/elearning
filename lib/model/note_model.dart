//
// Created by 1 More Code on 15/05/24.
//

class Note {
  String id;
  String subjectId;
  String title;
  String writer;
  int pages;
  int views;
  String unit;
  String thumbnail;
  String file;

  Note({
    required this.id,
    required this.subjectId,
    required this.title,
    required this.views,
    required this.file,
    required this.pages,
    required this.thumbnail,
    required this.unit,
    required this.writer,
  });
}
