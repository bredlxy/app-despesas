import 'package:flutter/material.dart';

class ConfiguracoesScreen extends StatefulWidget {
  const ConfiguracoesScreen({super.key});

  @override
  ConfiguracoesScreenState createState() => ConfiguracoesScreenState();
}

class ConfiguracoesScreenState extends State<ConfiguracoesScreen> {
  String selectedCurrency = 'BRL';
  Map<String, bool> categoryStates = {
    'Alimentação': true,
    'Assinaturas': true,
    'Compras pessoais': true,
    'Educação': true,
    'Lazer': true,
    'Outros': true,
    'Emergências': true,
    'Investimentos': true,
    'Moradia': true,
    'Saúde': true,
    'Serviços': true,
    'Transporte': true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: const BoxDecoration(
                            color: Color(0xFF262626),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/imagens/seta_esq.png',
                              width: 15,
                              height: 15,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'Configurações',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Spacer(flex: 2), // Usar flex para ajustar o espaçamento
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(25.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2C2C2C),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Categorias',
                              style: TextStyle(
                                color: Color(0xFF9B9B9B),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Satoshi',
                              ),
                            ),
                            const SizedBox(height: 10),
                            _buildCategoryItem('Alimentação', 'assets/imagens/alimentacao1.png', gradient: true),
                            _buildCategoryItem('Assinaturas', 'assets/imagens/assinaturas1.png', gradient: true),
                            _buildCategoryItem('Compras pessoais', 'assets/imagens/compraspessoais1.png', gradient: true),
                            _buildCategoryItem('Educação', 'assets/imagens/educacao1.png', gradient: true),
                            _buildCategoryItem('Lazer', 'assets/imagens/lazer1.png', gradient: true),
                            _buildCategoryItem('Outros', 'assets/imagens/outros1.png', gradient: true),
                            _buildCategoryItem('Emergências', 'assets/imagens/emergencias1.png', gradient: false),
                            _buildCategoryItem('Investimentos', 'assets/imagens/investimentos1.png', gradient: false),
                            _buildCategoryItem('Moradia', 'assets/imagens/moradia1.png', gradient: false),
                            _buildCategoryItem('Saúde', 'assets/imagens/saude1.png', gradient: false),
                            _buildCategoryItem('Serviços', 'assets/imagens/servicos1.png', gradient: false),
                            _buildCategoryItem('Transporte', 'assets/imagens/transporte1.png', gradient: false),
                            const SizedBox(height: 20),
                            const Text(
                              'Moeda',
                              style: TextStyle(
                                color: Color(0xFF9B9B9B),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Satoshi',
                              ),
                            ),
                            _buildCurrencyOption('BRL', 'Real brasileiro'),
                            _buildCurrencyOption('USD', 'Dólar americano'),
                            _buildCurrencyOption('EUR', 'Euro'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40), // Espaço adicional ao final do scroll
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String title, String imagePath, {required bool gradient}) {
    bool isActive = categoryStates[title] ?? false;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                categoryStates[title] = !isActive;
              });
            },
            child: Opacity(
              opacity: isActive ? 0.9 : 0.2,
              child: Image.asset(
                'assets/imagens/botao1.png',
                width: 20,
                height: 20,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: gradient
                  ? const LinearGradient(
                colors: [Color(0xFFF98F6F), Color(0xFFEB5E7F)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
                  : const LinearGradient(
                colors: [Color(0xFFCEBBB5), Color(0xFF9C8680)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              imagePath,
              width: 24,
              height: 24,
            ),
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF9B9B9B),
              fontSize: 15,
              fontFamily: 'Satoshi',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrencyOption(String currency, String description) {
    bool isActive = selectedCurrency == currency;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCurrency = currency;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Opacity(
              opacity: isActive ? 0.9 : 0.2,
              child: Image.asset(
                'assets/imagens/botao1.png',
                width: 20,
                height: 20,
              ),
            ),
            const SizedBox(width: 18),
            SizedBox(
              width: 50,
              child: Center(
                child: Text(
                  currency,
                  style: const TextStyle(
                    color: Color(0xFF9B9B9B),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Satoshi',
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                description,
                style: const TextStyle(
                  color: Color(0xFF9B9B9B),
                  fontFamily: 'Satoshi',
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
