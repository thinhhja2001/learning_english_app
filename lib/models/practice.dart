class Practice {
  late String _name;
  late String _iconData;
  late String _part;
  String get part => this._part;
  String get name => _name;
  String get iconData => _iconData;

  Practice({required String name, required String iconData, String? part}) {
    _name = name;
    _iconData = iconData;
    _part = part!;
  }
}
