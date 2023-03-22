import 'package:flutter/material.dart';

class Portfolio {
  final Widget icon;
  final String title;
  final String contents;
  final Widget project;
  String? skill;
  List<String>? stack;
  String? github;
  String? google;
  String? apple;

  Portfolio({
    required this.icon,
    required this.title,
    required this.contents,
    required this.project,
    this.skill,
    this.stack,
    this.github = '',
    this.google = '',
    this.apple = '',
  });
}
