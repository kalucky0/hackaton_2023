import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../widgets/add_comment.dart';
import '../widgets/comment.dart';

class PlaceScreen extends StatelessWidget {
  final String name;
  final String image;

  const PlaceScreen({
    required this.name,
    required this.image,
    Key? key,
  }) : super(key: key);

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
                    image,
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
                  Positioned(
                    bottom: 20,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        name,
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                        style: const TextStyle(
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
                      "Zabytkowy, rzymskokatolicki ko??ci???? parafialny, znajduj??cy si?? w Krakowie, w dzielnicy I, na Starym Mie??cie, na placu Mariackim, przy p????nocno-wschodnim naro??niku Rynku G????wnego."
                      " Od 1962 roku posiada tytu?? bazyliki mniejszej.<br/><br/>??wi??tynia jest gotyck??, tr??jnawow??, orientowan?? bazylik??."
                      "<br/><br/><b>Historia</b><br/><br/>"
                      "Wed??ug Jana D??ugosza pierwszy murowany ko??ci???? w stylu roma??skim zosta?? ufundowany przez biskupa krakowskiego Iwona Odrow????a w latach 1221???1222 na miejscu pierwotnej drewnianej ??wi??tyni. Wkr??tce jednak budowl?? zniszczono podczas najazd??w tatarskich.<br/><br/>"
                      "W latach 1290???1300 wzniesiono, cz????ciowo na poprzednich fundamentach, wczesnogotycki ko??ci???? halowy, kt??ry konsekrowano oko??o roku 1320???1321. Prace jednak kontynuowane by??y jeszcze w trzeciej dekadzie czternastego stulecia.<br/><br/>"
                      "W latach 1355???1365, dzi??ki fundacji Miko??aja Wierzynka (mieszczanina krakowskiego i stolnika sandomierskiego), wzniesiono obecne prezbiterium.<br/><br/>"
                      "Z kolei w latach 1392???1397 polecono mistrzowi Miko??ajowi Wernerowi lepsze do??wietlenie ko??cio??a. Budowniczy obni??y?? mury naw bocznych, a w murach magistralnych wprowadzi?? du??e otwory okienne. W ten spos??b halowy uk??ad ??wi??tyni zmieni?? si?? na bazylikowy.<br/><br/>",
                ),
              ),
              const AddComment(),
              const UserComment(
                name: 'Adam',
                points: 2804,
                id: 14,
              ),
              const UserComment(
                name: 'Justyna',
                points: 634,
                id: 15,
              ),
            ],
          ),
        );
      },
    );
  }
}
