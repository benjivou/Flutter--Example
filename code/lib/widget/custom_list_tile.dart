import 'package:app/utilities/web_utils.dart';
import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.sourceUrl,
  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final String sourceUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: thumbnail,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(title),
              ),
              Padding(
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                  onPressed: () => launchURL(sourceUrl),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
