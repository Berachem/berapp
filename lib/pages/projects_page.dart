import 'dart:convert';
import 'package:berapp/components/app_bar.dart';
import 'package:berapp/components/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:berapp/components/Media.dart';

class ProjectsPage extends StatefulWidget {
  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  String BASE_URL = 'https://berachem.dev/';
  List<dynamic> projets = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('${BASE_URL}projets.json'));
    if (response.statusCode == 200) {
      setState(() {
        projets = json.decode(response.body)['projets'];
      });
      // affiche toutes les technologies utilisées dans les projets
      print(projets
          .map((e) => e['technologies'])
          .expand((e) => e)
          .toSet()
          .toList());
    } else {
      throw Exception('Failed to load data');
    }
  }

  String getFullMediaLink(String mediaLink) {
    if (mediaLink.contains('http')) {
      return mediaLink;
    }
    return '$BASE_URL$mediaLink';
  }

  List<Color> getColorsFromRandomString(String randomString) {
    // return a list of colors from a random string (backgroundColor, textColor)
    List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.deepPurple,
      Colors.blue.shade900,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
      Colors.pink,
      Colors.teal,
      Colors.cyan,
      Colors.brown,
      Colors.grey,
      Colors.indigo,
      Colors.lime,
      Colors.amber,
    ];

    int index = 0;
    for (var char in randomString.codeUnits) {
      index += char;
    }
    index = index % colors.length;
    return [
      colors[index],
      colors[index].computeLuminance() > 0.5 ? Colors.black : Colors.white
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBarCustom(
        title: const Text('Projets'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => fetchData(),
          ),
        ],
      ),
      body: projets == []
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: projets.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ) ,
                  elevation: 10,
                  margin: const EdgeInsets.all(10),
                  color: Color.fromARGB(75, 15, 51, 117),
                  
       
                  child: ListTile(
                    title: 
                    Center(
                      child:
                      Padding(
                        padding:  const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child:
                    Text( projets[index]['nom'],
                          textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.2,
                          textBaseline: TextBaseline.alphabetic,
                        ),
                      ),
                    ),
                    ),
                 
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        // media (image or video "media" key BASE_URL + media)
                        if (projets[index]['media'] != null)
                          MediaWidget(
                              mediaLink:
                                  getFullMediaLink(projets[index]['media'])),
                        const SizedBox(height: 10),
                        Text(projets[index]['description'], style: Theme.of(context).textTheme.headlineSmall),
                        const SizedBox(height: 10),
                         Text('Technologies', style: Theme.of(context).textTheme.bodySmall),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 4.0,
                          children: [
                            for (var tech in projets[index]['technologies'])
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset('${"images/languages/"+tech.toLowerCase()}.png',
                                      width: 32, height: 32, fit: BoxFit.cover),
                                  const SizedBox(width: 5),
                                ],
                              ),
                          ],
                        ),
                        const SizedBox(height: 10),
                         Text('Liens' , style: Theme.of(context).textTheme.bodySmall),
                        const SizedBox(height: 5),
                        if (projets[index]['lienGitHub'] != null)
                          ListTile(
                            leading: Image.asset('images/languages/github.png', width: 24),
                            title:  Text('GitHub' , style: Theme.of(context).textTheme.headlineSmall),
                            onTap: () {
                              // Open GitHub link
                            },
                          ),
                        if (projets[index]['lienSiteWeb'] != null)
                          ListTile(
                            leading: const Icon(Icons.web, color: Color.fromARGB(255, 143, 159, 231)),
                            title:  Text('Site Web', style: Theme.of(context).textTheme.headlineSmall),
                            onTap: () {
                              // Open Site Web link
                            },
                          ),
                        if (projets[index]['lienRapport'] != null)
                          ListTile(
                            leading: const Icon(Icons.file_present_rounded, color: Color.fromARGB(255, 143, 159, 231)),
                            title:  Text('Rapport', style: Theme.of(context).textTheme.headlineSmall),
                            onTap: () {
                              // Open Rapport link
                            },
                          ),
                      ],
                    ),
                    onTap: () {
                      // Handle onTap event
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: const BottomAppBarCustom(),
    );
  }
}
