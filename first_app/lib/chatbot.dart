import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> _messages = [];

  // Replace with your Gemini API key
  final String _geminiApiKey = 'AIzaSyCO1FrXpKcd5-ZWW_EJ9D5sLHfo67Djvz8';

  Future<void> _sendMessage(String message) async {
    setState(() {
      _messages.add({'sender': 'user', 'message': message});
    });
    _controller.clear();

    final response = await http.post(
      Uri.parse('https://api.ai.google/v1/sendToConversation'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_geminiApiKey',
      },
      body: json.encode({
        'conversationId': 'YOUR_CONVERSATION_ID', 
        'queryInput': {
          'text': {
            'text': message,
            'languageCode': 'en',
          },
        },
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final botMessage = data['webQueryResult']['conversationResponse']['messages'][0]['text']['text'];
      setState(() {
        _messages.add({'sender': 'bot', 'message': botMessage});
      });
    } else {
      setState(() {
        _messages.add({'sender': 'bot', 'message': 'Something went wrong. Please try again.'});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatBot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Text(message['message']!),
                  subtitle: Text(message['sender']!),
                  tileColor: message['sender'] == 'user' ? Colors.blue[100] : Colors.grey[300],
                  trailing: message['sender'] == 'user' ? Icon(Icons.person) : Icon(Icons.smart_toy),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      _sendMessage(_controller.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
