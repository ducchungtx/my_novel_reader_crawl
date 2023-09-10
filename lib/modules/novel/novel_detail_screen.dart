import 'package:flutter/material.dart';
import 'package:my_novel_reader_crawl/models/novel.dart';
import 'package:my_novel_reader_crawl/modules/novel/chapter_detail.dart';
import 'package:my_novel_reader_crawl/modules/novel/providers/madara-v0.1.dart';
import 'package:my_novel_reader_crawl/utils/next_screen.dart';

class NovelDetailScreen extends StatefulWidget {
  final NovelUrlInfo novelUrlInfo;
  const NovelDetailScreen({super.key, required this.novelUrlInfo});

  @override
  State<NovelDetailScreen> createState() => _NovelDetailScreenState();
}

class _NovelDetailScreenState extends State<NovelDetailScreen> {
  Novel? _novel = null;

  @override
  void initState() {
    super.initState();
    getNovelInfo();
  }

  getNovelInfo() async {
    Novel novelData = await getNovelDetail(widget.novelUrlInfo);
    setState(() {
      _novel = novelData;
    });
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: _novel != null
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Text(_novel!.name),
                    const SizedBox(height: 10),
                    Text(_novel!.author),
                    const SizedBox(height: 10),
                    Text(_novel!.image),
                    const SizedBox(height: 10),
                    Column(
                      children: _novel!.genres.map((genre) {
                        return Text(genre);
                      }).toList(),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: _novel!.chapters.map((chapter) {
                        return InkWell(
                          onTap: () {
                            nextScreen(context,
                                ChapterDetailScreen(chapterUrlInfo: chapter));
                          },
                          child: ListTile(
                            title: Text(chapter.name),
                            subtitle: Text(chapter.url),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              )
            : const Center(
                child: Text("Not found content"),
              ),
      ),
    );
  }
}
