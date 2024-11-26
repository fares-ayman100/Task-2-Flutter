class Character {
  late String name;
  late int id;
  late String image;
  late String status;
  late String gender;
  Character.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    id = json["id"];
    image = json["image"];
    status = json["status"];
    status = json["gender"];
  }
}
