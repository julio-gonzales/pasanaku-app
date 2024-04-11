import 'package:go_router/go_router.dart';
//import 'package:pasanaku/views/auth/auth.dart';
//import 'package:pasanaku/views/home/presentation/screens/home_screen.dart';
//import 'package:pasanaku/views/invitaciones/invitaciones.dart';
import 'package:pasanaku_app_movil/src/pages/login/login_page.dart';
import 'package:pasanaku_app_movil/src/pages/register/register_page.dart';


final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    ///* Auth Routes
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
    /*
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/invitaciones-pendientes',
      builder: (context, state) => const InvitacionesPendientesScreen(),
    )*/

 ],
  
);