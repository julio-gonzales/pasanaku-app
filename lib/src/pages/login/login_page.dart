import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:pasanaku_app_movil/src/pages/login/login_controller.dart';
import 'package:pasanaku_app_movil/src/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _con =  LoginController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    },);
  }


  @override
  Widget build(BuildContext context) {
    print('metodo build');
    final size = MediaQuery.of(context).size;
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
      
        body: Stack(
          fit: StackFit.expand,
          children: [ SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox( height: 30 ),
                // Icon Banner
                Image.asset(
                  'assets/logo_pasanaku.png',
                  fit: BoxFit.fitWidth,
                ),
                
              
                Container(
                  height: size.height - 260, // 80 los dos sizebox y 100 el ícono
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
                  ),
                  child: _LoginForm(),
                )
              ],
            ),
          ),]
        )
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final LoginController _con = LoginController();
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
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [

          const SizedBox( height: 2 ),
          Text('Pasanaku', style: textStyles.titleLarge ),
          

          const SizedBox( height: 50 ),
          Text('Iniciar Sesión', style: textStyles.titleMedium ),
          const SizedBox( height: 70 ),

          CustomTextFormField(
            label: 'Correo',
            keyboardType: TextInputType.emailAddress,
            controller: _con.emailController,
          ),
          const SizedBox( height: 30 ),

          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            controller: _con.passwordController,
            
            
          ),
    
          const SizedBox( height: 30 ),

          SizedBox(
            width: double.infinity,
            height: 60,
            child: CustomFilledButton(
              text: 'Ingresar',
              buttonColor: Color(0xFFFDE047),
              onPressed: _con.login,
                //Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
              
            )
          ),

          const Spacer( flex: 1 ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('¿No tienes cuenta?'),
              TextButton(
                onPressed: ()=> context.push('/register'), 
                child: const Text('Crea una aquí', style: TextStyle(color: Color(0xff4339B0), fontSize: 16),)
              )
            ],
          ),

          const Spacer( flex: 3),
        ],
      ),
    );
  }
}