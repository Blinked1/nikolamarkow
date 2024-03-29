import 'package:flutter/material.dart';


class HomeContent extends StatelessWidget {
  const HomeContent({ super.key });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
            child: Center(
              child: Text(
                'Home 123',
                
                style: Theme.of(context).textTheme.titleLarge,
                
              ),
            ),
          );

  }
  
}