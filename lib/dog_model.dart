import 'dart:_http';
import 'dart:convert';

class Dog {
  final String name;
  final String location;
  final String description;
  String imageUrl;
  
  int rating = 10;
  
  Dog.fromJson(Map json)
      : name = json['name'],
        location = json['location'],
        description = json['description'];
        
  Dog(this.name, this.location, this.description);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }
    
    HttpClient http = HttpClient();
    try {    
      var uri = Uri.http('dog.ceo', '/api/breeds/image/random');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();
      imageUrl = json.decode(responseBody)['message'];
    } catch (exception) {
      print(exception);
    }
  }
}