
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:my_novel_reader_crawl/models/novel.dart';
import 'package:xpath_selector_html_parser/xpath_selector_html_parser.dart';

final statusList = [
    {
      "OnGoing": 0,
      "Продолжается": 0,
      "Updating": 0,
      "Em Lançamento": 0,
      "Em lançamento": 0,
      "Em andamento": 0,
      "Em Andamento": 0,
      "En cours": 0,
      "Ativo": 0,
      "Lançando": 0,
      "Đang Tiến Hành": 0,
      "Devam Ediyor": 0,
      "Devam ediyor": 0,
      "In Corso": 0,
      "In Arrivo": 0,
      "مستمرة": 0,
      "مستمر": 0,
      "En Curso": 0,
      "En curso": 0,
      "Emision": 0,
      "En marcha": 0,
      "Publicandose": 0,
      "En emision": 0,
      "连载中": 0,
      "Completed": 1,
      "Completo": 1,
      "Completado": 1,
      "Concluído": 1,
      "Concluido": 1,
      "Finalizado": 1,
      "Terminé": 1,
      "Hoàn Thành": 1,
      "مكتملة": 1,
      "مكتمل": 1,
      "已完结": 1,
      "On Hold": 2,
      "Pausado": 2,
      "En espera": 2,
      "Canceled": 3,
      "Cancelado": 3,
    }
  ];

getPopularNovel(String baseUrl, int page) async {
  try {
    final url = "$baseUrl/novel/page/$page/?m_orderby=views";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode != 200) {
      return null;
    }
    final html = parse(response.body).documentElement!;
    // get urls
    var urls = html.queryXPath('//*[@class^="post-title"]/h3/a/@href');
    var images = html.queryXPath('//*[@id^="manga-item"]/a/img/@data-src');
    var names = html.queryXPath('//*[@id^="manga-item"]/a/@title');

    List<NovelUrlInfo> _novels = [];
    var newImages = images.attrs;
    var newNames = names.attrs;

    urls.attrs.asMap().forEach((index, url) {
      _novels.add(NovelUrlInfo(name: newNames[index]!, url: url!, image: newImages[index]!));
    });
    return _novels;
  } catch (e) {
    print(e.toString());
  }
}

getNovelDetail(NovelUrlInfo novelUrlInfo) async {
  try {
    print(novelUrlInfo.url);
    final response = await http.get(Uri.parse(novelUrlInfo.url));
    if(response.statusCode != 200) {
      return null;
    }
    var html = parse(response.body).documentElement!;
    var author = html.querySelector(".post-title h1")!.text;
    var imageUrl = html.querySelector(".summary_image img[data-src]")!.attributes["data-src"];
    var status = html.querySelectorAll("div.summary-content");

    print(author);
    print(imageUrl);
    print(status);
  } catch (e) {
    print(e.toString());
  }
}