import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:list_of_popular/UI/ImageScreen.dart';
import 'package:list_of_popular/UI/detailsScreen.dart';
import 'package:list_of_popular/UI/popularProvider.dart';
import 'package:provider/provider.dart';

class PopularScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular List"),
      ),
      body: ChangeNotifierProvider<PopularProvider>(
        create: (context) => PopularProvider(),
        child: Consumer<PopularProvider>(
          builder: (buildContext, popularProvider, _) {
            return (popularProvider.list != null)
                ? GridView.builder(
                    controller: popularProvider.scrollController,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(5.0),
                    itemCount: popularProvider.list.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0,
                    ),
                    itemBuilder: (BuildContext context, index) {
                      final popular = popularProvider.list[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ImageScreen(
                                id: popular.id,
                                image:
                                    'https://image.tmdb.org/t/p/w500${popular.profilePath}',
                                name: popular.name),
                          ));
                        },
                        child: Hero(
                          tag: popular.id,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500${popular.profilePath}',
                                    ),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsScreen(popular: popular),
                                  ));
                                },
                                child: Text(
                                  popular.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      backgroundColor: Colors.black54,
                                      color: Colors.white,
                                      fontSize: 16.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
