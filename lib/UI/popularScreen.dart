import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:list_of_popular/UI/popularProvider.dart';
import 'package:provider/provider.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({
    Key key,
  }) : super(key: key);

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
                    shrinkWrap: true,
                    padding: EdgeInsets.all(5.0),
                    itemCount: popularProvider.list.results.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final popular = popularProvider.list.results[index];
                      return Hero(
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
                            Text(
                              popular.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.black54,
                                  color: Colors.white,
                                  fontSize: 17.0),
                            ),
                          ],
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
//
// Flexible(
// child: Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Text(
// popular.name,
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 18,
// ),
// ),
// ],
// ),
// ),
//
// GridView.count(
// crossAxisCount: 2,
// mainAxisSpacing: 10.0,
// crossAxisSpacing: 10.0,
// padding: EdgeInsets.all(5.0),
// children: List.generate(popularProvider.list.results.length,
// (index) {
// final popular = popularProvider.list.results[index];
// return Center(
// child: Hero(
// tag: popular.id,
// child: Container(
// decoration: BoxDecoration(
// image: DecorationImage(
// fit: BoxFit.cover,
// image: NetworkImage(
// 'https://image.tmdb.org/t/p/w500${popular.profilePath}',
// ),
// ),
// ),
// ),
// ),
// );
// }),
// )
