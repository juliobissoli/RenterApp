import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitlePropertieScream extends StatefulWidget {
  const TitlePropertieScream({Key? key}) : super(key: key);

  @override
  State<TitlePropertieScream> createState() => _TitlePropertieScreamState();
}

class _TitlePropertieScreamState extends State<TitlePropertieScream> {
  bool search_mode = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: !search_mode
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Imóveis',
                    style: TextStyle(fontSize: 32),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            //   color: Color(0xff333333),

                            child: IconButton(
                                onPressed: () {
                                  print('setting');
                                  search_mode = !search_mode;
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.search,
                                  size: 18,
                                )),
                          ),
                          SizedBox(width: 16),
                          CircleAvatar(
                              radius: 18,
                              backgroundImage:
                                  AssetImage('assets/images/avatar_dafault.png')
                              // NetworkImage('https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
                              )
                        ],
                      ),
                    ),
                  )
                ],
              )
            : Expanded(
                child: Center(
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Imóveis',
                      style: TextStyle(fontSize: 32),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            //   color: Color(0xff333333),

                            child: IconButton(
                                onPressed: () {
                                  print('setting');
                                  search_mode = !search_mode;
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.close,
                                  size: 18,
                                )),
                          ),
                          SizedBox(width: 16),
                          CircleAvatar(
                              radius: 18,
                              backgroundImage:
                                  AssetImage('assets/images/avatar_dafault.png')
                              // NetworkImage('https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
                              )
                        ],
                      ),
                    )
                  ],
              ),
                )));  
  }
}
