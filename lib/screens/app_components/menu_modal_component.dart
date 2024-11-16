import 'package:flutter/material.dart';

import '../../app/themes/app_theme.dart';
import '../../data/models/modal_menu_model.dart';
import 'menu_component.dart';

class MenuModalComponent extends StatelessWidget {
  final List<ModalMenuModel> menus;

  const MenuModalComponent({super.key, required this.menus});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppTheme.double.screenH(context) * .45,
      child: GridView.builder(
        itemCount: menus.length,
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return Center(
            child: SizedBox(
              height: 150,
              width: 150,
              child: MenuComponent(
                title: menus[index].title,
                assetIcon: 'assets/icons/check.png',
                onTap: menus[index].onTap,
              ),
            ),
          );
        },
      ),
    );
  }
}
