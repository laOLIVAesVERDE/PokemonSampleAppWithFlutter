class Pokemon {
  final int id;
  final String name;
  final List<String> types;
  final String imageUrl;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.imageUrl
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    List<String> typeToList(dynamic types) {
      List<String> resultList = [];
      for (int i = 0; i < types.length; i++) {
        resultList.add(types[i]['types']['name']);
      }
      return resultList;
    }

    return Pokemon(
        id: json['id'],
        name: json['name'],
        types: typeToList(json['types']),
        imageUrl: json['sprites']['other']['official-artwork']['front_default']
    );
  }
}