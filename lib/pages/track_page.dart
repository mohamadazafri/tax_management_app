import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'upload_bank_statement_page.dart';
import 'upload_receipt_page.dart';
import 'tax_summary_report.dart';
import 'tax_summary_page.dart';

class ReceiptData {
  final String merchant;
  final double amount;
  final DateTime date;
  final Color color;

  ReceiptData({required this.merchant, required this.amount, required this.date, required this.color});
}

class TrackPage extends StatefulWidget {
  const TrackPage({super.key});

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  int _selectedYear = DateTime.now().year;
  int _selectedMonth = DateTime.now().month;
  // Simulate upload status for each month (replace with your real data source)
  final Map<int, String?> _bankStatementFiles = {
    8: 'august.pdf',
    9: 'september.pdf',
    10: 'october.pdf',
    11: 'november.pdf',
    12: 'december.pdf',
    1: 'january.pdf',
    2: 'february.pdf',
    3: 'march.pdf',
    4: 'april.pdf',
  };

  double overscrollAmount = 0.0;

  final Map<String, List<ReceiptData>> _receiptsByMonth = {
    // January 2024
    '2024-1': [
      ReceiptData(merchant: "7E", amount: 35.00, date: DateTime(2024, 1, 15), color: const Color(0xFF4CAF50)),
      ReceiptData(merchant: "Grocery Store", amount: 156.75, date: DateTime(2024, 1, 10), color: const Color(0xFF2196F3)),
      ReceiptData(merchant: "Restaurant", amount: 88.00, date: DateTime(2024, 1, 5), color: const Color(0xFFFF9800)),
    ],
    // February 2024
    '2024-2': [
      ReceiptData(merchant: "Gas Station", amount: 45.60, date: DateTime(2024, 2, 20), color: const Color(0xFF9C27B0)),
      ReceiptData(merchant: "Coffee Shop", amount: 15.75, date: DateTime(2024, 2, 15), color: const Color(0xFF795548)),
      ReceiptData(merchant: "Pharmacy", amount: 67.80, date: DateTime(2024, 2, 10), color: const Color(0xFFE91E63)),
    ],
    // March 2024
    '2024-3': [
      ReceiptData(merchant: "Bookstore", amount: 89.90, date: DateTime(2024, 3, 25), color: const Color(0xFF009688)),
      ReceiptData(merchant: "Electronics Store", amount: 299.99, date: DateTime(2024, 3, 20), color: const Color(0xFF3F51B5)),
      ReceiptData(merchant: "Clothing Store", amount: 156.75, date: DateTime(2024, 3, 15), color: const Color(0xFFFF5722)),
    ],
    // April 2024
    '2024-4': [
      ReceiptData(merchant: "Hardware Store", amount: 78.50, date: DateTime(2024, 4, 30), color: const Color(0xFF607D8B)),
      ReceiptData(merchant: "Pet Store", amount: 45.25, date: DateTime(2024, 4, 25), color: const Color(0xFF8BC34A)),
      ReceiptData(merchant: "Gym", amount: 120.00, date: DateTime(2024, 4, 20), color: const Color(0xFFCDDC39)),
    ],
    // May 2024
    '2024-5': [
      ReceiptData(merchant: "7E", amount: 35.00, date: DateTime(2024, 5, 15), color: const Color(0xFF4CAF50)),
      ReceiptData(merchant: "Restaurant", amount: 95.50, date: DateTime(2024, 5, 10), color: const Color(0xFFFF9800)),
      ReceiptData(merchant: "Movie Theater", amount: 45.00, date: DateTime(2024, 5, 5), color: const Color(0xFF9C27B0)),
    ],
    // June 2024
    '2024-6': [
      ReceiptData(merchant: "Gas Station", amount: 45.60, date: DateTime(2024, 6, 20), color: const Color(0xFF9C27B0)),
      ReceiptData(merchant: "Coffee Shop", amount: 15.75, date: DateTime(2024, 6, 15), color: const Color(0xFF795548)),
      ReceiptData(merchant: "Pharmacy", amount: 67.80, date: DateTime(2024, 6, 10), color: const Color(0xFFE91E63)),
    ],
    // July 2024
    '2024-7': [
      ReceiptData(merchant: "Bookstore", amount: 89.90, date: DateTime(2024, 7, 25), color: const Color(0xFF009688)),
      ReceiptData(merchant: "Electronics Store", amount: 299.99, date: DateTime(2024, 7, 20), color: const Color(0xFF3F51B5)),
      ReceiptData(merchant: "Clothing Store", amount: 156.75, date: DateTime(2024, 7, 15), color: const Color(0xFFFF5722)),
    ],
    // August 2024
    '2024-8': [
      ReceiptData(merchant: "Hardware Store", amount: 78.50, date: DateTime(2024, 8, 30), color: const Color(0xFF607D8B)),
      ReceiptData(merchant: "Pet Store", amount: 45.25, date: DateTime(2024, 8, 25), color: const Color(0xFF8BC34A)),
      ReceiptData(merchant: "Gym", amount: 120.00, date: DateTime(2024, 8, 20), color: const Color(0xFFCDDC39)),
    ],
    // September 2024
    '2024-9': [
      ReceiptData(merchant: "7E", amount: 35.00, date: DateTime(2024, 9, 15), color: const Color(0xFF4CAF50)),
      ReceiptData(merchant: "Restaurant", amount: 95.50, date: DateTime(2024, 9, 10), color: const Color(0xFFFF9800)),
      ReceiptData(merchant: "Movie Theater", amount: 45.00, date: DateTime(2024, 9, 5), color: const Color(0xFF9C27B0)),
    ],
    // October 2024
    '2024-10': [
      ReceiptData(merchant: "Gas Station", amount: 45.60, date: DateTime(2024, 10, 20), color: const Color(0xFF9C27B0)),
      ReceiptData(merchant: "Coffee Shop", amount: 15.75, date: DateTime(2024, 10, 15), color: const Color(0xFF795548)),
      ReceiptData(merchant: "Pharmacy", amount: 67.80, date: DateTime(2024, 10, 10), color: const Color(0xFFE91E63)),
    ],
    // November 2024
    '2024-11': [
      ReceiptData(merchant: "Bookstore", amount: 89.90, date: DateTime(2024, 11, 25), color: const Color(0xFF009688)),
      ReceiptData(merchant: "Electronics Store", amount: 299.99, date: DateTime(2024, 11, 20), color: const Color(0xFF3F51B5)),
      ReceiptData(merchant: "Clothing Store", amount: 156.75, date: DateTime(2024, 11, 15), color: const Color(0xFFFF5722)),
    ],
    // December 2024
    '2024-12': [
      ReceiptData(merchant: "Hardware Store", amount: 78.50, date: DateTime(2024, 12, 30), color: const Color(0xFF607D8B)),
      ReceiptData(merchant: "Pet Store", amount: 45.25, date: DateTime(2024, 12, 25), color: const Color(0xFF8BC34A)),
      ReceiptData(merchant: "Gym", amount: 120.00, date: DateTime(2024, 12, 20), color: const Color(0xFFCDDC39)),
    ],
    // August 2025
    '2025-8': [
      ReceiptData(merchant: "7E", amount: 35.00, date: DateTime(2025, 8, 15), color: const Color(0xFF4CAF50)),
      ReceiptData(merchant: "Grocery Store", amount: 156.75, date: DateTime(2025, 8, 10), color: const Color(0xFF2196F3)),
      ReceiptData(merchant: "Restaurant", amount: 88.00, date: DateTime(2025, 8, 5), color: const Color(0xFFFF9800)),
    ],
    // September 2025
    '2025-9': [
      ReceiptData(merchant: "Gas Station", amount: 45.60, date: DateTime(2025, 9, 20), color: const Color(0xFF9C27B0)),
      ReceiptData(merchant: "Coffee Shop", amount: 15.75, date: DateTime(2025, 9, 15), color: const Color(0xFF795548)),
      ReceiptData(merchant: "Pharmacy", amount: 67.80, date: DateTime(2025, 9, 10), color: const Color(0xFFE91E63)),
    ],
    // October 2025
    '2025-10': [
      ReceiptData(merchant: "Bookstore", amount: 89.90, date: DateTime(2025, 10, 25), color: const Color(0xFF009688)),
      ReceiptData(merchant: "Electronics Store", amount: 299.99, date: DateTime(2025, 10, 20), color: const Color(0xFF3F51B5)),
      ReceiptData(merchant: "Clothing Store", amount: 156.75, date: DateTime(2025, 10, 15), color: const Color(0xFFFF5722)),
    ],
    // November 2025
    '2025-11': [
      ReceiptData(merchant: "Hardware Store", amount: 78.50, date: DateTime(2025, 11, 30), color: const Color(0xFF607D8B)),
      ReceiptData(merchant: "Pet Store", amount: 45.25, date: DateTime(2025, 11, 25), color: const Color(0xFF8BC34A)),
      ReceiptData(merchant: "Gym", amount: 120.00, date: DateTime(2025, 11, 20), color: const Color(0xFFCDDC39)),
    ],
    // December 2025
    '2025-12': [
      ReceiptData(merchant: "7E", amount: 25.00, date: DateTime(2025, 12, 15), color: const Color(0xFF4CAF50)),
      ReceiptData(merchant: "Restaurant", amount: 95.50, date: DateTime(2025, 12, 10), color: const Color(0xFFFF9800)),
      ReceiptData(merchant: "Movie Theater", amount: 45.00, date: DateTime(2025, 12, 5), color: const Color(0xFF9C27B0)),
    ],
    // January 2025
    '2025-1': [
      ReceiptData(merchant: "7E", amount: 45.00, date: DateTime(2025, 1, 15), color: const Color(0xFF4CAF50)),
      ReceiptData(merchant: "Grocery Store", amount: 123.45, date: DateTime(2025, 1, 10), color: const Color(0xFF2196F3)),
      ReceiptData(merchant: "Restaurant", amount: 88.00, date: DateTime(2025, 1, 5), color: const Color(0xFFFF9800)),
    ],
    // February 2025
    '2025-2': [
      ReceiptData(merchant: "Gas Station", amount: 45.60, date: DateTime(2025, 2, 20), color: const Color(0xFF9C27B0)),
      ReceiptData(merchant: "Coffee Shop", amount: 15.75, date: DateTime(2025, 2, 15), color: const Color(0xFF795548)),
      ReceiptData(merchant: "Pharmacy", amount: 67.80, date: DateTime(2025, 2, 10), color: const Color(0xFFE91E63)),
    ],
    // March 2025
    '2025-3': [
      ReceiptData(merchant: "Bookstore", amount: 89.90, date: DateTime(2025, 3, 25), color: const Color(0xFF009688)),
      ReceiptData(merchant: "Electronics Store", amount: 299.99, date: DateTime(2025, 3, 20), color: const Color(0xFF3F51B5)),
      ReceiptData(merchant: "Clothing Store", amount: 156.75, date: DateTime(2025, 3, 15), color: const Color(0xFFFF5722)),
    ],
    // April 2025
    '2025-4': [
      ReceiptData(merchant: "Hardware Store", amount: 78.50, date: DateTime(2025, 4, 30), color: const Color(0xFF607D8B)),
      ReceiptData(merchant: "Pet Store", amount: 45.25, date: DateTime(2025, 4, 25), color: const Color(0xFF8BC34A)),
      ReceiptData(merchant: "Gym", amount: 120.00, date: DateTime(2025, 4, 20), color: const Color(0xFFCDDC39)),
    ],
    // May 2025
    '2025-5': [
      // ReceiptData(merchant: "7E", amount: 35.00, date: DateTime(2025, 5, 15), color: const Color(0xFF4CAF50)),
      ReceiptData(merchant: "Restaurant", amount: 95.50, date: DateTime(2025, 5, 10), color: const Color(0xFFFF9800)),
      ReceiptData(merchant: "Movie Theater", amount: 45.00, date: DateTime(2025, 5, 5), color: const Color(0xFF9C27B0)),
    ],
  };

  void _goToPreviousYear() {
    setState(() {
      _selectedYear--;
    });
  }

  void _goToNextYear() {
    setState(() {
      _selectedYear++;
    });
  }

  void _onMonthSelected(int month) {
    setState(() {
      _selectedMonth = month;
    });
  }

  void _showFullCardImage(BuildContext context, ReceiptData receipt) {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  "images/img_card.png",
                  fit: BoxFit.contain,
                  color: receipt.color.withOpacity(0.8),
                  colorBlendMode: BlendMode.srcATop,
                ),
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Expenses', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF00303D),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Color(0xffF2F1F3),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              YearSelector(selectedYear: _selectedYear, onPrevious: _goToPreviousYear, onNext: _goToNextYear),
              if (_selectedYear == 2024) ...[
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TaxSummaryPage(year: _selectedYear)));
                  },
                  icon: const Icon(Icons.summarize),
                  label: const Text('View Tax Summary'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00303D),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ],
              const SizedBox(height: 24),
              MonthSegments(selectedMonth: _selectedMonth, onMonthSelected: _onMonthSelected),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => const UploadBankStatementPage()));
                        if (result != null && result is String) {
                          setState(() {
                            _bankStatementFiles[_selectedMonth] = result;
                          });
                        }
                      },
                      icon: const Icon(Icons.account_balance),
                      label: const Text('Upload Bank Statement'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => const UploadReceiptPage()));
                        if (result != null && result is ReceiptData) {
                          setState(() {
                            final key = '$_selectedYear-$_selectedMonth';
                            if (!_receiptsByMonth.containsKey(key)) {
                              _receiptsByMonth[key] = [];
                            }
                            _receiptsByMonth[key]!.add(result);
                          });
                        }
                      },
                      icon: const Icon(Icons.receipt),
                      label: const Text('Upload Receipt'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              BankStatementStatus(
                fileName: _bankStatementFiles[_selectedMonth],
                onView: () {
                  // TODO: Implement bank statement viewing functionality
                },
              ),
              const SizedBox(height: 24),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification notification) {
                    if (notification is OverscrollNotification && notification.overscroll < 0) {
                      setState(() {
                        overscrollAmount = (-notification.overscroll).clamp(0, 100);
                      });
                    } else if (notification is ScrollEndNotification) {
                      setState(() {
                        overscrollAmount = 0;
                      });
                    }
                    return false;
                  },
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Text('Recent Receipts', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF00303D))),
                          ),
                          if (_receiptsByMonth['$_selectedYear-$_selectedMonth'] == null)
                            const Center(
                              child: Padding(
                                padding: EdgeInsets.all(32.0),
                                child: Text('No receipts for this month', style: TextStyle(fontSize: 16, color: Colors.grey)),
                              ),
                            )
                          else
                            ...(_receiptsByMonth['$_selectedYear-$_selectedMonth']!.toList()..sort((a, b) => b.date.compareTo(a.date))).map(
                              (receipt) => ReceiptCard(
                                merchant: receipt.merchant,
                                date: DateFormat('dd MMM yyyy').format(receipt.date),
                                amount: 'RM ${receipt.amount.toStringAsFixed(2)}',
                                color: receipt.color,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class YearSelector extends StatelessWidget {
  final int selectedYear;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const YearSelector({super.key, required this.selectedYear, required this.onPrevious, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2))],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(icon: const Icon(Icons.chevron_left), onPressed: onPrevious, splashRadius: 20),
          Text('$selectedYear', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87)),
          IconButton(icon: const Icon(Icons.chevron_right), onPressed: onNext, splashRadius: 20),
        ],
      ),
    );
  }
}

class MonthSegments extends StatelessWidget {
  final int selectedMonth;
  final ValueChanged<int> onMonthSelected;

  MonthSegments({super.key, required this.selectedMonth, required this.onMonthSelected});

  // List of months from August to July
  static const List<String> months = ['Aug', 'Sep', 'Oct', 'Nov', 'Dec', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(12, (index) {
          // Calculate month number: August is 8, ..., July is 7
          int monthNum = (index + 8) > 12 ? (index + 8) - 12 : (index + 8);
          bool isSelected = selectedMonth == monthNum;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ChoiceChip(label: Text(months[index]), selected: isSelected, onSelected: (_) => onMonthSelected(monthNum)),
          );
        }),
      ),
    );
  }
}

class BankStatementStatus extends StatelessWidget {
  final String? fileName;
  final VoidCallback onView;

  const BankStatementStatus({super.key, required this.fileName, required this.onView});

  @override
  Widget build(BuildContext context) {
    if (fileName != null) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.green)),
        child: Row(
          children: [
            Expanded(child: Text('Bank statement uploaded: $fileName', style: const TextStyle(color: Colors.green), overflow: TextOverflow.ellipsis)),
            TextButton.icon(onPressed: onView, icon: const Icon(Icons.visibility), label: const Text('View')),
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.red[50], borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.red)),
        child: const Text('You have not submitted your bank statement for this month.', style: TextStyle(color: Colors.red)),
      );
    }
  }
}

class ReceiptCard extends StatelessWidget {
  final String merchant;
  final String date;
  final String amount;
  final Color color;

  const ReceiptCard({super.key, required this.merchant, required this.date, required this.amount, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ClipPath(
        clipper: WalletNotchClipper(),
        child: Container(
          height: 120,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(24)),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(merchant, style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(date, style: const TextStyle(color: Colors.white70)),
                  Text(amount, style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom clipper for the notch effect
class WalletNotchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const notchRadius = 24.0;
    final path = Path();
    path.moveTo(0, notchRadius);
    path.quadraticBezierTo(0, 0, notchRadius, 0);
    path.lineTo(size.width - notchRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, notchRadius);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
