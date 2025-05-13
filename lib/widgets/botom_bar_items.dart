class BottomBarItem {
  final String iconPath;

  const BottomBarItem({required this.iconPath});
}

const List<BottomBarItem> bottomBarItems = [
  BottomBarItem(iconPath: 'assets/icons/add.svg'),
  BottomBarItem(iconPath: 'assets/icons/store.svg'), 
  BottomBarItem(iconPath: 'assets/icons/cart.svg'), 
  BottomBarItem(iconPath: 'assets/icons/community.svg'), 
];
