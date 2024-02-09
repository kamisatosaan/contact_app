import 'package:flutter/material.dart';
import 'package:untitled/contact_screen.dart';
import 'package:untitled/favourite_screen.dart';
import 'package:untitled/late_screen.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {

  TextEditingController searchContactController = TextEditingController();

  int currentIndex = 0; // текущий индекс

  List<Widget> screens = [
    const FavoriteScreen(),
    LateScreen(),
    const ContactListScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 0),
          // child: SearchBar(), // пока что не трогаю
          child: TextField(
            controller: searchContactController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 14.0), // Увеличиваем/уменьшаем высоту текстового поля
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Row(
                mainAxisSize: MainAxisSize.min, // Уменьшает размер Row, чтобы занимать минимальное пространство
                children: [
                  Icon(Icons.keyboard_voice_outlined),
                  SizedBox(width: 20,),
                  Icon(Icons.more_vert),
                  SizedBox(width: 10,),
                ],
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: const BorderSide(
                    color: Colors.deepPurpleAccent, width: 2.0),
              ),
              labelText: 'Поиск контаков',
              hintText: 'Поиск ...',
            ),
          ),
        ),
      ),
      body: screens.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: 'Избранные',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_outlined),
            label: 'Недавние',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Контакты',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {},
      ),
    );
  }
}
