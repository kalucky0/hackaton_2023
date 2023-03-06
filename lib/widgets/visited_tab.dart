import 'package:flutter/material.dart';

import '../screens/place.dart';

class Place {
  final String name;
  final String description;
  final String image;

  const Place({
    required this.name,
    required this.description,
    required this.image,
  });
}

class VisitedTab extends StatelessWidget {
  const VisitedTab({Key? key}) : super(key: key);

  static const places = [
    Place(
      name: "Zamek Królewski na Wawelu",
      description: "Ufortyfikowany zamek na wzgórzu...",
      image: "https://lh5.googleusercontent.com/p/AF1QipNdrE7HuM4ur6fZ_3GSJ1I4Y1jWpFwefBkR3F1y=w408-h544-k-no",
    ),
    Place(
      name: "Bazylika Mariacka",
      description: "Rzymskokatolicka bazylika z rzeźbionym ołtarzem i gotycką wieżą...",
      image: "https://lh3.googleusercontent.com/gps-proxy/ALm4wwnXaEUSarxbEMmv3ocPwLnkpqTB8KkJZh1wakcdD62V9bK8Tdv4jpelFr3-cPyTlIXUi-0h16tN6fCF0Kisp7onfjZGpfRnno5RhdxqTMRrNzldUtpkDR6jSR-CX6hUjKon2mA_HcR07DHb5W5r6_555SzdfBTjXp5ZIUvW9Al_fvurUeOQF-wI=w408-h271-k-no",
    ),
    Place(
      name: "Rynek Główny",
      description: "Wielki, datowany na XIII wiek plac średniowiecznego miasta otoczony...",
      image: "https://lh5.googleusercontent.com/p/AF1QipOBP6SYE8Jr5NCGQc1AOjGP5VwHoDG54AWTVxyg=w408-h272-k-no"
    ),
    Place(
      name: "Pałac Kultury i Nauki",
      description: "Zbudowany w latach 50. XX w. Pałac Kultury i Nauki z teatrem, boiskiem...",
      image: "https://lh5.googleusercontent.com/p/AF1QipP7kE-k1F68OfhFNBY8ntqZj_kiK7sysMw20Plr=w408-h544-k-no",
    ),
    Place(
      name: "Charging Bull",
      description: "Wykonany z brązu 3-tonowy byk w pobliżu Wall Street symbolizujący...",
      image: "https://lh5.googleusercontent.com/p/AF1QipNxxumcgEWsByvvRie-PLkjSvUmhYXihrzvXF2H=w408-h263-k-no",
    ),
    Place(
      name: "Times Square",
      description: "Tętniący życiem plac w sercu dzielnicy teatrów, słynący z jasnych neonów...",
      image: "https://lh5.googleusercontent.com/p/AF1QipNFlVuccumeKVY5RRc-nqamhr9f48iuYuCFZAUt=w408-h544-k-no",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      color: const Color(0xFFFAFAFA),
      child: ListView.builder(
        itemCount: places.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _placeCard(
            context,
            places[index].name,
            places[index].description,
            places[index].image,
          );
        },
      ),
    );
  }

  Widget _placeCard(
      BuildContext context, String name, String description, String image) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 14,
        left: 12,
        right: 12,
      ),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            barrierColor: Colors.black38,
            context: context,
            builder: (BuildContext context) {
              return PlaceScreen(
                image: image,
                name: name,
              );
            },
          );
        },
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              color: Colors.grey.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Image.network(
                image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
