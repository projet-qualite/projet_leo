import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_leo/main.dart';

class Profil extends StatefulWidget {
  Map<String, dynamic> donneesUtilisateur;


  Profil(Map<String, dynamic> donneesUtilisateur)
  {
    this.donneesUtilisateur = donneesUtilisateur;
  }
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  Map<String, dynamic> donneesUtilisateur;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height/10),
          child: AppBar(

            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text(
              "Profil",
              style: GoogleFonts.raleway(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),
            ),
            actions: <Widget>[

              IconButton(
                icon: Icon(Icons.power_settings_new),
                color: Colors.white,
                onPressed: (){
                  donneesUtilisateur = null;
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MonApplication()),
                        (Route<dynamic> route) => false,
                  );
                },
              )

            ],
          ),

        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(children: [
            Stack(children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),
                      ),
                      color: Colors.white),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width),

              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        child: CircleAvatar(backgroundImage: AssetImage('images/profileimg.png'),
                          radius: MediaQuery.of(context).size.width/6,),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 40, top: 20),
                        child: Column(
                          children: <Widget>[
                            Text(
                              widget.donneesUtilisateur["PRENOM_CAND"],
                              style: GoogleFonts.raleway(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              widget.donneesUtilisateur["NOM_CAND"],
                              style: GoogleFonts.raleway(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),

                      )


                    ],
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Container(
                        margin: EdgeInsets.only(left: 20, top: 20),
                          height: MediaQuery.of(context).size.width/4,
                          width: MediaQuery.of(context).size.width/2.5,
                          child: Card(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                side: BorderSide(width: 5, color: Colors.green)),
                            child: Center(
                              child: Text(
                                  "Inscription \n  réussie",
                                style: GoogleFonts.raleway(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                              ),
                            )
                          )),

                      Container(
                          margin: EdgeInsets.only(right: 20, top: 20),
                          height: MediaQuery.of(context).size.width/4,
                          width: MediaQuery.of(context).size.width/2.5,
                          child: Card(
                              color: Colors.brown,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  side: BorderSide(width: 5, color: Colors.brown)),
                              child: Center(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 20,),
                                    Text(
                                      "Visite",
                                      style: GoogleFonts.raleway(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(
                                      "En cours ou terminée",
                                      style: GoogleFonts.raleway(
                                          fontSize: 12.5,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),
                                    ),
                                  ],
                                )
                              )
                          ))




                    ],

                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Container(
                          margin: EdgeInsets.only(left: 20, top: 20),
                          height: MediaQuery.of(context).size.width/4,
                          width: MediaQuery.of(context).size.width/2.5,
                          child: Card(
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  side: BorderSide(width: 5, color: Colors.blue)),
                              child: Center(
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(height: 20,),
                                      Text(
                                        "Délibération",
                                        style: GoogleFonts.raleway(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        "En cours ou terminée",
                                        style: GoogleFonts.raleway(
                                            fontSize: 12.5,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),
                                      ),
                                    ],
                                  )
                              )
                          )),

                      Container(
                          margin: EdgeInsets.only(right: 20, top: 20),
                          height: MediaQuery.of(context).size.width/4,
                          width: MediaQuery.of(context).size.width/2.5,
                          child: Card(
                              color: Colors.teal,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  side: BorderSide(width: 5, color: Colors.teal)),
                              child: Center(
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(height: 20,),
                                      Text(
                                        "Résultat",
                                        style: GoogleFonts.raleway(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        "Disponible ou non",
                                        style: GoogleFonts.raleway(
                                            fontSize: 12.5,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),
                                      ),
                                    ],
                                  )
                              )
                          ))




                    ],

                  )


                ],
              )




            ])
          ]),
        )
    );
  }
}
