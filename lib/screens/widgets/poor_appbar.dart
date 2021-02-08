import 'package:flutter/material.dart';

class PoorAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  PoorAppBar({
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
      centerTitle: true,
      leading: IconButton(
        padding: EdgeInsets.all(0),
        icon: Icon(
          Icons.arrow_back,
          size: Theme.of(context).appBarTheme.iconTheme.size,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
