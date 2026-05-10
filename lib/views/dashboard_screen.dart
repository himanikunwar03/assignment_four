
import 'package:assignment_four/views/employee_screen.dart';
import 'package:assignment_four/views/image_grid.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color.fromARGB(255, 135, 110, 35),
              const Color.fromARGB(255, 94, 63, 186),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),

              const Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Choose an option below',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),

              const SizedBox(height: 60),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      // Employee Button
                      _buildDashboardCard(
                        context,
                        title: 'Employee',
                        subtitle: 'add and view employee details',
                        icon: Icons.people_alt_rounded,
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 99, 78, 78),
                            const Color.fromARGB(255, 50, 73, 94),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EmployeeScreen(),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 25),

                      // Image Grid View Button
                      _buildDashboardCard(
                        context,
                        title: 'Image Grid View',
                        subtitle: '',
                        icon: Icons.image_rounded,
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 128, 35, 66),
                            const Color.fromARGB(255, 123, 58, 84),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ImageGridViewScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Gradient gradient,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(icon, size: 40, color: Colors.white),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ),

            const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
          ],
        ),
      ),
    );
  }
}