// import 'package:flutter/material.dart';
// import 'package:uber_clone/features/auth/presentation/widget/update/update_message.dart';
// import 'package:uber_clone/features/auth/presentation/widget/update/update_form.dart';
// import 'package:uber_clone/l10n/app_localizations.dart';
// import 'package:uber_clone/utils/constans/color_const.dart';
// import 'package:uber_clone/utils/constans/text_style_const.dart';

// class UpdateUserScreen extends StatelessWidget {
//   const UpdateUserScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           AppLocalizations.of(context)!.updateProfile,
//           style: TextStyleConst.bodyLarge(context),
//         ),
//         centerTitle: true,
//         backgroundColor: ColorConst.primary(context),
//         elevation: 0,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(bottom: Radius.circular(34)),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.close, color: ColorConst.onPrimary(context)),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: const [UpdateMessage(), UpdateForm()],
//           ),
//         ),
//       ),
//     );
//   }
// }
