
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    int? id;
    String nombre;
    String telefono;
    String ci;
    String email;
    String direccion;
    String password;

    User({
        this.id,
        required this.nombre,
        required this.telefono,
        required this.ci,
        required this.email,
        required this.direccion,
        required this.password,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        nombre: json["nombre"],
        telefono: json["telefono"],
        ci: json["ci"],
        email: json["email"],
        direccion: json["direccion"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "telefono": telefono,
        "ci": ci,
        "email": email,
        "direccion": direccion,
        "password": password,
    };
}
