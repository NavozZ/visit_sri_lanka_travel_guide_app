import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final String title;
  final String body;
  final dynamic date; // Firestore Timestamp or ISO-8601 String

  const NotificationTile({
    super.key,
    required this.title,
    required this.body,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    // Convert date to DateTime safely
    DateTime dt;
    if (date is Timestamp) {
      dt = (date as Timestamp).toDate();
    } else if (date is String) {
      dt = DateTime.tryParse(date as String) ?? DateTime.now();
    } else {
      dt = DateTime.now();
    }

    final formatted =
        '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year} '
        '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        children: [
          // accent bar
          Container(
            width: 6,
            height: 80,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(95, 4, 32, 1),
                  Color.fromRGBO(95, 4, 32, 1)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.notifications, color: Color.fromRGBO(95, 4, 32, 1)),
          const SizedBox(width: 12),

          // main text
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    body,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    formatted,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}
