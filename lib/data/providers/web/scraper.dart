import 'package:web_scraper/web_scraper.dart';

String selector = "#number";
final webScraper = WebScraper('https://tejaratnews.com/');

Future<Map<String, double>> getValues() async {
  return {"usd": await getUsd(), "eur": await getEur()};
}

Future<double> getEur() async {
  String value = "";
  if (await webScraper.loadWebPage('/قیمت-یورو')) {
    List<Map<String, dynamic>> elements = webScraper.getElement(selector, []);
    value = elements[0]["title"].replaceAll(",", "");
  }
  return double.parse(value);
}

Future<double> getUsd() async {
  String value = "";
  if (await webScraper.loadWebPage('/قیمت-دلار')) {
    List<Map<String, dynamic>> elements = webScraper.getElement(selector, []);
    value = elements[0]["title"].replaceAll(",", "");
  }
  return double.parse(value);
}
