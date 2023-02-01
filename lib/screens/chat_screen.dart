import 'package:flutter/material.dart';
import 'package:flat_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _fireStore = FirebaseFirestore.instance ;
final _auth = FirebaseAuth.instance;


class ChatScreen extends StatefulWidget {
  static String  id=  'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();

  late User loggedInUser;
  // late User loggedInUser ;
  late String message;
  void getCurrentUser() {
    try{
        final user =  _auth.currentUser;
        if(user != null){
          loggedInUser = user;
        }
    }catch(e){
        print(e);
    }
  }
  void getMessages() async{
    final messages = await _fireStore.collection('messages').get();
    print('hello');
   for(var message in messages.docs){
     print(message.get('text'));
     print(message.data());
   }
  }
  void getMessagesStream() async{
    await for(var snapshot in _fireStore.collection('messages').snapshots()){
      for(var message in snapshot.docs){
        print(message.get('text'));
        print(message.data());
      }
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
               // getMessages();
               // getMessagesStream();
                 _auth.signOut();
                 Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        //Do something with the user input.
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //Implement send functionality.
                      messageTextController.clear();
                      _fireStore.collection('messages').add({
                        'text' : message,
                        'sender': loggedInUser.email ,
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class MessageStream extends StatelessWidget {
  const MessageStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream:_fireStore.collection('messages').snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          final messages = snapshot.data?.docs.reversed ;
          List<MessageBuble> messageBubles = [];
          for (var message in messages!){
            final messageText = message.get('text');
            final messageSender = message.get('sender');
            final currentUser =  _auth.currentUser;
            late final messageWidget;
            if(currentUser != null)
            {
             messageWidget = MessageBuble(sender: messageSender,text: messageText,isMe: messageSender == currentUser.email,);

            }else{
              messageWidget = MessageBuble(sender: messageSender,text: messageText,isMe: false,);

            }
            messageBubles.add(messageWidget);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              children: messageBubles,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            ),
          );
        }
    );
  }
}

class MessageBuble extends StatelessWidget {
   MessageBuble({required this.sender,required this.text, required this.isMe});
  final String sender;
  final String text;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(sender,style: const TextStyle(
            fontSize: 12.0,
            color: Colors.black54 ,
          ),),
          Material(
            color: isMe ? Colors.lightBlueAccent : Colors.grey.shade500,
            elevation: 5.0,
            borderRadius: isMe
              ? BorderRadius.only(
              topLeft: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0))
            : BorderRadius.only(
        bottomLeft: Radius.circular(30.0),
        bottomRight: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
        ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              child: Text(text,style: const TextStyle(
                fontSize: 15.0,
                color: Colors.white,
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
