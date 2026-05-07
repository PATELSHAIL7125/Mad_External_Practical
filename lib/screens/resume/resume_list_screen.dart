import 'package:provider/provider.dart';
import '../../providers/resume_provider.dart';

class ResumeListScreen extends StatelessWidget {
  const ResumeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Resumes')),
      body: Consumer<ResumeProvider>(
        builder: (context, provider, child) {
          if (provider.resumes.isEmpty) {
            return const Center(child: Text('No resumes found. Create one!'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: provider.resumes.length,
            itemBuilder: (context, index) {
              final resume = provider.resumes[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  title: Text(resume.fullName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text('Skills: ${resume.skills}'),
                      Text('Email: ${resume.email}'),
                    ],
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResumeBuilderScreen(resume: resume)),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ResumeBuilderScreen()),
          );
        },
        label: const Text('Create New'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
