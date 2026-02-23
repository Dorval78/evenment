import 'package:flutter/material.dart';
import '../models/event.dart';

class EditEventScreen extends StatefulWidget {
  final Event event;

  EditEventScreen({required this.event});

  @override
  _EditEventScreenState createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _dateController;
  late TextEditingController _locationController;
  late TextEditingController _descriptionController;

  final String _image = 'assets/images/img5.jpg'; 

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.event.title);
    _dateController = TextEditingController(text: widget.event.date);
    _locationController = TextEditingController(text: widget.event.location);
    _descriptionController = TextEditingController(text: widget.event.description);
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        widget.event.title = _titleController.text;
        widget.event.date = _dateController.text;
        widget.event.location = _locationController.text;
        widget.event.description = _descriptionController.text;
        widget.event.image = _image; 
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Événement mis à jour !"),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.orangeAccent.shade700,
        ),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF9F4), // Yon ti koulè krèm dou
      appBar: AppBar(
        title: Text("Modifier l'événement", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orangeAccent.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: _saveChanges, icon: Icon(Icons.check_circle_outline, size: 28))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner tèt la ak koulè modifikasyon an
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.orangeAccent.shade700,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, -30, 20, 20),
              child: Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15, offset: Offset(0, 5)),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.edit_note, color: Colors.orangeAccent.shade700),
                          SizedBox(width: 10),
                          Text("Modifier les détails", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 25),
                      _buildEditField(_titleController, "Titre", Icons.title),
                      _buildEditField(_dateController, "Date", Icons.calendar_month),
                      _buildEditField(_locationController, "Lieu", Icons.map_outlined),
                      _buildEditField(_descriptionController, "Description", Icons.notes, maxLines: 4),
                      
                      SizedBox(height: 20),
                      Text("Image de l'événement", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade700)),
                      SizedBox(height: 12),
                      
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(_image, height: 150, width: double.infinity, fit: BoxFit.cover),
                      ),
                      
                      SizedBox(height: 35),
                      
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: _saveChanges,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orangeAccent.shade700,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            elevation: 4,
                          ),
                          child: Text("ENREGISTRER LES CHANGEMENTS", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditField(TextEditingController controller, String label, IconData icon, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        validator: (v) => v!.isEmpty ? "Ce champ est requis" : null,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.orangeAccent.shade700),
          filled: true,
          fillColor: Colors.orange.withOpacity(0.03),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.orangeAccent.shade100),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.orangeAccent.shade700, width: 2),
          ),
        ),
      ),
    );
  }
}