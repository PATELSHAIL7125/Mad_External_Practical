import 'package:provider/provider.dart';
import '../../providers/application_provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Job Tracker Dashboard')),
      body: Consumer<ApplicationProvider>(
        builder: (context, provider, child) {
          final apps = provider.applications;
          final stats = provider.getStatusDistribution();
          
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Quick Overview',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                _buildStatGrid(apps.length, stats),
                const SizedBox(height: 30),
                const Text(
                  'Application Status',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildStatusChart(stats),
                const SizedBox(height: 30),
                const Text(
                  'Recent Applications',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildRecentApplications(apps),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatGrid(int total, Map<String, int> stats) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.5,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildStatCard('Total', total.toString(), Colors.blue),
        _buildStatCard('Applied', (stats['Applied'] ?? 0).toString(), Colors.orange),
        _buildStatCard('Interviews', (stats['Interview Scheduled'] ?? 0).toString(), Colors.purple),
        _buildStatCard('Selected', (stats['Selected'] ?? 0).toString(), Colors.green),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
          Text(label, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildStatusChart(Map<String, int> stats) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
      ),
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(value: (stats['Applied'] ?? 0).toDouble(), color: Colors.orange, title: 'App'),
            PieChartSectionData(value: (stats['Interview Scheduled'] ?? 0).toDouble(), color: Colors.purple, title: 'Int'),
            PieChartSectionData(value: (stats['Selected'] ?? 0).toDouble(), color: Colors.green, title: 'Sel'),
            PieChartSectionData(value: (stats['Rejected'] ?? 0).toDouble(), color: Colors.red, title: 'Rej'),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentApplications(List apps) {
    final recent = apps.reversed.take(5).toList();
    if (recent.isEmpty) {
      return const Center(child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Text('No applications yet.'),
      ));
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: recent.length,
      itemBuilder: (context, index) {
        final app = recent[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.withOpacity(0.2),
              child: const Icon(Icons.business, color: Colors.blue),
            ),
            title: Text(app.companyName),
            subtitle: Text(app.jobRole),
            trailing: Text(app.status, style: const TextStyle(color: Colors.orange)),
          ),
        );
      },
    );
  }
}
