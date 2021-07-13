import 'package:basic_sqlite/model.dart';
import 'package:basic_sqlite/database/database_helper.dart';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DataBaseHelper dbHelper = DataBaseHelper.instance; 

  // Create a Dog and add it to the dogs table
  var fido = Dog(
    id: 0,
    name: 'Fido',
    age: 35,
  );

  await dbHelper.insert(fido);

  // Now, use the method above to retrieve all the dogs.
  print(await dbHelper.dogs()); // Prints a list that include Fido.

  // Update Fido's age and save it to the database.
  fido = Dog(
    id: fido.id,
    name: fido.name,
    age: fido.age + 7,
  );
  await dbHelper.updateDog(fido);

  // Print the updated results.
  print(await dbHelper.dogs()); // Prints Fido with age 42.

  // Delete Fido from the database.
  // await deleteDog(fido.id);

  // Print the list of dogs (empty).
  print(await dbHelper.dogs());
}
