import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:xpath_selector_html_parser/xpath_selector_html_parser.dart';

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

    List _novels = [];
    var newImages = images.attrs;
    var newNames = names.attrs;

    urls.attrs.asMap().forEach((index, url) {
      _novels.add({
        "url": url,
        "image": newImages[index],
        "name": newNames[index],
      });
    });
    return _novels;
  } catch (e) {
    print(e.toString());
  }
}

getNovelDetail(String url) async {
  try {
    final response = await http.get(Uri.parse(url));
    if(response.statusCode != 200) {
      return null;
    }
    var html = parse(response.body).documentElement!;
    // var name = html.queryXPath("]/div/div/div/div[2]/h1")

  } catch (e) {
    print(e.toString());
  }
}