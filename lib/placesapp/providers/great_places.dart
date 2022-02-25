import 'package:flutter/material.dart';
import 'package:flutter_app/placesapp/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }
}
