import 'dart:convert';

ResponseApi responseApiFromJson(String str) => ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

class ResponseApi {
    int status;
    String error;
    Data data;

    ResponseApi({
        required this.status,
        required this.error,
        required this.data,
    });

    factory ResponseApi.fromJson(Map<String, dynamic> json) => ResponseApi(
        status: json["status"],
        error: json["error"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    String email;
    String password;
    List<dynamic> participantesDeJugador;

    Data({
        required this.id,
        required this.email,
        required this.password,
        required this.participantesDeJugador,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        participantesDeJugador: List<dynamic>.from(json["participantesDeJugador"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "participantesDeJugador": List<dynamic>.from(participantesDeJugador.map((x) => x)),
    };
}
