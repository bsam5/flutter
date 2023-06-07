class UserModel {
  int? id;
  String? name;
  String? email;

  UserModel(this.id, this.name, this.email);
  UserModel.fromMao(Map<dynamic, dynamic> map) {
    id = map['id'];
    email = map['email'];
    name = map['name'];
  }
}
