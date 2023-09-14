class User {
  int? id;
  String? name;
  String? sexe;
  int? age;
  bool isLoading;

  User({this.id, this.name, this.sexe, this.age, required this.isLoading});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        isLoading: json['isLoading'],
        name: json['name'],
        sexe: json['sexe'],
        age: json['age']
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic> {
      'id': id,
      'name': name,
      'sexe': sexe,
      'age': age,
      'isLoading': isLoading
    };
  }
}