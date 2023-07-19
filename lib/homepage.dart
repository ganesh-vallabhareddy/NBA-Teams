import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nba/model/team.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Team> teams = [];

  //get Teams
  Future getTeams() async {
    var response = await http.get(Uri.http('balldontlie.io', 'api/v1/teams'));
    var jsonData = jsonDecode(response.body);

    for (var eachTeam in jsonData['data']) {
      final team = Team(
        abbreviation: eachTeam['abbreviation'],
        city: eachTeam['city'],
      );

      teams.add(team);
    }
    print(teams.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        title: Text('NBA Teams'),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder(
          future: getTeams(),
          builder: (context, snapshot) {
            // if it is done loading then show teamdata

            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: teams.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          title: Text(teams[index].abbreviation),
                          subtitle: Text(teams[index].city),
                        ),
                      ),
                    );
                  });
            }
            // still loading
            else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
