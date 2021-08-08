import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
  final String url;

  const SliderCard({Key? key, required this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      
      
      margin: EdgeInsets.all(4),
      child: ClipRRect(        
        borderRadius: BorderRadius.circular(5),
        child: CachedNetworkImage(
          imageUrl: url,
          placeholder: (c, u) {
            return Center(child: CircularProgressIndicator(),);
          },
          errorWidget: (c, u, e) {
            return Center(
              child: Text('Lütfen Tekrar Deneyin'),
            );
          },
        ),
      ),
    );
  }
}
