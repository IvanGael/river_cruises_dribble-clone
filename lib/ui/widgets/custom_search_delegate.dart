
import 'package:flutter/material.dart';

// class CustomSearchDelegate extends SearchDelegate {
//   final List<String> searchResults = [
//     'New York',
//     'Los Angeles',
//     'Chicago',
//     'Houston',
//     'Phoenix'
//   ];

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return Center(
//       child: Text(query),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> suggestions = query.isEmpty
//         ? searchResults
//         : searchResults.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();

//     return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(suggestions[index]),
//           onTap: () {
//             query = suggestions[index];
//             showResults(context);
//           },
//         );
//       },
//     );
//   }
// }



class CustomSearchDelegate extends SearchDelegate<String> {
  final List<String> searchResults = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Phoenix'
  ];

  @override
  String? get searchFieldLabel => "Find a location";
  

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        // close(context, "");
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = query.isEmpty
        ? searchResults
        : searchResults.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            close(context, suggestions[index]);
          },
        );
      },
    );
  }
}