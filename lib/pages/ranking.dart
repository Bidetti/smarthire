import 'package:flutter/material.dart';
import 'package:smarthire/service/auth_service.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({Key? key}) : super(key: key);

  @override
  RankingScreenState createState() => RankingScreenState();
}

class RankingScreenState extends State<RankingScreen> {
  final TextEditingController _nameController = TextEditingController();
  String? _selectedCategory;
  List<Map<String, dynamic>> _filteredRankedList = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _auth();
    _selectedCategory = 'Geral'; // Defina "Geral" como padrão
    _checkRouteAndScroll();
    _filterList(); // Inicialize a lista filtrada aqui
  }

  void _checkRouteAndScroll() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToCategory();
      _filterList();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final route = ModalRoute.of(context);
    if (route != null && route.settings.arguments != null) {
      final args = route.settings.arguments as String?;
      if (args != null) {
        _selectedCategory = args;
        _scrollToCategory();
      }
    }
  }

  void _scrollToCategory() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        if (_selectedCategory != null) {
          final categoryExists = topRanked
              .any((person) => person['category'] == _selectedCategory);
          if (categoryExists) {
            final categoryIndex = topRanked.indexWhere(
                (person) => person['category'] == _selectedCategory);
            _scrollController.jumpTo(categoryIndex * 150.0);
          }
        }
      }
    });
  }

  Future<void> _logout() async {
    logoutUser();
    navigatePushNamed('/');
  }

  Future<bool> _auth() async {
    final jwt = await verifyJWT();
    if (jwt == true) {
      return true;
    }
    _logout();
    showSnackBar('Erro: Não foi possível autenticar sua conexão.', Colors.red);
    return false;
  }

  void showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  void navigatePushNamed(String route) {
    if (mounted) {
      Navigator.pushNamed(context, route);
    }
  }

  void _filterList() {
    _filteredRankedList = topRanked
        .where((person) =>
            person['name']
                .toLowerCase()
                .contains(_nameController.text.toLowerCase()) &&
            (_selectedCategory == 'Geral' ||
                person['category'] == _selectedCategory))
        .toList();

    _filteredRankedList.sort((a, b) => b['score'].compareTo(a['score']));
  }

  @override
  Widget build(BuildContext context) {
    _filterList();

    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/smarthire_branco.png'),
                const SizedBox(height: 8.0),
                const Text(
                  'Ranking',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextField(
                            controller: _nameController,
                            onChanged: (value) => setState(() {}),
                            decoration: const InputDecoration(
                              hintText: 'Digite um nome',
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _selectedCategory,
                            items: [
                              'Geral',
                              'Pedreiro',
                              'Eletricista',
                              'Encanador',
                              'Professor'
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(value),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? selectedCategory) {
                              setState(() {
                                _selectedCategory = selectedCategory;
                              });
                            },
                            hint: const Text('Categoria'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Melhores Classificados',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    // Mostra os melhores classificados
                    if (_filteredRankedList.isNotEmpty)
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _filteredRankedList.length,
                        itemBuilder: (context, index) {
                          final person = _filteredRankedList[index];
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: const EdgeInsets.all(16.0),
                            margin: const EdgeInsets.only(bottom: 16.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${index + 1}.',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 16.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      person['name'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4.0),
                                    Text(person['category']),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Text('${person['score']}'),
                                        const Icon(Icons.star,
                                            color: Colors.grey),
                                      ],
                                    ),
                                    Text('${person['distance']} km'),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    else
                      const Text('Nenhum resultado encontrado'),
                  ],
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 4, 34, 168),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                navigatePushNamed('/home');
              },
              child: const Icon(Icons.home, color: Colors.white),
            ),
            InkWell(
              onTap: () {
                navigatePushNamed('/projetos');
              },
              child: const Icon(Icons.folder, color: Colors.white),
            ),
            InkWell(
              onTap: () {
                navigatePushNamed('/ranking');
              },
              child: const Icon(Icons.star, color: Colors.white),
            ),
            InkWell(
              onTap: () {
                navigatePushNamed('/perfil');
              },
              child: const Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  // Simulação
  final List<Map<String, dynamic>> topRanked = [
    {
      'name': 'John Doe',
      'category': 'Pedreiro',
      'score': 4.8,
      'distance': 1.2,
      'imageUrl': 'imagem1', // poe a imagem aqui
    },
    {
      'name': 'Jane Smith',
      'category': 'Eletricista',
      'score': 4.5,
      'distance': 2.0,
      'imageUrl': 'imagem2', // poe a imagem aqui
    },
    {
      'name': 'Bob Johnson',
      'category': 'Pedreiro',
      'score': 4.7,
      'distance': 1.5,
      'imageUrl': 'imagem3', // poe a imagem aqui
    },
    {
      'name': 'Alice Williams',
      'category': 'Encanador',
      'score': 4.6,
      'distance': 1.8,
      'imageUrl': 'imagem4', // poe a imagem aqui
    },
    {
      'name': 'Charlie Brown',
      'category': 'Professor',
      'score': 4.9,
      'distance': 1.1,
      'imageUrl': 'imagem5', // poe a imagem aqui
    },
  ];
}
