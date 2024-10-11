import 'package:flutter/material.dart';
import '../../../data/faq_data.dart'; // Import FAQ data dummy

class FAQView extends StatefulWidget {
  @override
  _FAQViewState createState() => _FAQViewState();
}

class _FAQViewState extends State<FAQView> {
  int? _expandedIndex; // Keep track of the currently expanded index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FAQ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: faqData.length,
          itemBuilder: (context, index) {
            final faq = faqData[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 0, // Remove card shadow
              child: Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent, // Remove the divider
                ),
                child: ExpansionTile(
                  key: Key(index.toString()), // Unique key to identify the tile
                  tilePadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  leading: Icon(
                    Icons.help_outline,
                    color: Color(0xFF1230AE),
                  ),
                  title: Text(
                    faq['question'] ?? '',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  trailing: Icon(
                    _expandedIndex == index
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Color(0xFF1230AE),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        faq['answer'] ?? '',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ],
                  onExpansionChanged: (expanded) {
                    setState(() {
                      if (expanded) {
                        _expandedIndex = index; // Expand the selected tile
                      } else {
                        _expandedIndex = null; // Close the tile
                      }
                    });
                  },
                  initiallyExpanded: _expandedIndex == index, // Control expanded state
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
