// To parse this JSON data, do
//
//     final siginModel = siginModelFromJson(jsonString);


class SiginModel {
    SiginModel({
        this.username,
        this.password,
    });

    String? username;
    String? password;

    factory SiginModel.fromJson(Map<String, dynamic> json) => SiginModel(
        username: json["username"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
    };
}
