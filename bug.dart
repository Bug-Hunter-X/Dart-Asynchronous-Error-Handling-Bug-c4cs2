```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the data successfully
      final jsonData = jsonDecode(response.body);
      print('Data fetched successfully: $jsonData');
    } else {
      // Handle error - but this misses a crucial detail!
      throw Exception('Failed to load data');
    }
  } catch (e) {
    // This catches ALL exceptions, including the ones that are not network errors
    print('Error fetching data: $e');
    // Log the error somewhere more useful
  }
}
```