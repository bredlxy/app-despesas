import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E), // Cor de fundo escura
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: _buildUserInfoSection(context), // Seção de informações do usuário
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: GestureDetector(
                  onTap: () {
                    // Redireciona para o relatório completo de despesas
                    Navigator.pushNamed(context, '/relatorio');
                  },
                  child: _buildMonthlyExpenseCard(context), // Cartão de despesas mensais
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 23), // Seção de categorias
                child: _buildCategoriesSection(),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: _buildActivitiesSection(), // Seção de atividades recentes
              ),
              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfoSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espaço entre os itens
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Olá, ',
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: 'Philippe!',
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: Image.asset('assets/imagens/ico_config.png', width: 24, height: 24), // Ícone de configurações
              onPressed: () {
                Navigator.pushNamed(context, '/configuracoes');
              },
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/perfil');
              },
              child: const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/imagens/foto.png'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMonthlyExpenseCard(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C2C), // Cor de fundo do cartão
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Despesas deste mês',
                    style: TextStyle(
                        fontFamily: 'Satoshi',
                        color: Color(0xFF9B9B9B),
                        fontSize: 16
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'R\$1.894,36',
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 38,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 24,
          right: 24,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Image.asset('assets/imagens/ico_add.png', width: 30, height: 30), // Ícone de adicionar
            onPressed: () {
              Navigator.pushNamed(context, '/adicionar');
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Categorias',
              style: TextStyle(fontFamily: 'Satoshi', fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
            ),
            TextButton(
              onPressed: () {
                // Ação ao clicar em "Configurar"
                Navigator.pushNamed(context, '/configuracoes');
              },
              child: const Text(
                'Configurar',
                style: TextStyle(fontFamily: 'Satoshi', fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFFF98F6F)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 390,
          child: ListView(
            scrollDirection: Axis.horizontal, // Rolagem horizontal
            physics: const BouncingScrollPhysics(), // Rolagem com bounce
            children: [
              _buildCategoryCard(context, 'Alimentação', 'R\$100,00', 'atualizada há 2 dias', 'assets/imagens/categoria1.png', 'assets/imagens/alimentacao1.png', '+R\$10,00 nesse mês', const Color(0xFF1F1F1F).withOpacity(0.1), const Color(0xFF1F1F1F).withOpacity(0.1)),
              _buildCategoryCard(context, 'Emergências', 'R\$100,00', 'atualizada há 2 dias', 'assets/imagens/categoria2.png', 'assets/imagens/emergencias1.png', '+R\$10,00 nesse mês', const Color(0xFF1F1F1F).withOpacity(0.1), const Color(0xFF1F1F1F).withOpacity(0.1)),
              GestureDetector(
                onTap: () {
                  // Redireciona para o relatório de assinaturas
                  Navigator.pushNamed(context, '/relatorio_assinaturas');
                },
                child: _buildCategoryCard(context, 'Assinaturas', 'R\$100,00', 'atualizada há 2 dias', 'assets/imagens/categoria1.png', 'assets/imagens/assinaturas1.png', '+R\$10,00 nesse mês', const Color(0xFF1F1F1F).withOpacity(0.1), const Color(0xFF1F1F1F).withOpacity(0.1)),
              ),
              _buildCategoryCard(context, 'Investimentos', 'R\$100,00', 'atualizada há 2 dias', 'assets/imagens/categoria2.png', 'assets/imagens/investimentos1.png', '+R\$10,00 nesse mês', const Color(0xFF1F1F1F).withOpacity(0.1), const Color(0xFF1F1F1F).withOpacity(0.1)),
              _buildCategoryCard(context, 'Compras pessoais', 'R\$100,00', 'atualizada há 2 dias', 'assets/imagens/categoria1.png', 'assets/imagens/compraspessoais1.png', '+R\$10,00 nesse mês', const Color(0xFF1F1F1F).withOpacity(0.1), const Color(0xFF1F1F1F).withOpacity(0.1)),
              _buildCategoryCard(context, 'Moradia', 'R\$100,00', 'atualizada há 2 dias', 'assets/imagens/categoria2.png', 'assets/imagens/moradia1.png', '+R\$10,00 nesse mês', const Color(0xFF1F1F1F).withOpacity(0.1), const Color(0xFF1F1F1F).withOpacity(0.1)),
              _buildCategoryCard(context, 'Educação', 'R\$100,00', 'atualizada há 2 dias', 'assets/imagens/categoria1.png', 'assets/imagens/educacao1.png', '+R\$10,00 nesse mês', const Color(0xFF1F1F1F).withOpacity(0.1), const Color(0xFF1F1F1F).withOpacity(0.1)),
              _buildCategoryCard(context, 'Saúde', 'R\$100,00', 'atualizada há 2 dias', 'assets/imagens/categoria2.png', 'assets/imagens/saude1.png', '+R\$10,00 nesse mês', const Color(0xFF1F1F1F).withOpacity(0.1), const Color(0xFF1F1F1F).withOpacity(0.1)),
              _buildCategoryCard(context, 'Lazer', 'R\$100,00', 'atualizada há 2 dias', 'assets/imagens/categoria1.png', 'assets/imagens/lazer1.png', '+R\$10,00 nesse mês', const Color(0xFF1F1F1F).withOpacity(0.1), const Color(0xFF1F1F1F).withOpacity(0.1)),
              _buildCategoryCard(context, 'Serviços', 'R\$100,00', 'atualizada há 2 dias', 'assets/imagens/categoria2.png', 'assets/imagens/servicos1.png', '+R\$10,00 nesse mês', const Color(0xFF1F1F1F).withOpacity(0.1), const Color(0xFF1F1F1F).withOpacity(0.1)),
              _buildCategoryCard(context, 'Outros', 'R\$100,00', 'atualizada há 2 dias', 'assets/imagens/categoria1.png', 'assets/imagens/outros1.png', '+R\$10,00 nesse mês', const Color(0xFF1F1F1F).withOpacity(0.1), const Color(0xFF1F1F1F).withOpacity(0.1)),
              _buildCategoryCard(context, 'Transporte', 'R\$100,00', 'atualizada há 2 dias', 'assets/imagens/categoria2.png', 'assets/imagens/transporte1.png', '+R\$10,00 nesse mês', const Color(0xFF1F1F1F).withOpacity(0.1), const Color(0xFF1F1F1F).withOpacity(0.1)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, String value, String subtitle, String backgroundImagePath, String iconImagePath, String valueIncreaseText, Color iconBackgroundColor, Color bottomContainerColor) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: AssetImage(backgroundImagePath), // Imagem de fundo da categoria
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: iconBackgroundColor, // Cor de fundo do ícone
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset(iconImagePath, width: 30, height: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 16),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: BoxDecoration(
              color: bottomContainerColor, // Cor de fundo do rodapé do cartão
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                Text(
                  valueIncreaseText, // Texto de aumento de valor
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivitiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recentes',
              style: TextStyle(fontFamily: 'Satoshi', fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
            ),
            TextButton(
              onPressed: () {
                // Ação ao clicar em "Ver tudo"
              },
              child: const Text(
                'Ver tudo',
                style: TextStyle(color: Color(0xFFEB5E7F)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            _buildActivityTile('Netflix', 'R\$44,90', 'Assinaturas', 'assets/imagens/assinaturas1.png'),
            _buildActivityTile('Creme dental', 'R\$11,47', 'Saúde', 'assets/imagens/saude2.png'),
            _buildActivityTile('iFood', 'R\$64,87', 'Alimentação', 'assets/imagens/alimentacao1.png'),
          ],
        ),
      ],
    );
  }

  Widget _buildActivityTile(String title, String value, String category, String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: const Color(0xFF262626),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0xFF2C2C2C),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Image.asset(imagePath, width: 24, height: 24, fit: BoxFit.contain),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontFamily: 'Satoshi', fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    category,
                    style: const TextStyle(fontSize: 14, color: Color(0xFF9B9B9B)),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(fontFamily: 'Satoshi', fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
              ),
              const SizedBox(height: 2),
              const Text(
                '2 dias atrás',
                style: TextStyle(fontSize: 14, color: Color(0xFF9B9B9B)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
