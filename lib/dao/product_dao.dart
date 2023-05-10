import 'package:floor/floor.dart';
import 'package:new_json_project/modal/Products.dart';

@dao
abstract class ProductDao {
  @Query('SELECT * FROM Products')
  Future<List<Products>> findAllPeople();

  @Query('SELECT name FROM Products')
  Stream<List<Products>> findAllPeopleName();

  @Query('SELECT * FROM Products WHERE id = :id')
  Stream<Products?> findPersonById(int id);

  @insert
  Future<void> insertPerson(Products person);
}