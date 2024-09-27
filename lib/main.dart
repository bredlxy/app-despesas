import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/relatorio_assinaturas_screen.dart';
import 'screens/intro_screen.dart';
import 'screens/register_screen.dart';
import 'screens/login_screen.dart';
import 'screens/reset_password_screen.dart' as reset;
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/adicionar_screen.dart';
import 'screens/perfil_screen.dart';
import 'screens/relatorio_screen.dart';
import 'screens/email_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Satoshi', // Definindo a fonte Satoshi como padrão
        brightness: Brightness.dark, // Se estiver utilizando o tema escuro
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16), // Texto padrão do corpo
          bodyMedium: TextStyle(fontSize: 14),
          titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          titleMedium: TextStyle(fontSize: 18),
        ),
      ),
      initialRoute: '/intro',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/intro': (context) => const IntroScreen(),
        '/registro': (context) => const RegistroScreen(),
        '/login': (context) => const LoginScreen(),
        '/configuracoes': (context) => const ConfiguracoesScreen(),
        '/adicionar': (context) => const NovaDespesaScreen(),
        '/perfil': (context) => const PerfilScreen(),
        '/redefinir': (context) => const reset.RedefinirSenhaScreen(),
        '/relatorio': (context) => const RelatorioDespesasScreen(),
        '/email': (context) => const EmailScreen(),
        '/relatorio_assinaturas': (context) => const RelatorioDespesasAssinaturasScreen(), // Nova rota para a tela de assinaturas
      },
    );
  }
}
