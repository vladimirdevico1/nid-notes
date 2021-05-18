class Note {
  final int? id;
  final String title;
  final String content;

  Note(this.title, this.content, {this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }

}