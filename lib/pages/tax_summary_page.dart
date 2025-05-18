import 'package:flutter/material.dart';

class TaxSummaryPage extends StatelessWidget {
  final int year;

  const TaxSummaryPage({super.key, required this.year});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tax Summary $year', style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF00303D),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: const Color(0xffF2F1F3),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSummaryCard(),
              const SizedBox(height: 24),
              _buildMonthlyBreakdown(),
              const SizedBox(height: 24),
              _buildTaxEstimate(),
              const SizedBox(height: 24),
              _buildTaxReliefs(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Annual Summary', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF00303D))),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _SummaryItem(title: 'Total Income', amount: 'RM 45,000.00', color: Colors.green)),
              const SizedBox(width: 16),
              Expanded(child: _SummaryItem(title: 'Total Expenses', amount: 'RM 12,500.00', color: Colors.red)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _SummaryItem(title: 'Net Income', amount: 'RM 32,500.00', color: const Color(0xFF00303D))),
              const SizedBox(width: 16),
              Expanded(child: _SummaryItem(title: 'Estimated Tax', amount: 'RM 3,250.00', color: const Color(0xFF00303D))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMonthlyBreakdown() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Monthly Breakdown', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF00303D))),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 12,
            itemBuilder: (context, index) {
              final month = index + 1;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Expanded(flex: 2, child: Text(_getMonthName(month), style: const TextStyle(fontSize: 16, color: Color(0xFF00303D)))),
                    Expanded(
                      flex: 3,
                      child: Text(
                        'RM ${(1500 + (index * 100)).toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF00303D)),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTaxEstimate() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Tax Estimate Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF00303D))),
          const SizedBox(height: 16),
          _buildTaxDetailRow('Taxable Income', 'RM 32,500.00'),
          _buildTaxDetailRow('Tax Rate', '10%'),
          _buildTaxDetailRow('Estimated Tax', 'RM 3,250.00'),
          const SizedBox(height: 16),
          const Text(
            'Note: This is an estimate based on your current income and expenses. '
            'Final tax amount may vary based on deductions and other factors.',
            style: TextStyle(fontSize: 14, color: Colors.grey, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  Widget _buildTaxDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16, color: Color(0xFF00303D))),
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF00303D))),
        ],
      ),
    );
  }

  Widget _buildTaxReliefs() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Tax Reliefs', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF00303D))),
          const SizedBox(height: 16),
          _buildReliefItem(title: 'EPF Contribution', amount: 'RM 6,000.00', description: 'Maximum relief for EPF contribution', color: Colors.blue),
          _buildReliefItem(
            title: 'Professional Development',
            amount: 'RM 1,000.00',
            description: 'Courses and certifications related to your profession',
            color: Colors.green,
          ),
          _buildReliefItem(
            title: 'Home Office Expenses',
            amount: 'RM 2,500.00',
            description: 'Internet, utilities, and office supplies',
            color: Colors.orange,
          ),
          _buildReliefItem(
            title: 'Professional Insurance',
            amount: 'RM 3,000.00',
            description: 'Professional indemnity insurance',
            color: Colors.purple,
          ),
          _buildReliefItem(title: 'Medical Insurance', amount: 'RM 3,000.00', description: 'Health insurance premium', color: Colors.red),
          const Divider(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total Tax Reliefs', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF00303D))),
              Text('RM 15,500.00', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF00303D))),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Note: These reliefs are based on typical deductions available to freelancers. '
            'Please consult with a tax professional for specific advice.',
            style: TextStyle(fontSize: 14, color: Colors.grey, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  Widget _buildReliefItem({required String title, required String amount, required String description, required Color color}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: 4, height: 40, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF00303D))),
                    Text(amount, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(description, style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getMonthName(int month) {
    const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    return months[month - 1];
  }
}

class _SummaryItem extends StatelessWidget {
  final String title;
  final String amount;
  final Color color;

  const _SummaryItem({required this.title, required this.amount, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 14, color: color, fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          Text(amount, style: TextStyle(fontSize: 16, color: color, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
