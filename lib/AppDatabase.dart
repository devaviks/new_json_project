import 'dart:async';
import 'package:floor/floor.dart';
import 'package:new_json_project/modal/Products.dart';
import 'dao/product_dao.dart';

@Database(version: 1, entities: [Products])
abstract class AppDatabase extends FloorDatabase {
  ProductDao get personDao;
}