import 'package:go_router/go_router.dart';
import 'package:my_novel_reader_crawl/modules/home/home_screen.dart';

GoRouter router() {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
