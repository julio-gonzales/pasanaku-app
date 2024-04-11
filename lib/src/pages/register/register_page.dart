import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:pasanaku_app_movil/src/pages/register/register_controller.dart';
import 'package:pasanaku_app_movil/src/widgets/widgets.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  RegisterController _con = RegisterController();
  
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    },);
  }
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final textStyles = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox( height: 30 ),
              // Icon Banner
              Column(
                
                children: [
                Image.asset(
                  'assets/logo_pasanaku.png',
                  fit: BoxFit.fitWidth,
                ),
                
                const SizedBox( height: 2 ),
                Text('Pasanaku', style: textStyles.titleLarge ),
                ],


              ),
        
              Container(
                height: size.height - 200, // 80 los dos sizebox y 100 el ícono
                width: double.infinity,
                decoration: BoxDecoration(
                  color: scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(100)),
                ),
                child: const _RegisterForm(),
              )
            ],
          ),
        )
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  RegisterController _con = RegisterController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    },);
  }
  
  @override
  Widget build(BuildContext context) {

    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const SizedBox( height: 20 ),
          Text('Registrar Cuenta', style: textStyles.titleMedium ),
          const SizedBox( height: 10 ),

          CustomTextFormField(
            label: 'Nombre completo',
            keyboardType: TextInputType.emailAddress,
            controller: _con.nombreController,
          ),
          const SizedBox( height: 10 ),

          CustomTextFormField(
            label: 'Correo',
            keyboardType: TextInputType.emailAddress,
            controller: _con.emailController,
          ),
          const SizedBox( height: 10 ),

          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            controller: _con.passwordController,
          ),
    
          const SizedBox( height: 10 ),

          CustomTextFormField(
            label: 'Direccion',
            keyboardType: TextInputType.name,
            controller: _con.direccionController,
          ),
    
          const SizedBox( height: 10 ),
          
          CustomTextFormField(
            label: 'FechaNacimiento',
            keyboardType: TextInputType.datetime,
            controller: _con.fechaNaciminetoController,
          ),
          const SizedBox( height: 10 ),
    
          CustomTextFormField(
            label: 'Telefono',
            keyboardType: TextInputType.phone,
            controller: _con.telefonoController,
          ),

          const SizedBox( height: 10 ),

          

          SizedBox(
            width: double.infinity,
            height: 60,
            child: CustomFilledButton(
              text: 'Crear',
              buttonColor: Color(0xFFFDE047),
              onPressed: _con.register,
            )
          ),

          const Spacer( flex: 2 ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('¿Ya tienes cuenta?'),
              TextButton(
                onPressed: (){
                  if ( context.canPop()){
                    return context.pop();
                  }
                  context.go('/login');
                  
                }, 
                child: const Text('Ingresa aquí')
              )
            ],
          ),

          const Spacer( flex: 1),
        ],
      ),
    );
  }
}