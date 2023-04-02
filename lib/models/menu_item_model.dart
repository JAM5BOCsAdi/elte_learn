import 'package:flutter/material.dart';

class MenuItemModel {
  final String title;

  const MenuItemModel({
    required this.title,
  });
}

class MenuItems {
  static const elteQuiz = MenuItemModel(title: 'ELTE');
  static const elteSekQuiz = MenuItemModel(title: 'ELTE SEK');
  static const elteSekPtiQuiz = MenuItemModel(title: 'ELTE SEK PTI');

  static const elteHistory = MenuItemModel(title: 'ELTE ');
  static const elteSekHistory = MenuItemModel(title: 'ELTE SEK ');
  static const elteSekPtiHistory = MenuItemModel(title: 'ELTE SEK PTI ');

  static const elteSekWebsite = MenuItemModel(title: 'ELTE SEK Weboldal');
  static const elteSekFacebook = MenuItemModel(title: 'ELTE SEK Facebook');

  static const elteSekContact = MenuItemModel(title: 'Kapcsolat');
}
