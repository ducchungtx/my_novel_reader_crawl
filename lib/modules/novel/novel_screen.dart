import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:my_novel_reader_crawl/models/source.dart';
import 'package:my_novel_reader_crawl/modules/novel/providers/madara-v0.1.dart';

class NovelScreen extends StatefulWidget {
  final Source source;

  const NovelScreen({
    super.key,
    required this.source,
  });

  @override
  State<NovelScreen> createState() => _NovelScreenState();
}

class _NovelScreenState extends State<NovelScreen> {
  List _novels = [];

  @override
  void initState() {
    super.initState();
    getNovels();
  }

  getNovels() async {
    var novels = await getPopularNovel(widget.source.baseUrl!, 1);
    setState(() {
      _novels = novels;
    });
  }

  Widget novelItemRender(novel) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 2, child: Image.network(novel["image"])),
          Expanded(flex: 3, child: Text(novel["name"]))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final route = GoRouter.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.source.name!),
        leading: BackButton(
          onPressed: () {
            route.go("/");
          },
        ),
      ),
      body: _novels.isEmpty
          ? const Center(child: Text("Nothing to show"))
          : ListView(
              children: _novels.map((novel) {
                return novelItemRender(novel);
              }).toList(),
            ),
    );
  }
}
