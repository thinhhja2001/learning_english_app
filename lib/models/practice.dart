class Practice {
  late String _name;
  late String _iconData;
  String get name => _name;
  String get iconData => _iconData;
  Practice({required String name, required String iconData}) {
    _name = name;
    _iconData = iconData;
  }
}
