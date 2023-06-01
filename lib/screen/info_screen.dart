import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/info.jpg'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Card(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Developed by AungKoOo',
                  style: TextStyle(fontWeight: FontWeight.bold),),
                ),),
                Link(
                  uri: Uri.parse('https://github.com/kooo12'),
                  builder: (context, FollowLink) => Card(
                      child: TextButton(
                          onPressed: FollowLink,
                          child: const Text('Github Account'))),
                ),
                Link(
                  uri: Uri.parse('https://www.facebook.com/kooo1210'),
                  builder: (context, FollowLink) => Card(
                      child: TextButton(
                          onPressed: FollowLink,
                          child: const Text('Contace me at Messenger'))),
                ),
                Card(
                    child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                            child: const Column(
                          children: [
                            Text('Information :'),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                                'Feedback to me if you found some bugs and errors. Enjoy!')
                          ],
                        ))))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
