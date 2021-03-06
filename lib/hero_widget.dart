import 'package:flutter/material.dart';
import 'package:ui_challenge_3/attribute_widget.dart';
import 'package:ui_challenge_3/hero_details_page.dart';
import 'dart:math' as math;

import 'hero_model.dart';

// Degree / Radians converter
const double degrees2Radians = math.pi / 180.0;
const double radians2Degrees = 180.0 / math.pi;

double degrees(double radians) => radians * radians2Degrees;

double radians(double degrees) => degrees * degrees2Radians;

class HeroRowWidget extends StatelessWidget {
  final HeroModel hero;
  final double rowHeight;

  const HeroRowWidget({
    @required this.hero,
    this.rowHeight = 282,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: rowHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.translate(
            offset: Offset(-10, 0),
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.01)
                ..rotateY(radians(1.5)),
              child: Container(
                height: 216,
                margin: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(-44, 0),
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.01)
                ..rotateY(radians(8)),
              child: Container(
                height: 188,
                margin: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Transform.translate(
                offset: Offset(-30, 0),
                child: Container(
                  child: Hero(
                    tag: hero.name,
                    child: Image.asset(
                      hero.image,
                      width: rowHeight,
                      height: rowHeight,
                      package: 'ui_challenge_3',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(right: 58),
              padding: EdgeInsets.symmetric(vertical: 34),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AttributeWidget(
                    progress: hero.speed,
                    child: Image.asset(speed, package: 'ui_challenge_3',),
                  ),
                  AttributeWidget(
                    progress: hero.health,
                    child: Image.asset(heart, package: 'ui_challenge_3',),
                  ),
                  AttributeWidget(
                    progress: hero.attack,
                    child: Image.asset(knife, package: 'ui_challenge_3',),
                  ),
                  SizedBox(
                    height: 32,
                    child: OutlineButton(
                      child: new Text(
                        'See Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
                          return HeroDetailsPage(hero);
                        }));
                      },
                      color: Colors.white,
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      highlightedBorderColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
