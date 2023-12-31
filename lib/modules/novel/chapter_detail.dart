import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:my_novel_reader_crawl/models/chapter.dart';
import 'package:my_novel_reader_crawl/modules/novel/providers/madara-v0.1.dart';

class ChapterDetailScreen extends StatefulWidget {
  ChapterUrlInfo chapterUrlInfo;
  ChapterDetailScreen({super.key, required this.chapterUrlInfo});

  @override
  State<ChapterDetailScreen> createState() => _ChapterDetailScreenState();
}

class _ChapterDetailScreenState extends State<ChapterDetailScreen> {
  List _contents = [];

  @override
  void initState() {
    super.initState();
    getChapterData();
  }

  getChapterData() async {
    var chapter = await getChapterUrl(widget.chapterUrlInfo);
    setState(() {
      _contents = chapter as List;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          widget.chapterUrlInfo.name,
          maxLines: 1,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: _contents.map((e) {
              return Text(e);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
