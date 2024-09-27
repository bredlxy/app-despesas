import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/verification_screen.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Container para a imagem de fundo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/imagens/background.png'), // Definindo a imagem de fundo
                fit: BoxFit.cover, // Faz a imagem ocupar todo o fundo disponível
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0), // Remove padding extra
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centraliza os elementos verticalmente
              crossAxisAlignment: CrossAxisAlignment.center, // Centraliza os elementos horizontalmente
              children: [
                // Container para a caixa de conteúdo
                Container(
                  width: double.infinity, // Ocupa toda a largura disponível
                  padding: const EdgeInsets.symmetric(
                    vertical: 30.0,
                    horizontal: 20.0,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF262626), // Define a cor de fundo do container
                    borderRadius: BorderRadius.circular(50), // Bordas arredondadas
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Alinha o conteúdo à esquerda
                    children: [
                      // Botão "Voltar" para navegar para a tela anterior
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // Navegar de volta para a tela anterior
                        },
                        child: const Text(
                          "< Voltar", // Texto do botão "Voltar"
                          style: TextStyle(
                            color: Color(0xFF9B9B9B), // Cor do texto
                            fontSize: 16, // Tamanho do texto
                            decoration: TextDecoration.none, // Remove sublinhado padrão
                          ),
                        ),
                      ),
                      const SizedBox(height: 20), // Espaçamento entre o botão e o título

                      // Título estilizado da página
                      const Text(
                        "Redefina sua senha.",
                        style: TextStyle(
                          fontFamily: 'Satoshi', // Fonte personalizada
                          fontSize: 28, // Tamanho do título
                          fontWeight: FontWeight.w500, // Peso da fonte
                          color: Colors.white, // Cor do texto
                        ),
                      ),
                      const SizedBox(height: 30), // Espaçamento entre o título e a próxima seção

                      // Texto explicativo com instruções
                      const Text(
                        "Digite o seu e-mail para receber o código de verificação.",
                        style: TextStyle(
                          fontFamily: 'Satoshi', // Fonte personalizada
                          fontSize: 16, // Tamanho do texto
                          fontWeight: FontWeight.w300, // Peso mais leve para o texto de instrução
                          color: Color(0xFF9B9B9B), // Cor mais clara para o texto de instrução
                        ),
                      ),
                      const SizedBox(height: 20), // Espaçamento entre o texto e o campo de e-mail

                      // Campo de entrada de e-mail com ícone
                      Container(
                        width: double.infinity, // O campo ocupa toda a largura disponível
                        height: 60, // Altura do campo de texto
                        decoration: BoxDecoration(
                          color: const Color(0xFF333333), // Cor de fundo do campo
                          borderRadius: BorderRadius.circular(20), // Bordas arredondadas
                        ),
                        child: const TextField(
                          keyboardType: TextInputType.emailAddress, // Define o teclado para entrada de e-mail
                          style: TextStyle(
                            color: Colors.white, // Cor do texto inserido
                            fontSize: 16, // Tamanho do texto
                          ),
                          decoration: InputDecoration(
                            hintText: 'Seu endereço de e-mail', // Placeholder dentro do campo
                            hintStyle: TextStyle(
                              color: Color(0x4D9B9B9B), // Cor do placeholder
                              fontSize: 16, // Tamanho do placeholder
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(10.0), // Padding ao redor do ícone
                              child: Image(
                                image: AssetImage('assets/imagens/ico_email.png'), // Ícone à esquerda
                                width: 25, // Largura do ícone
                                height: 25, // Altura do ícone
                              ),
                            ),
                            prefixIconConstraints: BoxConstraints(
                              minWidth: 65, // Espaçamento entre o ícone e o texto
                            ),
                            border: InputBorder.none, // Remove borda padrão do campo
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 21.0, // Ajusta o preenchimento vertical
                              horizontal: 20.0, // Preenchimento horizontal ajustado
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40), // Espaçamento entre o campo e o botão

                      // Botão "Enviar" para submeter o e-mail e avançar para a tela de verificação
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFEB5E7F), Color(0xFFF98F6F)], // Gradiente de cores para o botão
                              begin: Alignment.topRight, // Começo do gradiente
                              end: Alignment.bottomLeft, // Fim do gradiente
                            ),
                            borderRadius: BorderRadius.circular(30), // Bordas arredondadas
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // Navega para a tela de verificação ao clicar em "Enviar"
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const VerificacaoScreen(previousPage: '/email'),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent, // Remove cor de fundo padrão para mostrar o gradiente
                              shadowColor: Colors.transparent, // Remove sombra do botão
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25), // Padding dentro do botão
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30), // Bordas arredondadas do botão
                              ),
                            ),
                            child: const Text(
                              "Enviar", // Texto do botão
                              style: TextStyle(
                                fontSize: 18, // Tamanho do texto
                                color: Colors.white, // Cor do texto
                                fontFamily: 'Satoshi', // Fonte personalizada
                                fontWeight: FontWeight.w400, // Peso do texto
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
