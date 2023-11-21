import 'package:flutter/material.dart';

class MoreCard extends StatelessWidget {
  const MoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 150),
      child: GestureDetector(
        onTap: () => {},
        child: Card(
          color: const Color.fromARGB(255, 71, 69, 69),
          elevation: 0,
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: IconButton(
                    onPressed: () => {},
                    icon: const Icon(Icons.add_outlined),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
