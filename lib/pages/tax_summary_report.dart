import 'package:flutter/material.dart';

class TaxSummaryReport extends StatelessWidget {
  final int year;

  const TaxSummaryReport({super.key, required this.year});

  @override
  Widget build(BuildContext context) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tax Summary $year', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF00303D))),
              IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: const Text('Tax Summary Information'),
                          content: const Text(
                            'This summary shows your total income, expenses, and estimated tax for the year. '
                            'The data is based on your uploaded receipts and bank statements.',
                          ),
                          actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
                        ),
                  );
                },
              ),
            ],
          ),
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
