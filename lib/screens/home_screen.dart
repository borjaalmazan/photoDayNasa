import 'package:flutter/material.dart';
import 'package:nasa_files/models/models.dart';
import 'package:nasa_files/services/nasa_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 0, 0, .0),
          toolbarHeight: 50.0,
          title: Center(child: Text('Photo of the Day')),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontSize: 30.0,
          ),
        ),
        body: FutureBuilder(
            future: NasaService().getPhotoDay(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final object = snapshot.data as PhotoResponse;
                return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Column(
                          children: [
                            Image.network(
                              object.url,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const Center(child: CircularProgressIndicator());
                              },
                            ), const SizedBox(height: 20),
                            Text(
                              object.title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ), const SizedBox(height: 10),
                            Text(
                              object.explanation,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ), const SizedBox(height: 20),
                            Text('Copyright:${object.copyright}',
                                style: Theme.of(context).textTheme.bodySmall)
                          ],
                        ),
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
