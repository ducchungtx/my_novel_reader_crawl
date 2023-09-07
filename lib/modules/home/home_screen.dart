import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:go_router/go_router.dart';
import 'package:my_novel_reader_crawl/models/source.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Source> _listSources = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    try {
      // Đọc tệp JSON
      final jsonString = await rootBundle.loadString('assets/data/index.json');
      // Phân tích chuỗi JSON thành một đối tượng Dart
      final jsonData = jsonDecode(jsonString);
      // Bây giờ bạn có thể làm gì đó với dữ liệu JSON ở đây
      setState(() {
        _listSources = (jsonData as List)
            .map((source) => Source.fromJson(source))
            .toList();
      });
    } catch (error) {
      print('Lỗi: $error');
    }
  }

  Widget renderItem(Source source, GoRouter route) {
    return Hero(
      tag: source.name!,
      child: Material(
        child: ListTile(
          title: Text(
            source.name!,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            source.baseUrl!,
            style: const TextStyle(color: Colors.white),
          ),
          tileColor: Colors.cyan,
          onTap: () {
            route.go('/novel', extra: source);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final route = GoRouter.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Container(
        color: Colors.black12,
        padding: const EdgeInsets.all(10),
        child: _listSources.isEmpty
            ? const Center(
                child: Text("Nothing to get"),
              )
            : Column(
                children: _listSources
                    .map((source) => Column(
                          children: [
                            renderItem(source, route),
                            const SizedBox(height: 10),
                          ],
                        ))
                    .toList(),
              ),
      ),
    );
  }
}
