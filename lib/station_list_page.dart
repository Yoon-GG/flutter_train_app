import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  final String title;
  StationListPage({required this.title});

  final List<String> _stations = [
    '수서',
    '동탄',
    '평택지제',
    '천안아산',
    '오송',
    '대전',
    '김천구미',
    '동대구',
    '경주',
    '울산',
    '부산',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true, elevation: 0),
      body: ListView.builder(
        itemCount: _stations.length,
        itemBuilder: (ctx, idx) {
          return GestureDetector(
            onTap: () => Navigator.pop(ctx, _stations[idx]),
            child: Container(
              height: 50,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
              ),
              child: Text(
                _stations[idx],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
