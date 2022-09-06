import 'package:restaurant_app/local_restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Restaurant App',
        ),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Restaurant> restaurant =
                localRestaurantFromJson(snapshot.requireData).restaurants;
            return StreamBuilder(builder: (BuildContext context, snapshot) {
              return ListView.builder(
                itemCount: restaurant.length,
                itemBuilder: (context, index) {
                  return _buildArticleItem(context, restaurant[index]);
                },
              );
            });
          }
          if (snapshot.hasError) {
            return const Text('Something went wrong.');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Widget _buildArticleItem(BuildContext context, Restaurant restaurant) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Hero(
        tag: restaurant.pictureId,
        child: Image.network(
          restaurant.pictureId,
          width: 100,
        ),
      ),
      title: Text(
        restaurant.name,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5.0),
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
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, '/detailpage', arguments: restaurant);
      },
    );
  }
}
