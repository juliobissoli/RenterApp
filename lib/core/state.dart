import 'package:kiwi/kiwi.dart';
import 'package:renter_app/core/controller/properties-controller.dart';

Future<void> createDependencies() async {
  KiwiContainer state_container = KiwiContainer();

  state_container.registerInstance(PropertieController());
}
