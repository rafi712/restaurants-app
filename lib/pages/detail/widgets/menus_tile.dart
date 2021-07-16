import 'package:flutter/material.dart';

import 'package:restaurants_app/pages/detail/widgets/menus_modal.dart';

class MenusTile extends StatelessWidget {
  final BuildContext context;
  MenusTile({required this.context});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      title: Text(
        'Menus',
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w400
        ),
      ),
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (_) => MenusModal(context: this.context),
        );
      },
    );
  }
}
