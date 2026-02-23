import 'package:flutter/material.dart';
import '../main.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      if (_usernameController.text == "admin" && _passwordController.text == "1234") {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => EventApp()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.redAccent,
            content: Text("Identifiants incorrects", style: TextStyle(color: Colors.white)),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA), // Yon gri trè klè pou background
      body: Stack(
        children: [
          // Ti dekorasyon nan background nan (sèk koulè)
          Positioned(
            top: -100,
            right: -50,
            child: CircleAvatar(radius: 150, backgroundColor: Colors.blue.withOpacity(0.1)),
          ),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo oswa Icon
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(0, 10)),
                        ],
                      ),
                      child: Icon(Icons.lock_person_rounded, size: 60, color: Colors.blueAccent),
                    ),
                    SizedBox(height: 40),
                    Text(
                      "connexion",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF1A237E)),
                    ),
                    SizedBox(height: 10),
                    Text("", style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 40),

                    // Field Itilizatè
                    _buildTextField(
                      controller: _usernameController,
                      label: "Nom d'utilisateur",
                      icon: Icons.person_outline,
                      obscure: false,
                    ),
                    SizedBox(height: 20),

                    // Field Modpas
                    _buildTextField(
                      controller: _passwordController,
                      label: "Mot de passe",
                      icon: Icons.lock_outline,
                      obscure: true,
                    ),
                    SizedBox(height: 30),

                    // Bouton Login "Ultra Style"
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          elevation: 5,
                          shadowColor: Colors.blueAccent.withOpacity(0.4),
                        ),
                        child: Text("SE CONNECTER", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Ti Widget pou nou pa repete kòd input yo
  Widget _buildTextField({required TextEditingController controller, required String label, required IconData icon, required bool obscure}) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      validator: (v) => v!.isEmpty ? "Obligatoire" : null,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        ),
      ),
    );
  }
}