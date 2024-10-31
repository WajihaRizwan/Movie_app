import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  final TextEditingController nameController = TextEditingController(text: "Antonio Renders");
  final TextEditingController usernameController = TextEditingController(text: "@renders.antonio");
  final TextEditingController emailController = TextEditingController(text: "xyz@gmail.com");
  final TextEditingController phoneController = TextEditingController(text: "+123 4567 8901");
  final TextEditingController dobController = TextEditingController(text: "30 February 2022");
  final List<String> genderOptions = ['Male', 'Female', 'Other'];
  String selectedGender = 'Male';

  EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1B3A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1B3A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Edit Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile Image with Edit Icon
            const Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('asessts/644d4e1063c37f8a07062777521d762f.jpg'), // Replace with user's image URL
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.red,
                      child: Icon(Icons.camera_alt, color: Colors.white, size: 16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Name Field
            buildTextField("Name", nameController),
            // Username Field
            buildTextField("Username", usernameController),
            // Email Field
            buildTextField("Email Address", emailController),
            // Phone Field
            buildTextField("Phone Number", phoneController),
            // Date of Birth Field
            buildDateField(context, "Date of Birth", dobController),
            // Gender Dropdown
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text("Gender", style: TextStyle(color: Colors.grey, fontSize: 16)),
            ),
            DropdownButtonFormField<String>(
              value: selectedGender,
              items: genderOptions.map((String gender) {
                return DropdownMenuItem(
                  value: gender,
                  child: Text(gender, style: const TextStyle(color: Colors.white)),
                );
              }).toList(),
              dropdownColor: const Color(0xFF1C1B3A),
              onChanged: (String? newValue) {
                selectedGender = newValue!;
              },
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 16)),
          TextField(
            controller: controller,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDateField(BuildContext context, String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 16)),
          GestureDetector(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                controller.text = "${pickedDate.day} ${pickedDate.month} ${pickedDate.year}";
              }
            },
            child: AbsorbPointer(
              child: TextField(
                controller: controller,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.calendar_today, color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
