class AvatarModel {
  AvatarModel({
    this.id,
    this.name,
    this.age,
    this.gender,
    this.pose,
    this.image,
  });

  AvatarModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    age = json['age'] as int?;
    gender = json['gender'] as String?;
    pose = json['pose'] as String?;
    image = json['image'] as String;
  }

  int? id;
  String? name;
  int? age;
  String? gender;
  String? pose;
  String? image;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['age'] = age;
    data['gender'] = gender;
    data['pose'] = pose;
    data['image'] = image;
    return data;
  }
}
