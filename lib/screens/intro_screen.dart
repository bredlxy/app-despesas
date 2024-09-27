import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  double _dragPosition = 0.0; // Armazena a posição do botão deslizante

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo
          Positioned.fill(
            child: Image.asset(
              'assets/imagens/intro.png', // Caminho da imagem de fundo
              fit: BoxFit.cover, // A imagem cobre a tela toda
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Alinha conteúdo à esquerda
                children: [
                  const Spacer(), // Substitui o Expanded por Spacer para empurrar o conteúdo para baixo
                  // Texto principal com diferentes estilos
                  RichText(
                    textAlign: TextAlign.left, // Alinha o texto à esquerda
                    text: const TextSpan(
                      text: 'Controle seus gastos\n',
                      style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 48,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'em '),
                        TextSpan(
                          text: 'um lugar só!',
                          style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Texto secundário explicativo
                  const Text(
                    "Registre e gerencie as suas despesas mensais.",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Contêiner cilíndrico com o botão "Começar" deslizante
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2C2C2C),
                      borderRadius: BorderRadius.circular(50), // Borda arredondada
                    ),
                    child: Stack(
                      children: [
                        // Imagem da seta de fundo
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Image.asset(
                              'assets/imagens/setas.png', // Caminho da imagem da seta
                              width: 210,
                              height: 30,
                            ),
                          ),
                        ),
                        // Botão deslizante "Começar"
                        Positioned(
                          left: _dragPosition,
                          child: GestureDetector(
                            onHorizontalDragUpdate: (details) {
                              setState(() {
                                // Atualiza a posição do botão enquanto arrasta, limitando a área de arrasto
                                _dragPosition = details.localPosition.dx.clamp(0.0, 250.0);
                              });
                            },
                            onHorizontalDragEnd: (details) {
                              // Verifica se o botão foi arrastado o suficiente para continuar
                              if (_dragPosition >= 200.0) {
                                Navigator.pushNamed(context, '/registro'); // Navega para a tela de registro
                              } else {
                                setState(() {
                                  _dragPosition = 0.0; // Retorna o botão para a posição inicial
                                });
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xFFEB5E7F), Color(0xFFF98F6F)], // Gradiente de cores
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                ),
                                borderRadius: BorderRadius.circular(30), // Borda arredondada do botão
                              ),
                              child: ElevatedButton(
                                onPressed: null, // Remove a função de clique
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent, // Sem cor de fundo
                                  shadowColor: Colors.transparent, // Sem sombra
                                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25), // Tamanho do botão
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text(
                                  "Começar",
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
