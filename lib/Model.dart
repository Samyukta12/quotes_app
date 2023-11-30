import 'dart:convert';

class Model {
  String? q;
  String? a;
  String? c;
  String? h;

  Model({this.q, this.a, this.c, this.h});

 factory  Model.fromJson(Map json) => Model(
    q: json["q"],
    a: json["a"],
    c: json["c"],
    h: json["h"],
  );
}
