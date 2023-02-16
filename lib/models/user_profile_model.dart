// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);



class UserProfileModel {
    UserProfileModel({
        this.about,
        this.lastName,
        this.displayName,
        this.firstName,
        this.aboutMe,
    });

    dynamic about;
    String? lastName;
    dynamic displayName;
    String? firstName;
    dynamic aboutMe;

    factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
        about: json["about"],
        lastName: json["last_name"],
        displayName: json["display_name"],
        firstName: json["first_name"],
        aboutMe: json["about_me"],
    );

    Map<String, dynamic> toJson() => {
        "about": about,
        "last_name": lastName,
        "display_name": displayName,
        "first_name": firstName,
        "about_me": aboutMe,
    };
}
