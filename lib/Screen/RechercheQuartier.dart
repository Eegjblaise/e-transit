import 'package:etransit/services/autreService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RechercheQuartier extends StatefulWidget {
  void Function(dynamic)? onTap;
  RechercheQuartier({super.key, this.onTap});

  @override
  State<RechercheQuartier> createState() => _RechercheVileState();
}

class _RechercheVileState extends State<RechercheQuartier> {
  List enterprises = [];

  List productfilter = [];
  List productinit = [];
  final TextEditingController _searchQuery = new TextEditingController();

  void initState() {
    super.initState();
    AutreService().getQuartier().then((value) {
      setState(() {
        productinit = value;
      });
      print(productinit);
    });
  }

  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black87,
            ),
          ),
          backgroundColor: Theme.of(context).bottomAppBarColor,
          title: TextField(
            controller: _searchQuery,
            autofocus: true,
            decoration: InputDecoration.collapsed(hintText: "recherche"),
            onChanged: (value) {
              productfilter = [];

              if (value == "") {
                setState(() {
                  enterprises = [];
                });
              } else {
                for (var i = 0; i < productinit.length; i++) {
                  if (productinit
                      .elementAt(i)["titre"]
                      .toLowerCase()
                      .contains(value.toLowerCase())) {
                    setState(() {
                      productfilter.add(productinit.elementAt(i));
                    });
                  }
                }
              }

              setState(() {
                enterprises = productfilter;
              });
            },
          ),
        ),
        body: this.enterprises.isEmpty
            ? Center(
                child: Text("Aucun resultat"),
              )
            : Container(
                height: heigth,
                width: widht,
                padding: EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        enterprises.length,
                        (index) => Container(
                              child: ListTile(
                                onTap: () {
                                  widget.onTap!(enterprises[index]);
                                  Navigator.of(context).pop();
                                },
                                title: Text(enterprises[index]["titre"]),
                                subtitle: Text(
                                    "${enterprises[index]["pay"]["titre"]} -${enterprises[index]["aeroport"]["titre"]}"),
                              ),
                            )),
                  ),
                ),
              ));
  }
}
