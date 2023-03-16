import 'package:flutter/material.dart';

class MenuItemModel {
  final String title;
  final IconData icon;

  const MenuItemModel({
    required this.title,
    required this.icon,
  });
}

class MenuItems {
  static const elteQuiz = MenuItemModel(title: 'ELTE', icon: Icons.payment);
  static const elteSekQuiz = MenuItemModel(title: 'ELTE SEK', icon: Icons.payment);
  static const elteSekPtiQuiz = MenuItemModel(title: 'ELTE SEK PTI', icon: Icons.payment);

  static const elteHistory = MenuItemModel(title: 'ELTE ', icon: Icons.payment);
  static const elteSekHistory = MenuItemModel(title: 'ELTE SEK ', icon: Icons.payment);
  static const elteSekPtiHistory = MenuItemModel(title: 'ELTE SEK PTI ', icon: Icons.payment);

  static const elteSekWebsite = MenuItemModel(title: 'ELTE SEK Weboldal', icon: Icons.payment);
  static const elteSekFacebook = MenuItemModel(title: 'ELTE SEK Facebook', icon: Icons.payment);

  static const elteSekContact = MenuItemModel(title: 'Kapcsolat', icon: Icons.payment);

  // static const all = <MenuItemModel>[
  //   elteQuiz,
  //   elteSekQuiz,
  //   elteSekPtiQuiz,
  //   elteHistory,
  //   elteSekHistory,
  //   elteSekPtiHistory,
  //   elteSekWebsite,
  //   elteSekFacebook,
  //   elteSekContact,
  // ];
}
