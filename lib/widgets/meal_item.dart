import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  const MealItem(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.duration,
      required this.complexity,
      required this.affordability})
      : super(key: key);

  void selectMeal() {}

  String get complexcityText {
    switch (complexity) {
      case Complexity.Simple:
        {
          return 'Simple';
        }
      case Complexity.Hard:
        {
          return 'Hard';
        }
      case Complexity.Challenging:
        {
          return 'Challenging';
        }
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        {
          return 'Affordable';
        }
      case Affordability.Pricey:
        {
          return 'Pricey';
        }
      case Affordability.Luxurious:
        {
          return 'Luxurious';
        }
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(width: 6),
                      Text(
                        '${duration} minutes',
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.work_outline_rounded,
                      ),
                      SizedBox(width: 6),
                      Text(
                        complexcityText,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text(
                        affordabilityText,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
