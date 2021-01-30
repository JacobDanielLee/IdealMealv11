import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idealmealv11/DefaultMenu.dart';
import 'package:idealmealv11/Homepage5.dart';
import 'package:idealmealv11/dishes.dart';
import 'package:idealmealv11/dishes_service.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Category {
  Category({
    this.priKey,
    this.name,
    this.dishes

  });

  int priKey;
  String name;
  var dishes = [];

}