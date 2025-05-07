class BottomBarItem {
  final String iconPath;

  const BottomBarItem({required this.iconPath});
}

const List<BottomBarItem> bottomBarItems = [
  BottomBarItem(iconPath: 'assets/icons/add.svg'), // Главная страница
  BottomBarItem(iconPath: 'assets/icons/store.svg'), // Поиск
  BottomBarItem(iconPath: 'assets/icons/cart.svg'), // Профиль
];
