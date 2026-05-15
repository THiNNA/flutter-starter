import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  final String message;

  const EmptyStateWidget({super.key, this.message = 'No data available'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.inbox, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text(message, style: const TextStyle(color: Colors.grey, fontSize: 16)),
        ],
      ),
    );
  }
}
