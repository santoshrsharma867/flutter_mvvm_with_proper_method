import 'package:flutter/material.dart';
import 'package:mvvm_complete/data/response/status.dart';
import 'package:mvvm_complete/view_model/home_screen_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final provider = Provider.of<Homenotifier>(context, listen: false);
    provider.userApiCall(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeNotifierProvider =
        Provider.of<Homenotifier>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Api call'),
      ),
      body: Consumer<Homenotifier>(builder: (context, value, _) {
        switch (value.moviesList.status) {
          case Status.LOADING:
            return Center(child: CircularProgressIndicator());
          case Status.ERROR:
            return Center(child: Text(value.moviesList.message.toString()));
          case Status.COMPLETED:
            return ListView.builder(
                itemCount: value.moviesList.data!.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(value.moviesList.data!.data![index].firstName
                          .toString()),
                      subtitle: Text(
                          value.moviesList.data!.data![index].email.toString()),
                    ),
                  );
                });
          default:
            return Container();
        }
      }),

      // Consumer<Homenotifier>(
      //     builder: ((context, value, child) => value.loading
      //         ? Center(
      //             child: CircularProgressIndicator(),
      //           )
      //         : ListView.builder(
      //             itemCount: value.userData.length,
      //             itemBuilder: (context, index) {
      //               return Text(value.userData[index]['first_name']);
      //             })))
    );
  }
}
