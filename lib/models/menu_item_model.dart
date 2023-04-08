import '../utils/consts.dart';

class MenuItemModel {
  final String title;

  const MenuItemModel({
    required this.title,
  });
}

class MenuItems {
  static const elteQuiz = MenuItemModel(title: elte);
  static const elteSekQuiz = MenuItemModel(title: elteSek);
  static const elteSekPtiQuiz = MenuItemModel(title: elteSekPti);

  static const elteHistory = MenuItemModel(title: "$elte ");
  static const elteSekHistory = MenuItemModel(title: "$elteSek ");
  static const elteSekPtiHistory = MenuItemModel(title: "$elteSekPti ");

  static const elteSekWebsite = MenuItemModel(title: elteSekWebsiteTitle);
  static const elteSekFacebook = MenuItemModel(title: elteSekFacebookTitle);

  static const elteSekContact = MenuItemModel(title: contactsTitle);
}
