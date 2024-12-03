class Character {
  late String name;
  late int charID;
  late String image;
  late String status;
  late String gender;
  late String jobs;
  Character.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    charID = json["id"];
    image = json["image"];
    status = json["status"];
    gender = json["gender"];
    gender = json["jobs"];
  }
}
