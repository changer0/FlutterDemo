import 'dart:convert';

/// 搜索热词
class SearchHotWord {
  final HOT_WORD_TYPE_BOOK = 0; //书
  final HOT_WORD_TYPE_AUTHOR = 1; //作者
  final HOT_WORD_TYPE_LABEL = 2; //标签
  final HOT_WORD_TYPE_CLASSIFY = 3; //分类
  final SEARCH_HINT_TYPE_AUDIO = 6; //听书
  //
  final HOT_WORD_HIGHT = 0; //热词高亮

  String id;
  String keyWord;
  String qurl;
  int type = -1;

  SearchHotWord(this.id, this.keyWord, this.qurl, this.type);

//  Map<String, dynamic> toJson() => {
//    // 注意，我们的方法只有一个语句，这个语句定义了一个 map。
//    // 使用这种语法的时候，Dart 会自动把这个 map 当做方法的返回值
//    ''
//  }

  static List<SearchHotWord> fromJson(Map<String, dynamic> map) {
    List<dynamic> recommend = map['Recommend'];
    List<dynamic> ads = map['ads'] is List<dynamic> ? map['ads'] : null;
    List<dynamic> author = map['author'] is List<dynamic> ? map['author'] : null;
    List<dynamic> books = map['books'] is List<dynamic> ? map['books'] : null;
    List<dynamic> category = map['category'] is List<dynamic> ? map['category'] : null;
    List<SearchHotWord> list = _fromJsonList(recommend);
    list.addAll(_fromJsonList(ads));
    list.addAll(_fromJsonList(author));
    list.addAll(_fromJsonList(books));
    list.addAll(_fromJsonList(category));
    return list;
  }

  static List<SearchHotWord> _fromJsonList(List<dynamic> recommend) {
    List<SearchHotWord> list = List<SearchHotWord>();
    if(recommend == null) return list;
    for(var item in recommend) {
      list.add(SearchHotWord(item['id'], item['name'], item['qurl'], item['type']));
    }
    return list;
  }

  @override
  String toString() {
    return 'SearchHotWord{keyWord: $keyWord}';
  }


}
