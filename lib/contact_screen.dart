import 'package:flutter/material.dart';
import 'package:untitled/add_contact_screen.dart';
import 'package:untitled/data/contact_model.dart';

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // сортировка по алфавиту
    List<ContactList> sortedContacts = sortContactsAlphabetically(numbers);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 56, top: 20, bottom: 20),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddContactScreen(),
                ),
              );
            },
            child: const Row(
              children: [
                Icon(Icons.person_add_alt, color: Colors.indigo, size: 25,),
                SizedBox(
                  width: 50,
                ),
                Text('Создать контакт', style: TextStyle(color: Colors.indigo, fontSize: 15),),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: numbers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                  child: ListTile(
                    onTap: () {},
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
                    title: Text('${numbers[index].name}'),
                    subtitle: Text('${numbers[index].number}'),
                  ),
                );
              }),
        )
      ],
    );
  }
}
