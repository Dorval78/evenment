import 'package:flutter/material.dart';
import '../models/event.dart';
import '../screens/show_event_screen.dart';
import '../screens/edit_event_screen.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final VoidCallback onDelete;

  EventCard({required this.event, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: event.image.isNotEmpty
                  ? Image.asset(event.image, width: 50, height: 50, fit: BoxFit.cover)
                  : Icon(Icons.event),
              title: Text(event.title, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("${event.date} - ${event.location}"),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ShowEventScreen(event: event)),
                    );
                  },
                  icon: Icon(Icons.visibility),
                  label: Text("Voir"),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => EditEventScreen(event: event)),
                    );
                  },
                  icon: Icon(Icons.edit),
                  label: Text("Modifier"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                ),
                ElevatedButton.icon(
                  onPressed: () => _confirmDelete(context),
                  icon: Icon(Icons.delete),
                  label: Text("Supprimer"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Supprimer l'événement"),
        content: Text("Voulez-vous vraiment supprimer '${event.title}' ?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text("Annuler"),
          ),
          TextButton(
            onPressed: () {
              onDelete();
              Navigator.of(ctx).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Événement supprimé !")),
              );
            },
            child: Text("Supprimer", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
