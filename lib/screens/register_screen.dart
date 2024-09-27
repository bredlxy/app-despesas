import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/verification_screen.dart';

class RegistroScreen extends StatelessWidget {
  final bool showBackButton; // Controla a exibição do botão de voltar

  const RegistroScreen({super.key, this.showBackButton = false});

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
          // Conteúdo da tela de registro
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
                      // Botão de voltar (como texto)
                      if (showBackButton)
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // Voltar para a tela anterior
                          },
                          child: const Text(
                            "< Voltar",
                            style: TextStyle(
                              color: Color(0xFF9B9B9B),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      const SizedBox(height: 10), // Espaçamento entre o botão e o título

                      // Título "Junte-se a nós!"
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Junte-se a",
                              style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontSize: 28,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: " nós!",
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

                      // Descrição "Nome completo"
                      const Text(
                        "Nome completo",
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const CustomTextField(
                        hintText: "Ex.: Leonardo Jardim",
                        imagePath: 'assets/imagens/ico_nome.png',
                        showPasswordRequirements: false, // Sem requisitos para Nome
                      ),
                      const SizedBox(height: 20),

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
                        hintText: "Ex.: leojardim@email.com",
                        imagePath: 'assets/imagens/ico_email.png',
                        showPasswordRequirements: false, // Sem requisitos para E-mail
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
                        showPasswordRequirements: true, // Requisitos só para a Senha
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const VerificacaoScreen(previousPage: '/registro'),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent, // Fundo transparente para mostrar o gradiente
                              shadowColor: Colors.transparent, // Remove sombra
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 25,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              "Registrar",
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
  final bool showPasswordRequirements;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.imagePath,
    this.isPassword = false,
    this.showPasswordRequirements = false,
  });

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool _isPasswordVisible = false;
  String _password = '';

  bool hasUpperCase(String password) => password.contains(RegExp(r'[A-Z]'));
  bool hasNumber(String password) => password.contains(RegExp(r'[0-9]'));
  bool hasSpecialCharacter(String password) =>
      password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool hasMinLength(String password) => password.length >= 6;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          obscureText: widget.isPassword && !_isPasswordVisible,
          onChanged: (value) {
            setState(() {
              _password = value;
            });
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF333333),
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: Color(0x4D9B9B9B),
              fontSize: 16,
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w300,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(widget.imagePath, width: 25, height: 25),
            ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 65,
            ),
            suffixIcon: widget.isPassword
                ? GestureDetector(
              onTap: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  _isPasswordVisible
                      ? 'assets/imagens/ico_visibilidade_ativa.png'
                      : 'assets/imagens/ico_visibilidade.png',
                  width: 25,
                  height: 25,
                ),
              ),
            )
                : null,
            suffixIconConstraints: const BoxConstraints(
              minWidth: 65,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 21.0,
              horizontal: 20.0,
            ),
          ),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        if (widget.showPasswordRequirements) _buildPasswordRequirements(),
      ],
    );
  }

  Widget _buildPasswordRequirements() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildPasswordRequirement("6 caracteres", hasMinLength(_password)),
        _buildSeparator(),
        _buildPasswordRequirement("Letra maiúscula", hasUpperCase(_password)),
        _buildSeparator(),
        _buildPasswordRequirement("Número", hasNumber(_password)),
        _buildSeparator(),
        _buildPasswordRequirement("Caractere especial", hasSpecialCharacter(_password)),
      ],
    );
  }

  Widget _buildPasswordRequirement(String text, bool isValid) {
    return Row(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => isValid
              ? const LinearGradient(
            colors: [Color(0xFFEB5E7F), Color(0xFFF98F6F)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ).createShader(bounds)
              : const LinearGradient(
            colors: [Color(0xFF9B9B9B), Color(0xFF9B9B9B)],
          ).createShader(bounds),
          child: Icon(
            isValid ? Icons.check_circle : Icons.radio_button_unchecked,
            color: Colors.white,
            size: 16,
          ),
        ),
        const SizedBox(width: 5),
        ShaderMask(
          shaderCallback: (bounds) => isValid
              ? const LinearGradient(
            colors: [Color(0xFFEB5E7F), Color(0xFFF98F6F)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ).createShader(bounds)
              : const LinearGradient(
            colors: [Color(0xFF9B9B9B), Color(0xFF9B9B9B)],
          ).createShader(bounds),
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSeparator() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        '|',
        style: TextStyle(
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w300,
          color: Color(0xFF9B9B9B),
          fontSize: 18,
        ),
      ),
    );
  }
}
