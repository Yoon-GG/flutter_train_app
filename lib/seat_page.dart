import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SeatPage extends StatefulWidget {
  final String departure;
  final String arrival;
  SeatPage({required this.departure, required this.arrival});

  @override
  _SeatPageState createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  int? _row;
  int? _col;

  void _select(int row, int col) {
    setState(() {
      _row = row;
      _col = col;
    });
  }

  void _confirm() {
    if (_row != null && _col != null) {
      final seatLabel = '${_row! + 1}-${['A', 'B', 'C', 'D'][_col!]}';
      showCupertinoDialog(
        context: context,
        builder: (c) => CupertinoAlertDialog(
          title: Text('예매 하시겠습니까?'),
          content: Text('좌석: $seatLabel'),
          actions: [
            CupertinoDialogAction(
              child: Text('취소', style: TextStyle(color: Colors.red)),
              onPressed: () => Navigator.of(c).pop(),
            ),
            CupertinoDialogAction(
              child: Text('확인', style: TextStyle(color: Colors.blue)),
              onPressed: () {
                Navigator.of(c).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('좌석 선택'), centerTitle: true, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.departure,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                SizedBox(width: 50),
                Icon(Icons.arrow_circle_right_outlined, size: 30),
                SizedBox(width: 50),
                Text(
                  widget.arrival,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _box(Colors.purple),
                SizedBox(width: 4),
                Text('선택됨'),
                SizedBox(width: 20),
                _box(Colors.grey[300]!),
                SizedBox(width: 4),
                Text('선택안됨'),
              ],
            ),
            SizedBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                child: Table(
                  defaultColumnWidth: FixedColumnWidth(50),
                  children: [
                    TableRow(
                      children: [
                        Center(
                          child: Text('A', style: TextStyle(fontSize: 18)),
                        ),
                        Center(
                          child: Text('B', style: TextStyle(fontSize: 18)),
                        ),
                        SizedBox.shrink(),
                        Center(
                          child: Text('C', style: TextStyle(fontSize: 18)),
                        ),
                        Center(
                          child: Text('D', style: TextStyle(fontSize: 18)),
                        ),
                      ],
                    ),
                    for (int i = 0; i < 20; i++)
                      TableRow(
                        children: [
                          _seat(i, 0),
                          _seat(i, 1),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Center(
                              child: Text(
                                '${i + 1}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),

                          _seat(i, 2),
                          _seat(i, 3),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: _confirm,
                child: Text(
                  '예매 하기',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _seat(int row, int col) {
    final sel = (_row == row && _col == col);
    return GestureDetector(
      onTap: () => _select(row, col),
      child: Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
          color: sel ? Colors.purple : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _box(Color c) => Container(
    width: 24,
    height: 24,
    decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(8)),
  );
}
