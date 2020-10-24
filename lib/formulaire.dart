import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';
import 'package:projet_leo/profil.dart';

import 'constantes.dart';
import 'globales.dart';

class Formulaire extends StatefulWidget {
  @override
  _FormulaireState createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {
  TextEditingController mail = new TextEditingController();
  TextEditingController mdp = new TextEditingController();

  final _keyForm = GlobalKey<FormState>();
  String erreur = '';


  Future<bool> testdata() async {
    final response = await http.post(
        //Voir le fichier constantes.dart pour motifier l'URL du backend
        "${Constantes.backendUrl}/backend/compte.php?action=connexion",
        body: json.encode({
          "mail": mail.text,
          "mdp": mdp.text,
        }));
    Map<String, dynamic> datauser = json.decode(response.body);
    if (datauser.containsKey("erreur")) {
      //Afficher l'erreur de connexion
      setState(() => erreur = datauser['erreur']);
      return false;
    }
    setState(() {
      donneesUtilisateur = datauser['utilisateur'];
    });

    return true;
  }



  @override
  Widget build(BuildContext context) {

    ProgressDialog pr = new ProgressDialog(context);
    pr.style(
        message: 'Veuillez Patienter...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
    );


    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: Form(
            key: _keyForm,
            child: Column(
              children: <Widget>[

                Center(
                  child: Text(
                    "Connexion",
                    style: GoogleFonts.raleway(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                SizedBox(height: 60.0),

                CircleAvatar(backgroundImage: AssetImage('images/profileimg.png'),
                  radius: MediaQuery.of(context).size.width/6,),
                SizedBox(height: 70.0),
                TextFormField(
                  controller: mail,
                  decoration: InputDecoration(
                      labelText: 'Email', border: OutlineInputBorder()),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: mdp,
                  decoration: InputDecoration(
                      labelText: 'Mot de passe', border: OutlineInputBorder()),
                  obscureText: true,
                ),
                SizedBox(height: 50.0),
                Text(
                  erreur,
                  style: TextStyle(color: Colors.red[500]),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: OutlineButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () async {

                      pr.show();



                      if (await testdata()) {
                        //Si la connexion reussit on passe au profil
                        pr.hide();
                        print("${donneesUtilisateur} yooo");
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Profil(donneesUtilisateur)),
                              (Route<dynamic> route) => false,
                        );
                      }
                      else{
                        pr.hide();
                      }
                    },
                    borderSide: BorderSide(width: 1.0, color: Colors.green),
                    child: Text(
                      'Valider',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
