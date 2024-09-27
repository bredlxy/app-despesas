import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Necessário para os input formatters

class VerificacaoScreen extends StatelessWidget {
  final String previousPage; // Argumento para saber de qual página veio

  const VerificacaoScreen({super.key, required this.previousPage});

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
          Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 30.0,
                    horizontal: 20.0,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF262626), // Fundo da caixa com opacidade
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Botão Voltar
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // Navegar para a página anterior
                        },
                        child: const Text(
                          "< Voltar",
                          style: TextStyle(
                            color: Color(0xFF9B9B9B),
                            fontSize: 16,
                            decoration: TextDecoration.none, // Sem sublinhado
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Título estilizado
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Verifique sua",
                              style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontSize: 28,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: " identidade.",
                              style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Texto de instrução
                      const Text(
                        "Digite o código enviado ao seu e-mail.",
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF9B9B9B),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Campo de código de verificação (5 dígitos)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(5, (index) {
                          return Container(
                            width: 75, // Aumentei o tamanho das caixas
                            height: 75, // Aumentei o tamanho das caixas
                            margin: const EdgeInsets.symmetric(horizontal: 5.0), // Diminuí o espaço entre elas
                            decoration: BoxDecoration(
                              color: const Color(0xFF333333), // Cor de fundo dos campos
                              borderRadius: BorderRadius.circular(20), // Caixas mais arredondadas
                            ),
                            child: Center(
                              child: TextField(
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24, // Tamanho maior para o texto
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1), // Limita o campo a 1 caractere
                                  FilteringTextInputFormatter.digitsOnly, // Permite apenas números
                                ],
                                decoration: const InputDecoration(
                                  hintText: '0', // Placeholder "0"
                                  hintStyle: TextStyle(
                                    color: Color(0x4D9B9B9B), // Estilo semelhante ao da primeira página
                                    fontSize: 24, // Tamanho maior para o placeholder
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 40),

                      // Botão "Confirmar"
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
                              // Navegação condicional com base na página anterior
                              if (previousPage == '/registro') {
                                Navigator.pushNamed(context, '/home');
                              } else if (previousPage == '/email') {
                                Navigator.pushNamed(context, '/redefinir');
                              }
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
                              "Confirmar",
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
