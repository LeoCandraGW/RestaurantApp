import 'package:restaurant_app/local_restaurant.dart';
import 'package:restaurant_app/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class DetailRestaurant extends StatelessWidget {
  final Restaurant restaurant;

  const DetailRestaurant({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: restaurant.pictureId,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                child: Image.network(restaurant.pictureId),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Text(
                        restaurant.name,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.star,
                                  size: 15.0,
                                ),
                                Text(restaurant.rating.toString()),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.place,
                                  size: 15.0,
                                ),
                                Text(restaurant.city)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  const Divider(color: Colors.grey),
                  Text(
                    restaurant.description,
                    textAlign: TextAlign.justify,
                  ),
                  const Divider(color: Colors.grey),
                  Text(
                    'Foods',
                    style: Theme.of(context).textTheme.bodyText2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Divider(color: Colors.grey),
                  FoodGridView(restaurants: restaurant),
                  const Divider(color: Colors.grey),
                  Text(
                    'Drinks',
                    style: Theme.of(context).textTheme.bodyText2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Divider(color: Colors.grey),
                  DrinkGridView(restaurants: restaurant),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodGridView extends StatelessWidget {
  final Restaurant restaurants;
  const FoodGridView({Key? key, required this.restaurants}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        primary: false,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,
          crossAxisSpacing: 30,
          mainAxisSpacing: 10,
        ),
        itemCount: restaurants.menus.foods.length,
        itemBuilder: (BuildContext context, index) {
          return Card(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      restaurants.menus.foods[index].name,
                      style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class DrinkGridView extends StatelessWidget {
  final Restaurant restaurants;
  const DrinkGridView({Key? key, required this.restaurants}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        primary: false,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,
          crossAxisSpacing: 30,
          mainAxisSpacing: 10,
        ),
        itemCount: restaurants.menus.drinks.length,
        itemBuilder: (BuildContext context, index) {
          return Card(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      restaurants.menus.drinks[index].name,
                      style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
