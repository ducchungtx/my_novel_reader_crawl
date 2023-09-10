import 'package:my_novel_reader_crawl/models/chapter.dart';

class NovelUrlInfo {
  String image;
  String url;
  String name;

  NovelUrlInfo({
    required this.name,
    required this.url,
    required this.image,
  });
}

class Novel {
  String name;
  String author;
  String image;
  List<String> genres;
  List<ChapterUrlInfo> chapters;

  Novel({
    required this.name,
    required this.author,
    required this.image,
    required this.genres,
    required this.chapters,
  });
}
