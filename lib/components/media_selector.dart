import 'package:flutter/material.dart';

enum MediaType{
  photo,
  video
}

class MediaSelector extends StatefulWidget {
  final MediaType mediaType;
  const MediaSelector({super.key, this.mediaType = MediaType.photo});

  @override
  State<StatefulWidget> createState() {
    return _MediaSelectorState();
  }
}

class _MediaSelectorState extends State<MediaSelector> {
  String _mediaPath = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

      ],
    );
  }

  // Widget _mediaPlaceholder() {
  //   Icon icon;
  //   String caption = '';
  //   Widget placeholderWidget;

  //   if(widget.mediaType == MediaType.photo) {
  //     icon = Icon(Icons.image_not_supported, color: Colors.grey);
  //     caption = 'No photo';
  //     placeholderWidget = Image.file(
  //       File(_mediaPath),
  //       width: double.infinity,
  //       fit: BoxFit.fitWidth,
  //     );
  //   }
  // }
}