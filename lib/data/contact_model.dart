class ContactList {
  final String name;
  final String number;

  ContactList({required this.name, required this.number});
}

List<ContactList> numbers = [
  ContactList(name: 'Arataki Itto', number: '0700890923'),
  ContactList(name: 'Spruce', number: '0999088724'),
  ContactList(name: 'Kokomi', number: '0705821456'),
  ContactList(name: 'Gorou', number: '07058221457'),
  ContactList(name: 'Kamisato san', number: '0777982245'),
  ContactList(name: 'Brozone', number: '0999742865'),
  ContactList(name: 'Soyeon', number: '+82 2 318-2116'),
  ContactList(name: 'Clay', number: '0999088725'),
  ContactList(name: 'Veneer', number: '0999478245'),
  ContactList(name: 'Viva', number: '0700184299'),
];

// сортировка по алфавиту
List<ContactList> sortContactsAlphabetically(List<ContactList> contacts) {
  contacts.sort((a, b) => a.name.compareTo(b.name));
  return contacts;
}
