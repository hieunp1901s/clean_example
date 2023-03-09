import 'dart:convert';
import 'dart:developer';

mixin ShowLog {
  void showRequest(String url, dynamic body) {
    log('''
    ----------REQUEST BODY----------
    url: $url
    ${body == null ? 'EMPTY REQUEST' : jsonToPrettyString(body)}
    ''');
  }

  void showResponse(dynamic json) {
    log('''
    ----------RESPONSE BODY----------
    ${jsonToPrettyString(json)}
    ''');
  }

  String jsonToPrettyString(dynamic json) {
    const encoder = JsonEncoder.withIndent('  ');
    const fromStr = '\n';
    const replaceStr = '\n    ';
    final logStr = encoder.convert(json).replaceAll(fromStr, replaceStr);
    return logStr;
  }

  String queryToString(Map<String, dynamic>? map) {
    if (map == null) return '';
    var queryStr = '?';

    map.forEach((key, value) {
      queryStr += '$key=$value&';
    });

    return queryStr.substring(0, queryStr.length - 1);
  }
}