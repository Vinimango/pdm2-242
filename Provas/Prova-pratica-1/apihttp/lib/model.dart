// lib/model.dart

class Item {
  final int id;
  final String name;
  final String description;

  Item({required this.id, required this.name, required this.description});

  // Método para criar um objeto Item a partir de um mapa JSON
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }

  @override
  String toString() {
    return 'ID: $id\nName: $name\nDescription: $description\n';
  }
}
