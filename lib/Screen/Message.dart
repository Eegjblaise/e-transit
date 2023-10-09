import 'package:etransit/Screen/chatScreen.dart';
import 'package:etransit/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: appBgColor,
          actions: [
            Icon(
              Icons.search,
              color: shadowColor,
            ),
            SizedBox(
              width: 16,
            )
          ],
          leading: Icon(Icons.add_circle_outline, color: shadowColor),
          title: Text("Boite de receptions",
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inknutAntiqua(
                  fontSize: 14,
                  textStyle: Theme.of(context).textTheme.labelMedium))),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            height: 75,
            width: width,
            //  color: Colors.amber,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blueAccent,
                    child: Icon(Icons.group, color: appBgColor, size: 30),
                  ),
                ),
                Expanded(
                    flex: 10,
                    child: Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Nouveaux groupes",
                                          style: GoogleFonts.inknutAntiqua(
                                            fontSize: 14,
                                          )),
                                      Text(
                                        "Vous avez etez ajouter a cette comunauté",
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              height: 1,
                            )
                          ],
                        )))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            height: 65,
            width: width,
            //  color: Colors.amber,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.redAccent,
                    child:
                        Icon(Icons.notifications, color: appBgColor, size: 30),
                  ),
                ),
                Expanded(
                    flex: 10,
                    child: Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Nouveaux groupes",
                                          style: GoogleFonts.inknutAntiqua(
                                            fontSize: 14,
                                          )),
                                      Text(
                                        "Vous avez etez ajouter a cette comunauté",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: darker),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              height: 1,
                            )
                          ],
                        )))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            height: 81,
            width: width,
            //  color: Colors.amber,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: cardColor,
                    backgroundImage: AssetImage("assets/téléchargement.png"),
                    child:
                        Icon(Icons.notifications, color: appBgColor, size: 30),
                  ),
                ),
                Expanded(
                    flex: 10,
                    child: GestureDetector(
                      child: Container(
                          padding: EdgeInsets.only(left: 5, top: 5),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 9,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Kamga Rodrigue",
                                            style: GoogleFonts.inknutAntiqua(
                                              fontSize: 14,
                                            )),
                                        Text(
                                          "derniere activite il ya 1h",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.black54,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            "10h20",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 10),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                height: 1,
                              )
                            ],
                          )),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ChatScreen();
                          },
                        ));
                      },
                    ))
              ],
            ),
          )
        ],
      ),
    ));
  }
}
