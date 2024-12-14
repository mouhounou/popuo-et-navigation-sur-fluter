import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget{

  const Body ({super.key});

  @override
  State<Body> createState() {
    return _Body();
  }
}



class _Body extends State<Body>{


  IconData _iconData = Icons.person;
  Color _color = Colors.white;
  int _count = 0;

  void _showSnackBar(){
    SnackBar  snackbar = SnackBar(
      content: const Text("voici la snackbar tant attendu"),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      elevation: 5,
      margin: const EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
      duration:  const Duration(seconds: 7),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }


  void _simpleDialog(){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return SimpleDialog(
            title: const Text("Change l'icone"),
            children: [
              _dialogButton(text: "Home", iconData: Icons.home),
              _dialogButton(text: "personne", iconData: Icons.person)
            ],
          );
        }
    );
  }

  TextButton _dialogButton({required String text, required IconData iconData}){
    return TextButton(
        onPressed: (){
          setState(() {
            _iconData = iconData;
            Navigator.pop(context);
          });
        },
        child: Row(
          children: [
            Icon(iconData),
            Text(text)
          ],
        )
    );
  }

  void _alertDialog(){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text('Incrementation'),
            content: Text("Etes vous sur de vouloir incrementer ?"),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text("ANNULER")
              ),
              TextButton(
                  onPressed: (){
                    setState(() {
                      _count++;
                    });
                    Navigator.pop(context);
                  },
                  child: const Text("VALIDER")
              )
            ],
          );
        }
    );
  }

  TextButton _bottomsheetButon ({required String colorsString, required Color color }){
    return TextButton(
        onPressed: (){
          Navigator.pop(context);
          setState(() {
            _color = color;
          });
        },
        child:  Text(colorsString)
    );
  }

  Column bottom (){
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Text("Changer la couleur du bouton"),
        const Divider(),
        _bottomsheetButon(colorsString: "Rouge", color: Colors.red),
        _bottomsheetButon(colorsString: "vert", color: Colors.green),
        _bottomsheetButon(colorsString: "blanc", color: Colors.white),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: _showSnackBar,
              child: const Text("Montre moi la snackbar")
          ),

          ElevatedButton(
            onPressed: _simpleDialog,
            child: const Text("Simple Dialog"),
          ),

          Icon(
              _iconData,
              color: Theme.of(context).colorScheme.inversePrimary
          ),

          ElevatedButton(
              onPressed: _alertDialog,
              child:  Text("J'ai confirmer $_count fois")
          ),

          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _color,
              ),
              onPressed: (){
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context){
                      return Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: bottom()
                      );
                    }
                );
              },
              child: const Text("botomshett modal")
          ),

          ElevatedButton(
              onPressed: (){
                Scaffold.of(context).showBottomSheet((BuildContext context){
                  return bottom();
                });
              },
              child: const Text("Persistante")
          )
        ],
      ),
    );
  }
}