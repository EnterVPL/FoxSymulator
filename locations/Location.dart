import '../animals/Animals.dart';
import '../game/Actions.dart';

class Location
{
  final String name;
  List<Animals> animalList = List<Animals>();
  List<Actions> actions = List<Actions>();

  Location(this.name);

  void addAnimal(Animals animal) {
    animalList.add(animal);
  }

  void removeAnimal(int index) {
    animalList.removeAt(index);
  }

  @override
  String toString() {
    return name;
  }

  void addAction(Actions action) {
    actions.add(action);
  }

  List<Actions> getActiveActions() {
    return actions.where((action) => action.isActive);
  }

}