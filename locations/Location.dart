import '../animals/Animals.dart';
import '../game/Actions.dart';
import '../langs/Language.dart';
import '../langs/LanguagesTypes.dart';

/// This class is used for creating locations from /locations/LocationsList.dart
class Location
{
    /// Location's name
    final String name;

    /// Location's animal list
    List<Animals> animalList = List<Animals>();

    // Location's actions list
    List<Actions> actions = List<Actions>();

    /// Constructor
    Location(this.name);

    /// Adding animal to list
    void addAnimal(Animals animal) {
        animalList.add(animal);
    }

    /// Remove animal from list
    void removeAnimal(int index) {
        animalList.removeAt(index);
    }

    /// Short getting location name.
    /// Use only object instance for get name.
    /// 
    /// Returned 'string' [name]
    @override
    String toString() {
        //return name;
        return Language.getTranslation(LanguagesTypes.LOCATIONS, name);
    }

    /// Adding action to list
    void addAction(Actions action) {
        actions.add(action);
    }

    /// Getter only active actions.
    /// 
    /// Returned 'List<Actions>'
    List<Actions> getActiveActions() {
        return actions.where((action) => action.isActive);
    }

}