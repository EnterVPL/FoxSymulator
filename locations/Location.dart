import '../animals/Animals.dart';

class Location
{
  final String name;
  List<Animals> animalList;

  Location(this.name);

  void addAnimal(Animals animal) {
    animalList.add(animal);
  }

  void removeAnimal(int index) {
    animalList.removeAt(index);
  }

}