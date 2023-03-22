import 'package:flutter/material.dart';

class Experience {
  final Widget icon;
  final String title;
  final String contents;
  final String dateTime;
  String? skill;
  List<String>? stacks;
  String? google;
  String? apple;

  Experience({
    required this.icon,
    required this.title,
    required this.contents,
    required this.dateTime,
    this.skill,
    this.stacks,
    this.google = '',
    this.apple = '',
  });
}
