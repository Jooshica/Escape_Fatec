import 'package:flutter/material.dart';

class RoomonePage extends StatefulWidget {
  const RoomonePage({Key? key}) : super(key: key);

  @override
  _RoomonePageWidgetState createState() => _RoomonePageWidgetState();
}

class _RoomonePageWidgetState extends State<RoomonePage> {
  double x = 0.0;
  double y = 0.0;
  double livroPositionTop = 555.0; // Coordenada Y inicial do livro
  bool livroMovido = false; // Variável para rastrear se o livro foi movido

  @override
  Widget build(BuildContext context) {
    final double sceneWidth = 1280.0; // Defina o tamanho do cenário conforme necessário
    final double sceneHeight = 720.0; // Defina o tamanho do cenário conforme necessário

    final scaleX = MediaQuery.of(context).size.width / sceneWidth;
    final scaleY = MediaQuery.of(context).size.height / sceneHeight;

    // Posições dos elementos em relação ao cenário
    double chavePosX = 35.0 * scaleX;
    double chavePosY = 555.0 * scaleY;
    double livroPosX = 38.0 * scaleX;
    double livroPosY = livroPositionTop * scaleY;

    return Scaffold(
      body: Stack(
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/save5.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: GestureDetector(
              onTapUp: (details) {
                setState(() {
                  x = details.localPosition.dx / scaleX;
                  y = details.localPosition.dy / scaleY;

                  if (x > 430 && x < 485 && y > 325 && y < 360) {
                    Navigator.pushNamed(context, '/computer');
                  }
                  if (x > 114 && x < 125 && y > 385 && y < 416) {
                    Navigator.pushNamed(context, '/livro');
                  }
                  // Adicione lógica para outras áreas clicáveis aqui
                });
              },
            ),
          ),
          Positioned(
            left: chavePosX,
            top: chavePosY,
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Chave Clicada'),
                      content: Text('Você clicou na chave!'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Fechar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Image.asset(
                "images/chave.png",
                width: 20.0 ,
                height: 20.0 ,
              ),
            ),
          ),
          Positioned(
            left: livroPosX,
            top: livroPosY,
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Cadeião/fatec'),
                      content: Text('história do cadeião/fatec aqui'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Fechar'),
                        ),
                      ],
                    );
                  },
                );

                // Movendo o livro um pouco para baixo apenas uma vez quando clicado
                if (!livroMovido) {
                  setState(() {
                    livroPositionTop += 70.0 * scaleY; // Altere conforme necessário
                    livroMovido = true; // Marca o livro como movido
                  });
                }
              },
              child: Image.asset(
                "images/livro.png",
                width: 25.0 ,
                height: 25.0 ,
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: const Color.fromRGBO(255, 0, 0, 1.0),
        tooltip: 'Sair',
        onPressed: () => Navigator.pushReplacementNamed(context, '/start'),
        child: const Icon(Icons.arrow_back, color: Colors.white, size: 15),
      ),
    );
  }
}
