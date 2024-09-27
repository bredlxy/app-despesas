import 'package:flutter/material.dart';

class RelatorioDespesasAssinaturasScreen extends StatefulWidget {
  const RelatorioDespesasAssinaturasScreen({super.key});

  @override
  RelatorioDespesasAssinaturasScreenState createState() => RelatorioDespesasAssinaturasScreenState();
}

class RelatorioDespesasAssinaturasScreenState extends State<RelatorioDespesasAssinaturasScreen> {
  List<Map<String, dynamic>> setembroExpenses = [
    {'title': 'Netflix', 'category': 'Assinaturas', 'value': 44.90, 'imagePath': 'assets/imagens/assinaturas1.png'},
  ];

  List<Map<String, dynamic>> agostoExpenses = [
    {'title': 'Netflix', 'category': 'Assinaturas', 'value': 44.90, 'imagePath': 'assets/imagens/assinaturas1.png'},
  ];

  List<Map<String, dynamic>> julhoExpenses = [
    {'title': 'Netflix', 'category': 'Assinaturas', 'value': 44.90, 'imagePath': 'assets/imagens/assinaturas1.png'},
  ];

  int? _selectedExpenseIndex;
  bool _isEditing = false;
  bool _isRemoving = false;
  String? _currentMonth;

  void _removeExpense(List<Map<String, dynamic>> expenses) {
    setState(() {
      expenses.removeAt(_selectedExpenseIndex!);
      _isRemoving = false;
      _selectedExpenseIndex = null;
    });
  }

  void _showEditModal(Map<String, dynamic> expense) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1F1F1F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: const EdgeInsets.all(16.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Editar despesa",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Satoshi',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Nome da despesa",
                style: TextStyle(
                  color: Color(0xFF9B9B9B),
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 5),
              _buildTextField(hintText: expense['title'], iconPath: 'assets/imagens/nome1.png'),
              const SizedBox(height: 20),
              const Text(
                "Categoria",
                style: TextStyle(
                  color: Color(0xFF9B9B9B),
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 5),
              _buildDropdownField(expense['category']),
              const SizedBox(height: 20),
              const Text(
                "Valor",
                style: TextStyle(
                  color: Color(0xFF9B9B9B),
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 5),
              _buildTextField(hintText: 'R\$${expense['value'].toStringAsFixed(2)}', iconPath: 'assets/imagens/valor1.png'),
              const SizedBox(height: 30),
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
                      Navigator.pop(context);
                      setState(() {
                        _isEditing = false;
                        _selectedExpenseIndex = null;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Salvar",
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
        );
      },
    );
  }

  Widget _buildTextField({required String hintText, required String iconPath}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF333333),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF333333),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0x4D9B9B9B),
            fontFamily: 'Satoshi',
            fontWeight: FontWeight.w300,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset(iconPath, width: 18, height: 18),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 30,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 20.0,
          ),
        ),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget _buildDropdownField(String selectedCategory) {
    List<String> categories = [
      'Assinaturas', 'Alimentação', 'Compras Pessoais', 'Educação', 'Lazer', 'Outros', 'Emergências',
      'Investimentos', 'Moradia', 'Saúde', 'Serviços', 'Transporte'
    ];

    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: const Color(0xFF333333),
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedCategory,
          icon: Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Image.asset(
              'assets/imagens/seta_baixo.png',
              width: 15,
              height: 15,
              color: Colors.white,
            ),
          ),
          isExpanded: true,
          dropdownColor: const Color(0xFF333333),
          borderRadius: BorderRadius.circular(20),
          items: categories.map<DropdownMenuItem<String>>((String category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/imagens/${category.toLowerCase().replaceAll(" ", "")}0.png', width: 25, height: 25),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    category,
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
              selectedCategory = newValue!;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
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
                  const Text(
                    'Despesas - Assinaturas',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/adicionar');
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xFF262626),
                        shape: BoxShape.circle,
                      ),
                      child: ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [Color(0xFFEB5E7F), Color(0xFFF98F6F)],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ).createShader(bounds),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              _buildExpenseSection('Setembro', setembroExpenses),
              _buildExpenseSection('Agosto', agostoExpenses),
              _buildExpenseSection('Julho', julhoExpenses),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpenseSection(String month, List<Map<String, dynamic>> expenses) {
    double total = expenses.fold(0, (sum, item) => sum + item['value']);

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF262626),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '$month | total de ',
                  style: const TextStyle(
                    color: Color(0xFF9B9B9B),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFFEB5E7F), Color(0xFFF98F6F)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ).createShader(bounds),
                  child: Text(
                    'R\$${total.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_isEditing && _currentMonth == month) {
                        _isEditing = false;
                        _currentMonth = null;
                      } else {
                        _isEditing = true;
                        _isRemoving = false;
                        _currentMonth = month;
                      }
                    });
                  },
                  child: Image.asset(
                    'assets/imagens/editar1.png',
                    width: 18,
                    height: 18,
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_isRemoving && _currentMonth == month) {
                        _isRemoving = false;
                        _currentMonth = null;
                      } else {
                        _isRemoving = true;
                        _isEditing = false;
                        _currentMonth = month;
                      }
                    });
                  },
                  child: Image.asset(
                    'assets/imagens/deletar1.png',
                    width: 18,
                    height: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: List.generate(
                expenses.length,
                    (index) => _buildExpenseItem(
                  expenses,
                  index,
                  month,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpenseItem(List<Map<String, dynamic>> expenses, int index, String month) {
    final expense = expenses[index];
    bool isSelectable = _isEditing || _isRemoving;
    bool isCurrentMonth = _currentMonth == month;

    return GestureDetector(
      onTap: () {
        if (isSelectable && isCurrentMonth) {
          setState(() {
            _selectedExpenseIndex = index;
            if (_isEditing) {
              _showEditModal(expense); // Abre o modal de edição
            } else if (_isRemoving) {
              _removeExpense(expenses); // Remove a despesa
            }
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: isSelectable && isCurrentMonth
                    ? Colors.white.withOpacity(0.1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF363636),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    expense['imagePath'],
                    width: 25,
                    height: 25,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        expense['title'],
                        style: TextStyle(
                          color: isSelectable ? Colors.white.withOpacity(0.8) : Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        expense['category'],
                        style: TextStyle(
                          color: isSelectable ? Colors.grey.withOpacity(0.8) : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFFEB5E7F), Color(0xFFF98F6F)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ).createShader(bounds),
                  child: Text(
                    'R\$${expense['value'].toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}