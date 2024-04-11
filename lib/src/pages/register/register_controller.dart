import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pasanaku_app_movil/src/models/response_api.dart';
import 'package:pasanaku_app_movil/src/models/user.dart';
import 'package:pasanaku_app_movil/src/provider/user_provider.dart';

class RegisterController{

  BuildContext? context;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController direccionController = new TextEditingController();
  TextEditingController fechaNaciminetoController = new TextEditingController();
  TextEditingController telefonoController = new TextEditingController();
  TextEditingController nombreController = new TextEditingController();
  TextEditingController ciController = new TextEditingController();
  

  UserProvider usersProviders = UserProvider();

  Future? init(BuildContext context){
    this.context = context;
    usersProviders.init(context);
  }

  


  void register()async{
    String email = emailController.text;
    String password = passwordController.text;
    String direccion = direccionController.text;
    String nombre = nombreController.text;
    String fechaNacimiento = fechaNaciminetoController.text;
    String telefono = telefonoController.text;
    String ci = ciController.text;


    User user = User (
      nombre: nombre, 
      telefono: telefono, 
      ci: ci, 
      email: email, 
      direccion: direccion, 
      password: password
    );

    ResponseApi? responseApi = await usersProviders.create(user);

    print('${email}, ${telefono}, ${fechaNacimiento}, ${password}, ${nombre}, ${direccion}');
  }

}