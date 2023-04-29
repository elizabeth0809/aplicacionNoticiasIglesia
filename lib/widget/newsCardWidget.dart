import 'package:flutter/material.dart';
import 'package:wordpressiglesia/model/newsModel.dart';
import 'package:wordpressiglesia/newDetails.dart';
import 'package:wordpressiglesia/utilities/layoutUtility.dart';

class NewsCardWidget extends StatelessWidget {
  final NewsModel model;
  const NewsCardWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 0,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(16.0)),
      child: new InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewDetails()));
        },
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                new ClipRRect(
                  child: Image.network(model.imageUrl),
                  borderRadius: BorderRadius.only(
                      topLeft: new Radius.circular(16.0),
                      topRight: new Radius.circular(16.0)),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      model.categoryName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
            new Padding(
              padding: new EdgeInsets.all(15),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new Text(
                    model.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  new SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LayoutUtils.iconText(
                          Icon(Icons.timer),
                          Text(
                            model.postDate,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          )),
                      new GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.favorite_border),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
