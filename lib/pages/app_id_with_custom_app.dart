// import 'package:flutter/material.dart';
// import 'package:mep_issuer/constants/app_class.dart';
// import 'package:mep_issuer/utils/app_id_preferences.dart';
// import 'package:mep_issuer/widgets/back_button.dart';

// class AppId extends StatefulWidget {
//   AppId({Key key}) : super(key: key);

//   @override
//   _AppIdState createState() => _AppIdState();
// }

// class _AppIdState extends State<AppId> {
//   List<App> apps = <App>[
//     App(0, 'Blue & Gold'),
//     App(1, 'MEP Demo App'),
//     App(2, 'Connected Card'),
//     App(3, 'Sim Card'),
//     App(4, 'Custom App Id')
//   ];

//   int selectedIndex;
//   String customApp = '';

//   TextEditingController _controller = new TextEditingController();
//   bool _enabled = false;

//   @override
//   void initState() {
//     super.initState();

//     customApp = AppIdPreferences.getCustomId() ?? '';
//     selectedIndex = AppIdPreferences.getId();

//     setState(() {
//       _controller.text = customApp;
//     });

//     _controller.addListener(() {
//       setState(() {});
//     });
//     if (selectedIndex == 4) {
//       setState(() {
//         _enabled = true;
//         _controller.text = customApp;
//       });
//     } else {
//       setState(() {
//         _enabled = false;
//         this.customApp = '';
//         _controller.text = '';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
//       child: Scaffold(
//         appBar: AppBar(
//           leading: CustomBackButton(),
//           centerTitle: true,
//           title: Text(
//             'App Id',
//           ),
//           backgroundColor: Color(0xFFF2F2F7),
//         ),
//         body: Container(
//           padding: EdgeInsets.only(top: 25),
//           color: Color(0xfff2f2f7),
//           child: ListView(
//             // physics: NeverScrollableScrollPhysics(),
//             children: [
//               Divider(
//                 height: 1,
//                 thickness: 2,
//               ),
//               ListView(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 children: List.generate(apps.length, (index) {
//                   return Container(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         ListTile(
//                           tileColor: Colors.white,
//                           onTap: () async {
//                             setState(() {
//                               this.selectedIndex = index;
//                             });
//                             await AppIdPreferences.setId(selectedIndex);
//                             if (selectedIndex == 4) {
//                               setState(() {
//                                 _enabled = true;
//                               });
//                             } else {
//                               setState(() {
//                                 _enabled = false;
//                                 this.customApp = '';
//                                 _controller.text = '';
//                               });
//                               await AppIdPreferences.setCustomId('');
//                               _controller.addListener(() {
//                                 setState(() {});
//                               });
//                             }
//                           },
//                           selected: apps[index].selected,
//                           title: Text(apps[index].title),
//                           trailing: (selectedIndex == index)
//                               ? Icon(Icons.check, color: Colors.blueAccent)
//                               : null,
//                         ),
//                         Divider(
//                           height: 1,
//                           thickness: 2,
//                         ),
//                       ],
//                     ),
//                   );
//                 }),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 color: Color(0xffffffff),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       width: 15.0,
//                     ),
//                     Text(
//                       'Custom App Id',
//                       style: TextStyle(fontSize: 17),
//                     ),
//                     SizedBox(
//                       width: 15.0,
//                     ),
//                     Expanded(
//                       child: TextField(
//                         controller: _controller,
//                         enabled: _enabled,
//                         decoration: InputDecoration(
//                           hintText: "External App Id",
//                           border: InputBorder.none,
//                           suffixIcon: _controller.text.isEmpty
//                               ? Container(
//                                   width: 0,
//                                 )
//                               : IconButton(
//                                   icon: Icon(Icons.check),
//                                   onPressed: () async {
//                                     FocusScope.of(context)
//                                         .requestFocus(FocusNode());
//                                     setState(() {
//                                       this.customApp = customApp;
//                                     });
//                                     await AppIdPreferences.setCustomId(
//                                         customApp);
//                                   },
//                                 ),
//                         ),
//                         onChanged: (customApp) =>
//                             setState(() => this.customApp = customApp),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
