class Source {
  int? id;
  String? name;
  String? baseUrl;
  String? lang;
  bool? isNsfw;
  String? sourceCodeUrl;
  String? typeSource;
  String? iconUrl;
  bool? hasCloudflare;
  String? dateFormat;
  String? dateFormatLocale;
  String? apiUrl;
  String? version;
  bool? isFullData;
  String? appMinVerReq;

  Source({
    this.id = null,
    this.name = "",
    this.baseUrl = "",
    this.lang = "",
    this.typeSource = "",
    this.iconUrl = "",
    this.dateFormat,
    this.dateFormatLocale,
    this.isNsfw = false,
    this.hasCloudflare = false,
    this.sourceCodeUrl = "",
    this.apiUrl = "",
    this.version = "",
    this.isFullData = false,
    this.appMinVerReq = "0.0.21",
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
        name: json["name"],
        id: json["id"] ??
            'mynovelreader-${json["lang"]}.${json["name"]}'.hashCode,
        baseUrl: json["baseUrl"],
        lang: json["lang"],
        typeSource: json["typeSource"],
        iconUrl: json["iconUrl"],
        dateFormat: json["dateFormat"],
        dateFormatLocale: json["dateFormatLocale"],
        isNsfw: json["isNsfw"],
        hasCloudflare: json["hasCloudflare"],
        sourceCodeUrl: json["sourceCodeUrl"],
        apiUrl: json["apiUrl"],
        version: json["version"],
        isFullData: json["isFullData"],
        appMinVerReq: json["appMinVerReq"]);
  }
}
