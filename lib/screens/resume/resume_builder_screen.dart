import 'package:flutter/material.dart';

class ResumeBuilderScreen extends StatefulWidget {
  const ResumeBuilderScreen({super.key});

  @override
  State<ResumeBuilderScreen> createState() => _ResumeBuilderScreenState();
}

class _ResumeBuilderScreenState extends State<ResumeBuilderScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Build Resume')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _buildSectionHeader('Personal Details'),
            const SizedBox(height: 12),
            TextFormField(decoration: const InputDecoration(labelText: 'Full Name', prefixIcon: Icon(Icons.person))),
            const SizedBox(height: 16),
            TextFormField(decoration: const InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email))),
            const SizedBox(height: 30),
            
            _buildSectionHeader('Education'),
            const SizedBox(height: 12),
            TextFormField(decoration: const InputDecoration(labelText: 'Degree', prefixIcon: Icon(Icons.school))),
            const SizedBox(height: 16),
            TextFormField(decoration: const InputDecoration(labelText: 'University', prefixIcon: Icon(Icons.apartment))),
            const SizedBox(height: 30),

            _buildSectionHeader('Skills'),
            const SizedBox(height: 12),
            TextFormField(
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Skills (comma separated)',
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 30),

            _buildSectionHeader('Experience (Optional)'),
            const SizedBox(height: 12),
            TextFormField(decoration: const InputDecoration(labelText: 'Job Title', prefixIcon: Icon(Icons.work))),
            const SizedBox(height: 16),
            TextFormField(decoration: const InputDecoration(labelText: 'Company', prefixIcon: Icon(Icons.business))),
            
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Save Resume'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigoAccent),
    );
  }
}
