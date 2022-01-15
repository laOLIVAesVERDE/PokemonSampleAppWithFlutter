class Favorite {
  final int pokeId;
  Favorite({
    required this.pokeId
  });
  Map<String, dynamic> toMap() => {"id" : pokeId};
}