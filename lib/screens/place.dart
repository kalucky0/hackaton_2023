import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hackaton/widgets/add_comment.dart';
import 'package:hackaton/widgets/comment.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      snap: true,
      snapSizes: const [0.5, 1.0],
      minChildSize: 0.4,
      builder: (BuildContext context, scrollController) {
        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: ListView(
            controller: scrollController,
            shrinkWrap: true,
            children: [
              Stack(
                children: [
                  Image.network(
                    'https://lh3.googleusercontent.com/gps-proxy/ALm4wwkXSlNKl7pHIIyV3Hg6HBFtaFH7Pz8xLrCSx-ivjXwFwRToSXTtT0xB6alU3KyXOVBUe2dyjfLc6ds27Ooqzc_cNPZZivxdwOtOX3KsN57pAzUqFY7vfLOECnl16UWTIm1yC_nuG_Stt1Y0uL6gj3-Gk5bZrWjKv7wNsevdfyDUf1qJm0ZtRolF=w408-h271-k-no',
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black54,
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 20,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "Bazylika Mariacka",
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 12,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 100,
                          height: 5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Html(
                  data:
                      "Zabytkowy, rzymskokatolicki kościół parafialny, znajdujący się w Krakowie, w dzielnicy I, na Starym Mieście, na placu Mariackim, przy północno-wschodnim narożniku Rynku Głównego."
                      " Od 1962 roku posiada tytuł bazyliki mniejszej.<br/><br/>Świątynia jest gotycką, trójnawową, orientowaną bazyliką."
                      "<br/><br/><b>Historia</b><br/><br/>"
                      "Według Jana Długosza pierwszy murowany kościół w stylu romańskim został ufundowany przez biskupa krakowskiego Iwona Odrowąża w latach 1221–1222 na miejscu pierwotnej drewnianej świątyni. Wkrótce jednak budowlę zniszczono podczas najazdów tatarskich.<br/><br/>"
                      "W latach 1290–1300 wzniesiono, częściowo na poprzednich fundamentach, wczesnogotycki kościół halowy, który konsekrowano około roku 1320–1321. Prace jednak kontynuowane były jeszcze w trzeciej dekadzie czternastego stulecia.<br/><br/>"
                      "W latach 1355–1365, dzięki fundacji Mikołaja Wierzynka (mieszczanina krakowskiego i stolnika sandomierskiego), wzniesiono obecne prezbiterium.<br/><br/>"
                      "Z kolei w latach 1392–1397 polecono mistrzowi Mikołajowi Wernerowi lepsze doświetlenie kościoła. Budowniczy obniżył mury naw bocznych, a w murach magistralnych wprowadził duże otwory okienne. W ten sposób halowy układ świątyni zmienił się na bazylikowy.<br/><br/>",
                ),
              ),
              const AddComment(),
              UserComment(),
              UserComment(),
            ],
          ),
        );
      },
    );
  }
}
