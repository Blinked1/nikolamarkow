import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:dio/dio.dart';

class MessagesTab extends StatefulWidget {
  const MessagesTab({Key? key}) : super(key: key);

  @override
  _MessagesTabState createState() => _MessagesTabState();
}

class _MessagesTabState extends State<MessagesTab> {
  final List<Widget> _messages = [];
  final Dio _dio = Dio();

  @override
  Widget build(BuildContext context) {
    final ThemeData = Theme.of(context);

    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(8.0),
            reverse: true,
            children: _messages,
          ),
        ),
        MessageBar(
          onSend: (text) async {
            _addMessage(true, text);

            print('Message sent: $text');

            var response = await _sendToServer(text); 
            print('Server response: ${response.data}');
          },
          actions: [
            InkWell(

               child: Icon(
                Icons.add,
                color: Colors.black,
                size: 24,
              ),
              onTap: () {},
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: InkWell(
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.pink,
                  size: 24,
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _addMessage(bool isSender, String text) {
    _messages.insert(
      0,
      BubbleSpecialTwo(
        text: text,
        color: isSender ? Color(0xFF1B97F3) : Color(0xFFE8E8EE),
        tail: !isSender,
        isSender: isSender,
      ),
    );

    setState(() {});
  }

  Future<Response> _sendToServer(String text) {
    return _dio.get('http://something-something.com', queryParameters: {'message': text});
  }
}
    // return ListView.builder(
    //       reverse: true,
    //       itemCount: 2,
    //       itemBuilder: (BuildContext context, int index) {
    //         if (index == 0) {
    //           return Align(
    //             alignment: Alignment.centerRight,
    //             child: Container(
    //               margin: const EdgeInsets.all(8.0),
    //               padding: const EdgeInsets.all(8.0),
    //               decoration: BoxDecoration(
    //                 color: theme.colorScheme.primary,
    //                 borderRadius: BorderRadius.circular(8.0),
    //               ),
    //               child: Text(
    //                 'bebra',
    //                 style: theme.textTheme.bodyLarge!
    //                     .copyWith(color: theme.colorScheme.onPrimary),
    //               ),
    //             ),
    //           );
    //         }
    //         MessageBar(
    //           onSend: (_) => print (_),
    //           acions
    //         )
    //         return Align(
    //           alignment: Alignment.centerLeft,
    //           child: Container(
    //             margin: const EdgeInsets.all(8.0),
    //             padding: const EdgeInsets.all(8.0),
    //             decoration: BoxDecoration(
    //               color: theme.colorScheme.primary,
    //               borderRadius: BorderRadius.circular(8.0),
    //             ),
    //             child: Text(
    //               'Hi!',
    //               style: theme.textTheme.bodyLarge!
    //                   .copyWith(color: theme.colorScheme.onPrimary),
    //             ),
    //           ),
    //         );
    //       },
    //     );


