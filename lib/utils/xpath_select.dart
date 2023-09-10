import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as hp;
import 'package:my_novel_reader_crawl/utils/reg_exp_matcher.dart';

///Returns all descendant nodes matching the given selectors, using a preorder traversal.
String querySelectorAll(String html, String selector, int typeElement,
    String attributes, int typeRegExp, int position, String join) {
  try {
    var parse = parser.parse(html);
    final a = parse.querySelectorAll(selector);

    List<dynamic> res = [];
    for (var element in a) {
      //text
      if (typeElement == 0) {
        res.add(element.text.trim().trimLeft().trimRight());
      }

      //innerHtml
      else if (typeElement == 1) {
        res.add(element.innerHtml.trim().trimLeft().trimRight());
      }

      //outerHtml
      else if (typeElement == 2) {
        res.add(element.outerHtml.trim().trimLeft().trimRight());
      }

      //attributes
      else if (typeElement == 3) {
        res.add(element.attributes[attributes]!.trim().trimLeft().trimRight());
      }
    }
    // if (typeRegExp == 0) is the default parameter
    if (typeRegExp == 0) {
      //join the list
      if (position == 0) {
        return res.join(join);
      }

      //return first element of the list
      else if (position == 1) {
        return res.first;
      }

      //return last element of the list
      return res.last;
    }

    List<dynamic> resRegExp = [];
    for (var element in res) {
      //get first element of href that match
      if (typeRegExp == 1) {
        resRegExp.add(regHrefMatcher(element.trim().trimLeft().trimRight()));
      }

      //get first element of src that match
      else if (typeRegExp == 2) {
        resRegExp.add(regSrcMatcher(element.trim().trimLeft().trimRight()));
      }

      //get first element of datasrc that match
      else if (typeRegExp == 3) {
        resRegExp.add(regDataSrcMatcher(element.trim().trimLeft().trimRight()));
      }

      //get first element of img that match
      else if (typeRegExp == 4) {
        resRegExp.add(regImgMatcher(element.trim().trimLeft().trimRight()));
      }
    }

    //join the resRegExp list
    if (position == 0) {
      return resRegExp.join(join);
    }

    //return first element of the resRegExp list
    else if (position == 1) {
      return resRegExp.first.trim().trimLeft().trimRight();
    }

    //return last element of the resRegExp list
    return resRegExp.last.trim().trimLeft().trimRight();
  } catch (e) {
    _botToast(e.toString());
    throw Exception(e);
  }
}

void _botToast(String title) {
  BotToast.showSimpleNotification(
    onlyOne: true,
    dismissDirections: [DismissDirection.horizontal, DismissDirection.down],
    align: const Alignment(0, 0.99),
    duration: const Duration(seconds: 10),
    title: title,
  );
}
