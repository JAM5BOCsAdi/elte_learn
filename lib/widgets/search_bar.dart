import '../packages_barrel/packages_barrel.dart';

class SearchBar extends StatelessWidget {
  final void Function(String) onSearch;

  const SearchBar({Key? key, required this.onSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Keresés',
        ),
        onSubmitted: onSearch,
      ),
    );
  }
}
