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
                    style: Theme.of(context).textTheme.bodyText2,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Divider(color: Colors.grey),
                  Text(
                    'Foods',
                    style: Theme.of(context).textTheme.bodyText2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Divider(color: Colors.grey),
                  GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: restaurant.menus.foods.length,
                      itemBuilder: (BuildContext context, index) {
                        return Card(
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    restaurant.menus.foods[index].name,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                  const Divider(color: Colors.grey),
                  Text(
                    'Drinks',
                    style: Theme.of(context).textTheme.bodyText2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Divider(color: Colors.grey),
                  GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: restaurant.menus.drinks.length,
                      itemBuilder: (BuildContext context, index) {
                        return Card(
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    restaurant.menus.drinks[index].name,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
