import 'package:flutter/material.dart';
import 'package:quiz_app/models/user.dart';
import 'package:quiz_app/models/database.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  late DataBase db;

  var paola = User(
    id: 0,
    name: 'Paola',
    score: 35,
  );

  var teresa = User(
    id: 0,
    name: 'Teresa',
    score: 20,
  );

  // Future<void> addUser(User user) async {
  //   return await db.insertUser(user);
  // }

  // Future<List<User>> getUsers() async {
  //   // addUser(paola);
  //   print("is this thing on?");
  //   return await db.users();
  // }

  @override
  void initState() {
    super.initState();
    db = DataBase();
    db.initialisedDatabase().whenComplete(() async {
      await db.insertUser(teresa);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: db.users(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 100,
                    height: 40,
                    child: Column(
                      children: [
                        Text(
                          "Hi, ${snapshot.data![index].name}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Your best score to date: ${snapshot.data![index].score.toString()}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return const Text("Loading");
          }
        });
  }
}
