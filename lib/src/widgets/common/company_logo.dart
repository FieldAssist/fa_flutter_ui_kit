import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CompanyLogo extends StatelessWidget {
  const CompanyLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (context, url) => Icon(
        Icons.image,
        color: Colors.grey[100],
      ),
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Cadbury_%282020%29.svg/1920px-Cadbury_%282020%29.svg.png', //TODO: (Samvit) Remove hardcoded company Image URL
    );
  }
}
