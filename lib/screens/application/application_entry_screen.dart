import 'package:flutter/material.dart';

class ApplicationEntryScreen extends StatefulWidget {
  const ApplicationEntryScreen({super.key});

  @override
  State<ApplicationEntryScreen> createState() => _ApplicationEntryScreenState();
}

class _ApplicationEntryScreenState extends State<ApplicationEntryScreen> {
  String _selectedStatus = 'Applied';
  final List<String> _statusOptions = ['Applied', 'Shortlisted', 'Interview Scheduled', 'Rejected', 'Selected'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Job Application')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(decoration: const InputDecoration(labelText: 'Company Name', prefixIcon: Icon(Icons.business))),
            const SizedBox(height: 16),
            TextFormField(decoration: const InputDecoration(labelText: 'Job Role', prefixIcon: Icon(Icons.work_outline))),
            const SizedBox(height: 16),
            
            DropdownButtonFormField<String>(
              value: _selectedStatus,
              decoration: const InputDecoration(labelText: 'Application Status', prefixIcon: Icon(Icons.sync)),
              items: _statusOptions.map((status) => DropdownMenuItem(value: status, child: Text(status))).toList(),
              onChanged: (val) => setState(() => _selectedStatus = val!),
            ),
            const SizedBox(height: 16),
            
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Select Resume', prefixIcon: Icon(Icons.description)),
              items: const [
                DropdownMenuItem(value: '1', child: Text('Software Engineer Resume')),
                DropdownMenuItem(value: '2', child: Text('Data Analyst Resume')),
              ],
              onChanged: (val) {},
            ),
            const SizedBox(height: 16),

            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Date Applied',
                prefixIcon: Icon(Icons.calendar_today),
                hintText: 'YYYY-MM-DD',
              ),
              readOnly: true,
              onTap: () {
                // Show date picker
              },
            ),
            
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Save Application'),
            ),
          ],
        ),
      ),
    );
  }
}
