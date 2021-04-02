import 'package:flutter/material.dart';
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
                ? ListView.builder(
                    itemCount: popularProvider.list.results.length,
                    itemBuilder: (ctx, index) {
                      final popular = popularProvider.list.results[index];
                      return Card(
                        child: Text(popular.name),
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
