import 'package:kiwi/kiwi.dart';
import 'package:renter_app/core/controller/properties-controller.dart';
import 'package:renter_app/core/controller/rent_controller.dart';
import 'package:renter_app/core/controller/user-controller.dart';

Future<void> createDependencies() async {
  KiwiContainer state_container = KiwiContainer();
  KiwiContainer user_container = KiwiContainer();
  KiwiContainer rent_container = KiwiContainer();

  state_container.registerInstance(PropertieController());
  user_container.registerInstance(UserController());
  rent_container.registerInstance(RentController());
}
