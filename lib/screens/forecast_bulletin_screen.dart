import 'package:flutter/material.dart';

class ForecastBulletinPage extends StatelessWidget {
  const ForecastBulletinPage({super.key});

  @override
  Widget build(BuildContext context) {
    final districts = [
      'TAMIL NADU - THE NILGIRIS',
      'WEST BENGAL - DARJEELING',
      'WEST BENGAL - KALIMPONG',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Forecast Bulletin'),
        leading: const BackButton(),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select any district to get the forecast bulletin reports for the last 7 days',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...districts.map(
              (district) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.blue.shade600,
                    elevation: 3,
                  ),
                  onPressed: () {
                    // Handle district tap
                  },
                  child: Text(
                    district,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
