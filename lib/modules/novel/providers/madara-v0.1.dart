import 'package:http/http.dart' as http;

getPopularNovel(String baseUrl, int page) async {
  try {
    final url = "$baseUrl/novel/page/$page/?m_orderby=views";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print("Success");
    }
  } catch (e) {
    print(e.toString());
  }
}
