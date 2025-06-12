class Student {
  final String name;
  final List<String> borrowedBooks;

  Student({required this.name, List<String>? borrowedBooks})
      : borrowedBooks = borrowedBooks ?? [];
}
