import 'package:flutter/material.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  PerfilScreenState createState() => PerfilScreenState();
}

class PerfilScreenState extends State<PerfilScreen> {
  String selectedDay = "20"; // Valor inicial do período mensal
  bool _isPasswordVisible = false; // Controle de visibilidade da senha
  final String _password = "#abc12345"; // Senha fixa para exibição
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController(text: _password);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80), // Define a altura da AppBar com padding
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0), // Adiciona padding no topo
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20.0), // Padding opcional para a esquerda
              child: GestureDetector(
                onTap: () {
                  // Redireciona para a página /home
                  Navigator.pushNamed(context, '/home');
                },
                child: Container(
                  width: 60, // Tamanho do círculo ajustado
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color(0xFF262626), // Cor de fundo do círculo
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/imagens/seta_esq.png', // Caminho da imagem da seta
                      width: 15, // Largura da seta ajustada
                      height: 15, // Altura da seta ajustada
                      fit: BoxFit.contain, // Garante que a imagem seja contida no espaço
                    ),
                  ),
                ),
              ),
            ),
            title: const Text(
              'Seu perfil',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w400,
              ),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    // Redireciona para a página /login
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Container(
                    width: 60, // Tamanho do círculo ajustado
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Color(0xFF262626), // Cor de fundo do círculo
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/imagens/exit.png', // Caminho da imagem do botão de saída
                        width: 18, // Largura ajustada da imagem de saída
                        height: 18, // Altura ajustada da imagem de saída
                        fit: BoxFit.contain, // Garante que a imagem seja contida no espaço
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0), // Padding horizontal para os elementos no corpo
            child: Column(
              children: [
                const SizedBox(height: 50),
                // Imagem de perfil
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/imagens/foto.png'),
                ),
                const SizedBox(height: 10),
                TextButton.icon(
                  onPressed: () {
                    // Função de alterar foto
                  },
                  icon: const Icon(Icons.camera_alt, color: Colors.grey),
                  label: const Text(
                    'alterar a foto',
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Satoshi',
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Container com os campos de perfil
                Container(
                  width: double.infinity, // Faz o Container ocupar toda a largura da tela
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
                      // Campos de perfil (Nome, E-mail, Senha, etc.)
                      const Text(
                        "Nome completo",
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const CustomProfileField(
                        value: "Philippe C. Correia",
                        imagePath: 'assets/imagens/ico_nome.png',
                      ),
                      const SizedBox(height: 20),

                      const Text(
                        "E-mail",
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const CustomProfileField(
                        value: "philippeccorreia@gmail.com",
                        imagePath: 'assets/imagens/ico_email.png',
                      ),
                      const SizedBox(height: 20),

                      const Text(
                        "Senha",
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),

                      // Caixa de senha definitiva com visibilidade
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF333333),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible, // Alterna visibilidade
                          readOnly: true, // Torna o campo não editável
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFF333333),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                'assets/imagens/ico_senha.png',
                                width: 25,
                                height: 25,
                              ),
                            ),
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 65,
                            ),
                            suffixIcon: GestureDetector(
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
                            ),
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
                            fontWeight: FontWeight.w300, // Aplica o fontWeight correto
                            fontFamily: 'Satoshi', // Define a fonte correta
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      GestureDetector(
                        onTap: () {
                          // Exibir o modal de redefinição de senha
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: const Color(0xFF262626),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                content: Container(
                                  width: MediaQuery.of(context).size.width * 1.0,  // Define a largura como 85% da tela
                                  height: MediaQuery.of(context).size.height * 0.5,  // Define a altura como 60% da tela
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4.0,
                                    horizontal: 4.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF262626),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Botão de voltar (como texto)
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "< Voltar",
                                          style: TextStyle(
                                            color: Color(0xFF9B9B9B),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),

                                      // Título "Redefina sua senha."
                                      RichText(
                                        text: const TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Redefina sua ",
                                              style: TextStyle(
                                                fontFamily: 'Satoshi',
                                                fontSize: 28,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.white,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "senha.",
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

                                      // Descrição "Nova senha"
                                      const Text(
                                        "Nova senha",
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
                                        showPasswordRequirements: true, // Requisitos apenas no primeiro campo
                                      ),
                                      const SizedBox(height: 20),

                                      // Descrição "Confirmação"
                                      const Text(
                                        "Confirmação",
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
                                        showPasswordRequirements: false, // Sem requisitos no campo de confirmação
                                      ),
                                      const SizedBox(height: 30),

                                      // Centraliza o botão
                                      Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                              colors: [Color(0xFFEB5E7F), Color(0xFFF98F6F)],
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                            ),
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pushNamed(context, '/perfil'); // Redireciona para a rota /login
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.transparent,
                                              shadowColor: Colors.transparent,
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 40, vertical: 25,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(30),
                                              ),
                                            ),
                                            child: const Text(
                                              "Redefinir",
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
                              );
                            },
                          );
                        },
                        child: const Text(
                          'Redefinir minha senha',
                          style: TextStyle(
                            color: Color(0xFF9B9B9B),
                            fontSize: 16,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      const Text(
                        "Início de período mensal",
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),

                      // Seleção de dias com ícone de seta para baixo
                      Align(
                        alignment: Alignment.centerLeft, // Alinha à esquerda
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.35, // Define a largura como 35% da tela
                          height: 55, // Mantendo a altura para ser igual aos outros campos
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFF333333),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              _showDaySelection(context);
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    'assets/imagens/ico_calendar.png',
                                    width: 25,
                                    height: 25,
                                  ),
                                ),
                                const SizedBox(width: 10), // Adicionando espaço entre o ícone e o texto
                                Expanded(
                                  child: Text(
                                    'dia $selectedDay',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Satoshi',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0), // Define a margem à direita
                                  child: Image.asset(
                                    'assets/imagens/seta_baixo.png',
                                    width: 15,  // Defina a largura da imagem
                                    height: 15, // Defina a altura da imagem
                                    color: Colors.white, // Opcional, se quiser aplicar uma cor à imagem
                                  ),
                                ),
                              ],
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

  // Função para exibir a seleção de dias em uma grade
  void _showDaySelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40.0), // Arredonda as bordas superiores
        ),
      ),
      backgroundColor: Colors.transparent, // Torna o fundo transparente
      clipBehavior: Clip.antiAlias, // Garante que o fundo respeite a borda arredondada
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFF262626), // A cor do fundo
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50.0), // Arredonda as bordas do conteúdo também
            ),
          ),
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7, // Exibe 7 dias por linha
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 31,
            itemBuilder: (BuildContext context, int index) {
              String day = (index + 1).toString();
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDay = day;
                  });
                  Navigator.pop(context); // Fecha o modal após a seleção
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: day == selectedDay
                        ? const LinearGradient(
                      colors: [Color(0xFFEB5E7F), Color(0xFFF98F6F)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    )
                        : null,
                    color: day == selectedDay
                        ? null
                        : const Color(0xFF333333),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    day,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Satoshi',
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class CustomProfileField extends StatelessWidget {
  final String value;
  final String imagePath;

  const CustomProfileField({
    super.key,
    required this.value,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF333333), // Cor do fundo da caixa
        hintText: value, // Exibe o valor como texto definitivo
        hintStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w300,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(imagePath, width: 25, height: 25),
        ),
        prefixIconConstraints: const BoxConstraints(
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildPasswordRequirement("+6 caracteres", hasMinLength(_password)),
            _buildSeparator(),
            _buildPasswordRequirement("Letra maiúscula", hasUpperCase(_password)),
          ],
        ),
        const SizedBox(height: 10), // Adiciona um espaço entre as linhas
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildPasswordRequirement("Número", hasNumber(_password)),
            _buildSeparator(),
            _buildPasswordRequirement("Caractere especial", hasSpecialCharacter(_password)),
          ],
        ),
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
