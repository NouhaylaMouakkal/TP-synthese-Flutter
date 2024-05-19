import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<String> contacts = [];
  TextEditingController textController = TextEditingController();

  void addToList() {
    if (textController.text.isNotEmpty) { // Check to ensure no empty text is added
      setState(() {
        contacts.add(textController.text);
        textController.clear();
      });
    }
  }

  void deleteItem(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Enter contact name',
                hintStyle: TextStyle(color: Colors.grey[600]),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder( // Border styling
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
                prefixIcon: const Icon(Icons.person, color: Colors.blueAccent),
                suffixIcon: textController.text.isEmpty
                    ? Container(width: 0)
                    : IconButton(
                  icon: const Icon(Icons.clear, color: Colors.red),
                  onPressed: () {
                    textController.clear();
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              onPressed: addToList,
              color: Colors.blueAccent[100],
              child: const Text("Add"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(contacts[index].substring(0, 1).toUpperCase()),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => deleteItem(index),
                      ),
                      title: Text(contacts[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}