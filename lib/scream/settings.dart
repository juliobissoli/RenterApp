import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:renter_app/components/communs/btn_outlined.dart';
import 'package:renter_app/components/communs/modal.dart';
import 'package:renter_app/components/communs/title-subtitle.dart';
import 'package:renter_app/components/user_settings/change_password.dart';
import 'package:renter_app/core/controller/user-controller.dart';

class SttingsSrceam extends StatefulWidget {
  @override
  _SttingsSrceamState createState() => _SttingsSrceamState();
}

class _SttingsSrceamState extends State<SttingsSrceam> {
  final UserController user_controller = KiwiContainer().resolve();

  _handleLogout(context) async {
    await user_controller.cleanDataLocal();
    Navigator.of(context).pushReplacementNamed('/');
  }

  _handleCahngePass() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return new Modal(
            size_height: 440,
            show_top: false,
            // show_top: false,
            child: ChangePassword(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100),
                TitleSubtitle(
                    title: this.user_controller.username,
                    titleStyle: TextStyle(fontSize: 32),
                    subtitle: 'Nome'),
                SizedBox(height: 32),
                TitleSubtitle(
                    title: this.user_controller.email,
                    titleStyle: TextStyle(fontSize: 32),
                    subtitle: 'Email'),
                SizedBox(height: 64),
                BtnOutlined(
                  func: () {
                    print('vai');
                    _handleCahngePass();
                  },
                  label: "Alterar senha",
                ),
                SizedBox(height: 32),
                BtnOutlined(
                  func: () => _handleLogout(context),
                  label: "Logout",
                  mode: 'danger',
                ),
                SizedBox(height: 36),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        // alignment: Alignment.center,
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).cardTheme.color,
            child: IconButton(
              color: Colors.white,
              highlightColor: Colors.white,
              disabledColor: Colors.white,
              focusColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.close
                  // CupertinoIcons.control,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
