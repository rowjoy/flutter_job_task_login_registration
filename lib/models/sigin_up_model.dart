// To parse this JSON data, do
//
//     final siginUpModel = siginUpModelFromJson(jsonString);


class SiginUpModel {
    SiginUpModel({
        this.username,
        this.password,
        this.email,
        this.profile,
    });

    String? username;
    String? password;
    String? email;
    Profile? profile;

    factory SiginUpModel.fromJson(Map<String, dynamic> json) => SiginUpModel(
        username: json["username"],
        password: json["password"],
        email: json["email"],
        profile: Profile.fromJson(json["profile"]),
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "email": email,
        "profile": profile!.toJson(),
    };
}

class Profile {
    Profile({
        this.firstName,
        this.lastName,
    });

    String? firstName;
    String? lastName;

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        firstName: json["first_name"],
        lastName: json["last_name"],
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
    };
}
