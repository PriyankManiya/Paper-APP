class Country {
  String name;
  String code;

  Country({this.name, this.code});

  factory Country.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Country(
      name: json["name"],
      code: json["code"],
    );
  }

  static List<Country> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => Country.fromJson(item)).toList();
  }

   String userAsString() {
    return '${this.name} ${this.name}';
  }

  bool userFilterByCreationDate(String filter) {
    return this?.name?.toString()?.contains(filter);
  }
  bool isEqual(Country model) {
    return this?.code == model?.code;
  }
  @override
  String toString() => name;
}