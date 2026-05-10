
import 'package:assignment_four/models/employee_model.dart';
import 'package:flutter/material.dart';

class EmployeeOutputScreen extends StatelessWidget {
  final List<EmployeeModel> employees;

  const EmployeeOutputScreen({super.key, required this.employees});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Employee List")),
      body: employees.isNotEmpty
          ? ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) {
                final emp = employees[index];

                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(emp.fullName[0].toUpperCase()),
                    ),
                    title: Text("${emp.fullName} (${emp.id})"),
                    subtitle: Text(
                      "Gender: ${emp.gender}\nDept: ${emp.department}\nUser: ${emp.username}",
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            )
          : const Center(
              child: Text("No Employees Found", style: TextStyle(fontSize: 18)),
            ),
    );
  }
}