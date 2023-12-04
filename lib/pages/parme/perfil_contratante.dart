import 'package:flutter/material.dart';

class PerfilContratante extends StatelessWidget {
  const PerfilContratante({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 175.0,
                  width: 175.0,
                  child: Image.asset(
                    'assets/smarthire_branco.png',
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const CircleAvatar(
                radius: 45.0,
                backgroundImage: AssetImage('assets/foto_perfil.jpg'),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Adicione a lógica para editar o perfil
                    },
                    icon: const Icon(Icons.edit, color: Colors.black),
                    label: const Text('Editar Perfil',
                        style: TextStyle(color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Adicione a lógica para sair do perfil
                    },
                    icon: const Icon(Icons.exit_to_app, color: Colors.black),
                    label: const Text('Sair',
                        style: TextStyle(color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Text(
                        'Nome Completo:',
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Text(
                        'Biografia aqui...',
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Text(
                        'Projetos Participados: 10', // Substitua pelo valor real
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Text(
                        'Membro há: 1 ano', // Substitua pelo valor real
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Área de Projetos:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Adicione a imagem
                    Widget image = CircleAvatar(
                      radius: constraints.maxWidth < 600 ? 15.0 : 20.0,
                      backgroundImage:
                          const AssetImage('assets/sua_imagem.jpg'),
                    );

                    // Adicione o nome e status (Ativo ou Finalizado)
                    Widget nameAndStatus = Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Reboque na parede',
                          style: TextStyle(
                            fontSize: constraints.maxWidth < 600 ? 10.0 : 14.0,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Ativo',
                          style: TextStyle(
                            fontSize: constraints.maxWidth < 600 ? 8.0 : 12.0,
                            color: Colors
                                .green, // se for ativo fica verde, se for finalizado vermelho
                          ),
                        ),
                      ],
                    );

                    // Adicione o ícone de relógio
                    Widget clockIcon = Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.grey,
                          size: constraints.maxWidth < 600 ? 10.0 : 16.0,
                        ),
                        const SizedBox(width: 5),
                        // Adicione a data
                        Text(
                          '01/01/2023', // Substitua pela data real
                          style: TextStyle(
                            fontSize: constraints.maxWidth < 600 ? 8.0 : 12.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    );

                    // Adicione o valor do projeto
                    Widget projectValue = Text(
                      'R\$ 1.000,00', // Substitua pelo valor real
                      style: TextStyle(
                        fontSize: constraints.maxWidth < 600 ? 8.0 : 12.0,
                        color: Colors.grey,
                      ),
                    );

                    // Organize os widgets de acordo com o tamanho da tela
                    return constraints.maxWidth < 600
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [image, nameAndStatus],
                              ),
                              Row(
                                children: [clockIcon, projectValue],
                              ),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              image,
                              const SizedBox(width: 10),
                              nameAndStatus,
                              const Spacer(),
                              clockIcon,
                              const SizedBox(width: 10),
                              projectValue,
                            ],
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 4, 34, 168),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/notificacoes');
              },
              child: const Icon(Icons.notifications, color: Colors.white),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
              child: const Icon(Icons.home, color: Colors.white),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/perfil');
              },
              child: const Icon(Icons.person, color: Colors.white),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/indicacao');
              },
              child: const Icon(Icons.assignment_ind, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
