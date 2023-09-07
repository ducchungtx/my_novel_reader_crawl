import 'package:go_router/go_router.dart';

import 'package:my_novel_reader_crawl/models/source.dart';
import 'package:my_novel_reader_crawl/modules/home/home_screen.dart';
import 'package:my_novel_reader_crawl/modules/novel/novel_screen.dart';

GoRouter router() {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/novel',
        builder: (context, state) {
          final source = state.extra as Source;
          return NovelScreen(
            key: state.pageKey,
            source: source,
          );
        },
      )
    ],
  );
}
