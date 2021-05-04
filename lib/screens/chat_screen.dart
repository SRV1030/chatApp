import 'package:chatApp/widgets/messages.dart';
import 'package:chatApp/widgets/new_message.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat-The-Bate"),
        actions: [
          DropdownButton(
              icon: Icon(Icons.more_vert,
                  color: Theme.of(context).primaryIconTheme.color),
              items: [
                DropdownMenuItem(
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.exit_to_app),
                        SizedBox(
                          width: 8,
                        ),
                        Text('LogOut'),
                      ],
                    ),
                  ),
                  value: 'logout',
                ),
              ],
              onChanged: (itemIdentifier) {
                if (itemIdentifier == 'logout') {
                  FirebaseAuth.instance.signOut();
                }
              }),
        ],
      ),
      body:
          // StreamBuilder(
          //     stream: Firestore.instance
          //         .collection('chats/30n357IS8UyCivDE8weM/messages')
          //         .snapshots(),
          //     builder: (ctx, streamSnapshot) {
          //       if (streamSnapshot.connectionState == ConnectionState.waiting) {
          //         return Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       }
          //       final documents = streamSnapshot.data.documents;
          //       return ListView.builder(
          //         itemCount: documents.length,
          //         itemBuilder: (ctx, index) => Container(
          //           padding: EdgeInsets.all(8),
          //           child: Text(documents[index]['text']),
          //         ),
          //       );
          //     }),
          Container(
        child: Column(
          children: <Widget>[
            Expanded(child: Messages()),
            NewMessage(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     // Firestore.instance
      //     //     .collection('chats/30n357IS8UyCivDE8weM/messages')
      //     //     .snapshots()
      //     //     .listen(
      //     //   (data) {
      //     //     data.documents.forEach((e) {
      //     //       print(e['text']);
      //     //     });
      //     //   },
      //     // );

      //     // Adding new messages//
      //     Firestore.instance
      //         .collection('chats/30n357IS8UyCivDE8weM/messages')
      //         .add({'text': 'New text added'});
      //   },
      // ),
      
    );
  }
}
