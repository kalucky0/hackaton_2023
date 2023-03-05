import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserComment extends StatelessWidget {
  UserComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 25,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            child: Image.network('https://picsum.photos/60/60'),
          ),
          const SizedBox(
            width: 18
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    bottom: 5,
                  ),
                  child: Text(
                    "Adam",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                    ),
                    textAlign: TextAlign.end,
                  ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 120,
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse auctor lectus a sapien blandit cursus ac ut ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Etiam at ullamcorper arcu, non hendrerit lacus.",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  maxLines: 3,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
