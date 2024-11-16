class ModalMenuModel {
  final String title;
  final String pathAssets;
  final void Function()? onTap;

  const ModalMenuModel({required this.title, required this.pathAssets, this.onTap});
}
