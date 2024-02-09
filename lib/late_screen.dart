import 'package:flutter/material.dart';

class LateScreen extends StatelessWidget {
  LateScreen({super.key});

  // Map представляет собой коллекцию, предназначенную для хранения пар "ключ-значение"
  final List<Map<String, dynamic>> contactsList = [
    {
      'name': 'Spruce',
      'number': '0999088724',
      'subtitle': 'Brozone',
      'color': Colors.indigo
    },
    {
      'name': 'Arataki Itto',
      'number': '0707016238',
      'subtitle': 'Arataki gang',
      'image': 'images/arataki.jpg'
    },
    {
      'name': 'Soyeon',
      'number': '+82 2 318-2116',
      'subtitle': '(G)-idle',
      'image': 'images/soyeon.jpg'
    },
    {
      'name': 'Johnny Depp',
      'number': '1-212-926 1359',
      'subtitle': 'actor',
      'image': 'images/johnny.jpg'
    },
    {'name': 'Лысый какой-то', 'number': '1-212-791 1552', 'subtitle': 'actor'},
    {
      'name': 'Angelina Jolie',
      'number': '1-212-468 0524',
      'subtitle': 'actor',
      'image': 'jolie.jpg'
    },
    {'name': 'Margot Robbie', 'number': '1-212-026 1843', 'subtitle': 'actor'}
  ];

  @override
  Widget build(BuildContext context) {
    // contactsList.sort((a, b) => a['name']!.compareTo(b['name']!)); // сортировка по алфавиту
    return ListView.builder(
        itemCount: contactsList.length,
        itemBuilder: (context, index) {
          final name = contactsList[index]['name'];
          final number = contactsList[index]['number'];
          final subtitle = contactsList[index]['subtitle'];
          final image = contactsList[index]['image'];
          final color = contactsList[index]['color'];
          return Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
            child: ListTile(
              leading: const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.pinkAccent,
                child: Center(
                  child: Icon(
                    Icons.person_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
              title: Text(name!),
              subtitle: Text(number!),
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
            ),
          );
        });
  }
}

// Для того чтобы отобразить отдельные имена и номера в вашем виджете LateScreen,
// вы можете создать список данных, содержащий имена и номера, и затем
// использовать эти данные внутри ListView.builder.
