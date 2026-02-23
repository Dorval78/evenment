import 'package:flutter/material.dart';
import '../data/event_data.dart';
import '../models/event.dart';

class AddEventScreen extends StatefulWidget {
  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _dateController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();

  final String _image = 'assets/images/img5.jpg';

  void _addEvent() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        events.add(Event(
          title: _titleController.text,
          date: _dateController.text,
          location: _locationController.text,
          description: _descriptionController.text,
          image: _image,
        ));
      });

      _formKey.currentState!.reset();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Événement ajouté avec succès !"),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7F9), // Yon ti gri ble trè dou pou background la
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        title: Text("Ajouter un événement", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card ki gen tout input yo
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5)),
                  ],
                ),
                child: Column(
                  children: [
                    _buildCustomTextField(
                      controller: _titleController,
                      label: "Titre",
                      icon: Icons.edit,
                    ),
                    SizedBox(height: 15),
                    _buildCustomTextField(
                      controller: _dateController,
                      label: "Date",
                      icon: Icons.calendar_today,
                    ),
                    SizedBox(height: 15),
                    _buildCustomTextField(
                      controller: _locationController,
                      label: "Lieu",
                      icon: Icons.location_on,
                    ),
                    SizedBox(height: 15),
                    _buildCustomTextField(
                      controller: _descriptionController,
                      label: "Description",
                      icon: Icons.description,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 25),
              
              Text("  Image par défaut :", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey)),
              SizedBox(height: 10),
              
              // Preview Image la ak bèl style
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent.withOpacity(0.3), width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(_image, height: 150, width: double.infinity, fit: BoxFit.cover),
                ),
              ),
              
              SizedBox(height: 30),
              
              // Bouton an ki pran tout lajè a
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _addEvent,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 5,
                  ),
                  child: Text(
                    "AJOUTER L'ÉVÉNEMENT",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Ti Widget pou kreye TextField yo pi vit ak menm style
  Widget _buildCustomTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: (value) => value!.isEmpty ? "Champ obligatoire" : null,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        filled: true,
        fillColor: Colors.grey.shade50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        ),
      ),
    );
  }
}