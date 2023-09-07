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
  @override
  void initState() {
    super.initState();
    getPopularNovel(widget.source.baseUrl!, 1);
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
    );
  }
}
