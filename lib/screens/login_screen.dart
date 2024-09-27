import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/register_screen.dart';

import 'email_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/imagens/background.png'), // Caminho da imagem de fundo
                fit: BoxFit.cover, // Faz a imagem cobrir todo o fundo
              ),
            ),
          ),
          // Conteúdo da tela de login
          Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity, // Faz o Container ocupar toda a largura da tela
                  padding: const EdgeInsets.symmetric(
                    vertical: 30.0, // Define o padding vertical (ajuste esse valor conforme necessário)
                    horizontal: 20.0, // Padding horizontal permanece o mesmo
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF262626), // Fundo da caixa com opacidade
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Alinha o conteúdo à esquerda
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Bom te ver",
                              style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontSize: 28,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: " novamente!",
                              style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Descrição "E-mail"
                      const Text(
                        "E-mail",
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const CustomTextField(
                        hintText: "Seu endereço de cadastro",
                        imagePath: 'assets/imagens/ico_email.png',
                        isPassword: false,
                      ),
                      const SizedBox(height: 20),

                      // Descrição "Senha"
                      const Text(
                        "Senha",
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const CustomTextField(
                        hintText: "************",
                        imagePath: 'assets/imagens/ico_senha.png',
                        isPassword: true,
                      ),
                      const SizedBox(height: 15),

                      // Textos "Esqueci a minha senha" e "Quero criar uma conta" um embaixo do outro
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navega para a tela de verificação de senha
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EmailScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Esqueci a minha senha",
                              style: TextStyle(
                                color: Color(0xFF9B9B9B),
                                fontSize: 14,
                                decoration: TextDecoration.none, // Sem sublinhado
                              ),
                            ),
                          ),
                          const SizedBox(height: 10), // Espaço entre os textos
                          GestureDetector(
                            onTap: () {
                              // Navega para a tela de registro e passa o parâmetro showBackButton
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegistroScreen(showBackButton: true),
                                ),
                              );
                            },
                            child: const Text(
                              "Quero criar uma conta",
                              style: TextStyle(
                                color: Color(0xFF9B9B9B),
                                fontSize: 14,
                                decoration: TextDecoration.none, // Sem sublinhado
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // Centraliza o botão
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFEB5E7F), Color(0xFFF98F6F)], // Degradê
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/home');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent, // Fundo transparente para mostrar o gradiente
                              shadowColor: Colors.transparent, // Remove sombra
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              "Entrar",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String imagePath;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.imagePath,
    this.isPassword = false,
  });

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool _isPasswordVisible = false; // Controla a visibilidade da senha

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPassword && !_isPasswordVisible, // Alterna visibilidade da senha
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF333333), // Cor de fundo das caixas de texto
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Color(0x4D9B9B9B),
          fontSize: 16, // Aumenta o tamanho do placeholder
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0), // Ajuste opcional do tamanho da imagem
          child: Image.asset(widget.imagePath, width: 25, height: 25), // Ícone ajustado
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 65, // Aumenta o espaço entre o ícone e o placeholder
        ),
        suffixIcon: widget.isPassword
            ? Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible; // Alterna visibilidade
              });
            },
            child: Image.asset(
              _isPasswordVisible
                  ? 'assets/imagens/ico_visibilidade_ativa.png' // Ícone para senha visível
                  : 'assets/imagens/ico_visibilidade.png', // Ícone para senha oculta
              width: 25,
              height: 25,
            ),
          ),
        )
            : null,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 65, // Espaço entre o ícone de visibilidade e a borda direita
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 21.0, // Ajuste do preenchimento vertical
          horizontal: 20.0, // Preenchimento horizontal ajustado
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16, // Tamanho do texto
      ),
    );
  }
}
