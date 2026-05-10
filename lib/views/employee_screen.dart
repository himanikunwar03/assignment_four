import 'package:assignment4/models/employee_model.dart';
import 'package:flutter/material.dart';

import 'employee_output_screen.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final _formKey = GlobalKey<FormState>();

  final _idController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _selectedGender;
  String? _selectedDepartment;

  final List<EmployeeModel> _lstEmployees = [];

  final List<DropdownMenuItem<String>> _genders = const [
    DropdownMenuItem(value: "Male", child: Text("Male")),
    DropdownMenuItem(value: "Female", child: Text("Female")),
    DropdownMenuItem(value: "Other", child: Text("Other")),
  ];

  final List<DropdownMenuItem<String>> _departments = const [
    DropdownMenuItem(value: "HR", child: Text("HR")),
    DropdownMenuItem(value: "IT", child: Text("IT")),
    DropdownMenuItem(value: "Finance", child: Text("Finance")),
    DropdownMenuItem(value: "Marketing", child: Text("Marketing")),
  ];

  @override
  void dispose() {
    _idController.dispose();
    _fullNameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // ✅ ADD EMPLOYEE
  void _addEmployee() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _lstEmployees.add(
          EmployeeModel(
            id: _idController.text,
            fullName: _fullNameController.text,
            gender: _selectedGender!,
            department: _selectedDepartment!,
            username: _usernameController.text,
            password: _passwordController.text,
          ),
        );
      });

      _clearFields();
    }
  }

  // ✅ CLEAR FIELDS
  void _clearFields() {
    _idController.clear();
    _fullNameController.clear();
    _usernameController.clear();
    _passwordController.clear();

    _selectedGender = null;
    _selectedDepartment = null;
  }

  // ✏️ EDIT EMPLOYEE
  void _editEmployee(int index) {
    final emp = _lstEmployees[index];

    _idController.text = emp.id;
    _fullNameController.text = emp.fullName;
    _usernameController.text = emp.username;
    _passwordController.text = emp.password;

    _selectedGender = emp.gender;
    _selectedDepartment = emp.department;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Employee"),
          content: const Text("Update details and click Save"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _lstEmployees[index] = EmployeeModel(
                    id: _idController.text,
                    fullName: _fullNameController.text,
                    gender: _selectedGender!,
                    department: _selectedDepartment!,
                    username: _usernameController.text,
                    password: _passwordController.text,
                  );
                });

                Navigator.pop(context);
                _clearFields();
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  // 🗑 DELETE EMPLOYEE
  void _deleteEmployee(int index) {
    setState(() {
      _lstEmployees.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Screen"),
        backgroundColor: Colors.deepPurple,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // ID
              TextFormField(
                controller: _idController,
                decoration: const InputDecoration(labelText: "Employee ID"),
                validator: (v) => v!.isEmpty ? "Enter ID" : null,
              ),

              const SizedBox(height: 10),

              // Name
              TextFormField(
                controller: _fullNameController,
                decoration: const InputDecoration(labelText: "Full Name"),
                validator: (v) => v!.isEmpty ? "Enter Name" : null,
              ),

              const SizedBox(height: 10),

              // Gender
              DropdownButtonFormField(
                value: _selectedGender,
                items: _genders,
                onChanged: (v) => setState(() => _selectedGender = v),
                decoration: const InputDecoration(labelText: "Gender"),
                validator: (v) => v == null ? "Select Gender" : null,
              ),

              const SizedBox(height: 10),

              // Department
              DropdownButtonFormField(
                value: _selectedDepartment,
                items: _departments,
                onChanged: (v) => setState(() => _selectedDepartment = v),
                decoration: const InputDecoration(labelText: "Department"),
                validator: (v) => v == null ? "Select Department" : null,
              ),

              const SizedBox(height: 10),

              // Username
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: "Username"),
                validator: (v) => v!.isEmpty ? "Enter Username" : null,
              ),

              const SizedBox(height: 10),

              // Password
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Password"),
                validator: (v) => v!.isEmpty ? "Enter Password" : null,
              ),

              const SizedBox(height: 20),

              // 🔥 BUTTON ROW (ADD + VIEW)
              Row(
                children: [
                  // ADD
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _addEmployee,
                      icon: const Icon(Icons.add),
                      label: const Text("Add"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  // VIEW SCREEN
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EmployeeOutputScreen(employees: _lstEmployees),
                          ),
                        );
                      },
                      icon: const Icon(Icons.visibility),
                      label: const Text("View"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // LIST
              _lstEmployees.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _lstEmployees.length,
                      itemBuilder: (context, index) {
                        final emp = _lstEmployees[index];

                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(
                                emp.fullName.isNotEmpty
                                    ? emp.fullName[0].toUpperCase()
                                    : "?",
                              ),
                            ),
                            title: Text(emp.fullName),
                            subtitle: Text(
                              "ID: ${emp.id}\nDept: ${emp.department}",
                            ),
                            isThreeLine: true,

                            // ✏️ + 🗑 BUTTONS
                            trailing: Wrap(
                              spacing: 8,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  color: Colors.blue,
                                  onPressed: () => _editEmployee(index),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  color: Colors.red,
                                  onPressed: () => _deleteEmployee(index),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : const Text("No Employees Yet", textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}