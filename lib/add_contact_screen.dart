import 'package:flutter/material.dart';
import 'package:untitled/data/contact_model.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  // 1.
  // void addContact() {
  //   setState(() {
  //     ContactList name =
  //         ContactList(name: nameController.text, number: numberController.text);
  //     numbers.add(name);
  //   });
  //   Navigator.pop(context);
  // }


  // 2.
  void addContact() {
    String name = nameController.text;
    String number = numberController.text;

    // Это условие использует метод any для проверки, существует ли хотя бы один элемент в списке numbers,
    // удовлетворяющий заданным условиям.
    // .any() - метод, который возвращает true, если хотя бы один элемент в коллекции
    // соответствует предоставленному условию.

    if (numbers.any((contact) => contact.name == name && contact.number == number)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Контакт уже существует'),
            content: const Text('Контакт уже существует. Введите другое имя или номер.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        numbers.add(ContactList(name: name, number: number));
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Создать контакты'),
        actions: [
          ElevatedButton(
              onPressed: () {
                addContact();
              },
              child: const Text('Сохранить', style: TextStyle(color: Colors.indigo),))
        ],
      ),
      body: Column(
        children: [
          const CircleAvatar(
            radius: 80,
            backgroundColor: Colors.orange,
            child: Center(
              child: Icon(
                Icons.person_rounded,
                size: 100,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(Icons.person),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Имя',
                        hintText: 'Введите имя'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(Icons.call),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: numberController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Телефон',
                        hintText: 'Введите номер'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
