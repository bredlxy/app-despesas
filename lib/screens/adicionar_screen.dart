import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart'; // Importa a tela HomeScreen, para navegar ao adicionarmos uma nova despesa

class NovaDespesaScreen extends StatefulWidget {
  const NovaDespesaScreen({super.key});

  @override
  NovaDespesaScreenState createState() => NovaDespesaScreenState();
}

class NovaDespesaScreenState extends State<NovaDespesaScreen> {
  String selectedCategory = 'Assinaturas'; // Categoria selecionada inicialmente
  bool _autoRenew = false; // Controle para renovação automática

  // Mapeamento de categorias para seus respectivos ícones
  final Map<String, IconData> _categories = {
    'Alimentação': Icons.fastfood,
    'Assinaturas': Icons.subscriptions,
    'Compras Pessoais': Icons.shopping_bag,
    'Educação': Icons.school,
    'Lazer': Icons.sentiment_satisfied_alt,
    'Outros': Icons.more_horiz,
    'Emergências': Icons.warning,
    'Investimentos': Icons.trending_up,
    'Moradia': Icons.home,
    'Saúde': Icons.favorite,
    'Serviços': Icons.build,
    'Transporte': Icons.directions_car,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F), // Define a cor de fundo do Scaffold
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), // Define a altura da AppBar
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: AppBar(
            backgroundColor: Colors.transparent, // Deixa a AppBar transparente
            elevation: 0, // Remove sombra da AppBar
            centerTitle: true,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Volta para a tela anterior
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color(0xFF262626), // Define a cor de fundo do botão
                    shape: BoxShape.circle, // Formato circular
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/imagens/seta_esq.png', // Caminho para o ícone da seta
                      width: 15,
                      height: 15,
                    ),
                  ),
                ),
              ),
            ),
            title: const Text(
              'Nova despesa',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 120), // Espaçamento entre o topo e o container
              Container(
                width: double.infinity, // Faz o container ocupar toda a largura da tela
                padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF262626), // Cor de fundo do container
                  borderRadius: BorderRadius.circular(50), // Bordas arredondadas
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField(
                      hintText: "Ex: Netflix", // Dica no campo de texto
                      label: "Nome da despesa", // Rótulo do campo
                      iconPath: 'assets/imagens/nome1.png', // Ícone do campo
                    ),
                    const SizedBox(height: 20),
                    _buildDropdownField(), // Campo dropdown para selecionar categorias
                    const SizedBox(height: 20),
                    _buildTextField(
                      hintText: "R\$0,00", // Dica no campo de texto para o valor
                      label: "Valor", // Rótulo do campo de valor
                      iconPath: 'assets/imagens/valor1.png', // Ícone do campo de valor
                    ),
                    const SizedBox(height: 20),
                    _buildAutoRenewSwitch(), // Switch para ativar/desativar renovação automática
                    const SizedBox(height: 30),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFEB5E7F), Color(0xFFF98F6F)], // Gradiente de cores no botão
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                          borderRadius: BorderRadius.circular(30), // Bordas arredondadas do botão
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Ao adicionar a despesa, navega para a HomeScreen
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const HomeScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent, // Remove a cor de fundo padrão
                            shadowColor: Colors.transparent, // Remove a sombra do botão
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            "Adicionar",
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
      ),
    );
  }

  // Cria um campo de texto personalizado com ícone e estilo
  Widget _buildTextField({required String hintText, required String label, required String iconPath}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label, // Exibe o rótulo acima do campo
          style: const TextStyle(
            color: Color(0xFF9B9B9B),
            fontFamily: 'Satoshi',
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF333333), // Cor de fundo do campo
            borderRadius: BorderRadius.circular(20), // Bordas arredondadas
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFF333333), // Cor de fundo do campo
              hintText: hintText, // Texto de dica dentro do campo
              hintStyle: const TextStyle(
                color: Color(0x4D9B9B9B),
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w300,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(iconPath, width: 18, height: 18), // Ícone à esquerda do campo
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none, // Remove a borda padrão do campo
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 20.0,
              ),
            ),
            style: const TextStyle(
              color: Colors.white, // Cor do texto digitado
              fontSize: 16,
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }

  // Cria o campo dropdown para selecionar a categoria da despesa
  Widget _buildDropdownField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Categoria", // Rótulo para o campo dropdown
          style: TextStyle(
            color: Color(0xFF9B9B9B),
            fontFamily: 'Satoshi',
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          width: double.infinity, // Faz o dropdown ocupar toda a largura disponível
          height: 55, // Altura do campo
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          decoration: BoxDecoration(
            color: const Color(0xFF333333), // Cor de fundo do dropdown
            borderRadius: BorderRadius.circular(20),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedCategory, // Categoria atualmente selecionada
              icon: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Image.asset(
                  'assets/imagens/seta_baixo.png', // Ícone da seta do dropdown
                  width: 15,
                  height: 15,
                  color: Colors.white,
                ),
              ),
              isExpanded: true, // Expande o dropdown para a largura total
              dropdownColor: const Color(0xFF333333), // Cor de fundo das opções
              borderRadius: BorderRadius.circular(20), // Bordas arredondadas do menu de opções
              items: _categories.keys.map<DropdownMenuItem<String>>((String category) {
                // Remove acentuações e espaços do nome da categoria
                String categoryKey = removeDiacritics(category.toLowerCase().replaceAll(" ", ""));

                return DropdownMenuItem<String>(
                  value: category,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'assets/imagens/${categoryKey}0.png', // Ícone personalizado da categoria
                          width: 25,
                          height: 25,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        category, // Exibe o nome da categoria
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!; // Atualiza a categoria selecionada
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  // Cria o switch para ativar/desativar a renovação automática
  Widget _buildAutoRenewSwitch() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _autoRenew = !_autoRenew; // Alterna o estado de renovação automática
              });
            },
            child: Opacity(
              opacity: _autoRenew ? 0.9 : 0.2, // Define a opacidade do botão baseado no estado
              child: Image.asset(
                'assets/imagens/botao1.png', // Imagem do botão de alternância
                width: 25,
                height: 25,
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Renovar automaticamente todo mês', // Texto ao lado do switch
            style: TextStyle(
              color: Color(0xFF9B9B9B),
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
