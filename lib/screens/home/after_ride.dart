import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:public_bicycle_sharing/screens/home/home.dart';
import 'package:intl/intl.dart';

class AfterRideScreen extends StatefulWidget {
  const AfterRideScreen({super.key});
  @override
  State<AfterRideScreen> createState() => _AfterRideScreenState();
}

class _AfterRideScreenState extends State<AfterRideScreen> {
  String _selectedOption = '';
  double _emojiRating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Text(DateFormat('EEEE, MMMM d, y').format(DateTime.now()),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Ride Time: '),
                    Text('28 min',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Ride Fare: '),
                    Text('\u{20B9}5',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'How was your ride?',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                RatingBar.builder(
                  initialRating: _emojiRating,
                  itemCount: 5,
                  itemSize: 50,
                  allowHalfRating: false,
                  glow: true,
                  glowColor: Colors.blue,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return Icon(
                          Icons.sentiment_very_dissatisfied,
                          color: _emojiRating == 1 ? Colors.red : Colors.grey,
                        );
                      case 1:
                        return Icon(
                          Icons.sentiment_dissatisfied,
                          color: _emojiRating == 2
                              ? Colors.redAccent
                              : Colors.grey,
                        );
                      case 2:
                        return Icon(
                          Icons.sentiment_neutral,
                          color: _emojiRating == 3 ? Colors.amber : Colors.grey,
                        );
                      case 3:
                        return Icon(
                          Icons.sentiment_satisfied,
                          color: _emojiRating == 4
                              ? Colors.lightGreen
                              : Colors.grey,
                        );
                      case 4:
                        return Icon(
                          Icons.sentiment_very_satisfied,
                          color: _emojiRating == 5 ? Colors.green : Colors.grey,
                        );
                      default:
                        return Container();
                    }
                  },
                  onRatingUpdate: (rating) {
                    setState(() {
                      _emojiRating = rating;
                    });
                  },
                ),
                const SizedBox(height: 25),
                buildCheckItem("Issue while locking"),
                buildCheckItem("App froze"),
                buildCheckItem("Seat broken"),
                buildCheckItem("Location issue"),
                buildCheckItem("Other issues"),
                const SizedBox(height: 16.0),
                buildFeedbackForm(),
                const SizedBox(height: 40.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                        (route) => false);
                  },
                  child: const Text('Done'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCheckItem(String option) {
    return RadioListTile<String>(
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      title: Text(option),
      value: option,
      groupValue: _selectedOption,
      onChanged: (String? value) {
        setState(() {
          _selectedOption = value!;
        });
      },
    );
  }

  Widget buildFeedbackForm() {
    return SizedBox(
      height: 100,
      child: TextField(
        maxLines: 10,
        decoration: const InputDecoration(
          hintText: "Share your experience",
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        onChanged: (value) {
          setState(() {});
        },
      ),
    );
  }
}
