import 'package:kiwi/kiwi.dart';
import 'package:renter_app/core/controller/properties-controller.dart';
import 'package:renter_app/core/controller/user-controller.dart';

Future<void> createDependencies() async {
  KiwiContainer state_container = KiwiContainer();
  KiwiContainer user_container = KiwiContainer();

  state_container.registerInstance(PropertieController());
  user_container.registerInstance(UserController());
}
