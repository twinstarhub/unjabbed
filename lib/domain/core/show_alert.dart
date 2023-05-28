import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class ShowAlert {
  
  static Future image(
      BuildContext context, {
        required String image
      }) async {
       
    return showGeneralDialog(
      context: context,
      transitionDuration: const Duration(milliseconds: 450),
      transitionBuilder: (context, a1, a2, widget) {
        return ScaleTransition(
          scale: Tween(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: a1,
                  curve: const ElasticOutCurve(.8),
                  reverseCurve: Curves.easeInCubic)),
          child: FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                parent: a1, curve: Curves.easeOutBack, reverseCurve: Curves.easeInCubic)),
            child: widget),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width*.9,
                  height: MediaQuery.of(context).size.height*.7,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                    width: double.infinity,
                    child: CachedNetworkImage(
                          imageUrl:image
                      )),
                  ),
                ),
              ),
              const SizedBox(
                        height: 20,
                      ),
                      IconButton(
                        onPressed: () async{
                          Navigator.pop(context);
                        },
                        icon:Icon(Icons.clear),
                      ),
            ],
          ),
        );
      },
    );
  }

}