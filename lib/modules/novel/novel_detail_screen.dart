import 'package:flutter/material.dart';
import 'package:my_novel_reader_crawl/models/novel.dart';
import 'package:my_novel_reader_crawl/modules/novel/providers/madara-v0.1.dart';

class NovelDetailScreen extends StatefulWidget {
  final NovelUrlInfo novelUrlInfo;
  const NovelDetailScreen({super.key, required this.novelUrlInfo});

  @override
  State<NovelDetailScreen> createState() => _NovelDetailScreenState();
}

class _NovelDetailScreenState extends State<NovelDetailScreen> {
  dynamic novel;

  @override
  void initState() {
    super.initState();
    getNovelInfo();
  }

  getNovelInfo() async {
    novel =  await getNovelDetail(widget.novelUrlInfo);
    print(novel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.novelUrlInfo.name),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}