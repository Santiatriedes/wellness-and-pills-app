

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const wellness_app());
}

// ignore: camel_case_types
class wellness_app extends StatelessWidget {
  const wellness_app({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData.light();

    return MaterialApp(
      title: 'Wellness App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.ralewayTextTheme(baseTheme.textTheme),
        scaffoldBackgroundColor: const Color.fromARGB(255, 140, 152, 94),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 140, 152, 94),
        ),
        useMaterial3: true,
      ),
      routes: {
        //'/': (context) => const SyncMealsScreen(),
        '/screen2': (context) => const MoodSym(),
      },
      home: const SyncMealsScreen(),
    );
  }
}

// SCREEN 1: SYNC MEALS AND MEDS
class SyncMealsScreen extends StatelessWidget {
  const SyncMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 140, 152, 94),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _circleButton(Icons.arrow_back, () {
              Navigator.pop(context);
            }),
            Row(
              children: [
                _circleButton(Icons.bookmark_border, () {
                  Navigator.pushNamed(context, '/screen2');
                }),
                const SizedBox(width: 12),
                _circleButton(Icons.search, () {}),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: const [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage('https://thumb.ac-illust.com/af/af66a4c4791f001597e14459ddc38050_t.jpeg'),
                  radius: 20,
                ),
                SizedBox(width: 10),
                Text(
                  'Sync Meals & Meds',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Syncing meals and pills boosts treatment results.',
              style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 3, 17, 6)),
            ),
            const SizedBox(height: 20),

            // Meals & Meds List Card
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 229, 233, 209),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _mealItem(
                    imageUrl: 'https://static.vecteezy.com/system/resources/thumbnails/028/298/616/small_2x/vegan-salad-with-cucumber-tomato-onion-and-dill-top-view-on-a-plate-illustration-vector.jpg',
                    title: 'Breakfast',
                    subtitle: 'Salad x 230g',
                    time: '8:00am',
                  ),
                  _mealItem(
                    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxFB4iqTKNi31qKPJig51QyGE_BVVkexzwvA&s',
                    title: 'Vitamin D3',
                    subtitle: '2,000 MUI',
                    time: '8:30am',
                  ),
                  _mealItem(
                    imageUrl: 'https://t4.ftcdn.net/jpg/14/39/23/35/360_F_1439233574_XXwJCfNEdJHU2kdV3ygCxqCz0mEXnp3K.jpg',
                    title: 'Amoxicillin',
                    subtitle: '100mg x 4',
                    time: '8:30am',
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _actionButton('+ Add Meal'),
                      const SizedBox(width: 12),
                      _actionButton('+ Add Med'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Upcoming Meal Section
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 229, 233, 209),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Upcoming Meal',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                      Icon(Icons.add),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color:  const Color.fromARGB(255, 207, 213, 177),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: const [
                        CircleAvatar(
                          backgroundImage: NetworkImage('https://t4.ftcdn.net/jpg/14/39/23/35/360_F_1439233574_XXwJCfNEdJHU2kdV3ygCxqCz0mEXnp3K.jpg'),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Amoxicillin\n1 tablet',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text('8:30'),
                        SizedBox(width: 8),
                        Icon(Icons.edit, size: 18),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(Icons.lightbulb, color: Color.fromARGB(255, 140, 152, 94)),
                      SizedBox(height: 2),
                      Text('Recommendation', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'The medication is better tolerated when taken with a source of protein.',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _circleButton(IconData icon, VoidCallback onTap) {
    return CircleAvatar(
      backgroundColor: Colors.black.withOpacity(0.05),
      radius: 30,
      child: IconButton(
        icon: Icon(icon, color: Colors.black),
        onPressed: onTap,
      ),
    );
  }

  Widget _mealItem({required String imageUrl, required String title, required String subtitle, required String time}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 25,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle, style: const TextStyle(fontSize: 12, color: Color.fromARGB(255, 3, 17, 6))),
              ],
            ),
          ),
          Text(time, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _actionButton(String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 207, 213, 177),//rgb(207,213,177)
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}

// SCREEN 2: MOOD & SYMPTOMS PAGE
class MoodSym extends StatefulWidget {
  const MoodSym({super.key});

  @override
  State<MoodSym> createState() => _MoodSymState();
}

class _MoodSymState extends State<MoodSym> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 215, 211, 208),//rgb(215,211,208)
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _circleButton(Icons.arrow_back, () {
              Navigator.pop(context);
            }),
            Row(
              children: [
                _circleButton(Icons.bookmark_border, () {
                  Navigator.pushNamed(context, '/screen2');
                }),
                const SizedBox(width: 12),
                _circleButton(Icons.search, () {}),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Top navigation buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
              ),
              const SizedBox(height: 20),
              // Title
              const Row(
                children: [
                  Text("😄", style: TextStyle(fontSize: 28)),
                  SizedBox(width: 8),
                  Text(
                    "Mood & Symptoms",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Mood/Energy/Pain Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255,248,246,245),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    // Emojis Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        EmojiColumn(label: "Mood", emoji: "😄"),
                        EmojiColumn(label: "Energy", emoji: "😫"),
                        EmojiColumn(label: "Pain", emoji: "😡"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Medication
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Row(
                          children: [
                            Icon(Icons.medication_outlined, color: Colors.green),
                            SizedBox(width: 8),
                            Text("Amoxicillin",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Text("8:30pm"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Row(
                          children: [
                            Icon(Icons.nights_stay_outlined),
                            SizedBox(width: 8),
                            Text("Sleep"),
                          ],
                        ),
                        Switch(value: false, onChanged: null),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Notes section
              Container( 
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255,248,246,245),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.note_alt_outlined),
                        SizedBox(width: 8),
                        Text("Note"),
                        Spacer(),
                        Icon(Icons.add),
                      ],
                    ),
                    const SizedBox(height: 12),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black87),
                        children: [
                          TextSpan(text: "This pills make me feel great every day. "),
                         
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Icon(Icons.mic, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ), 
    );
  }
}

 Widget _circleButton(IconData icon, VoidCallback onTap) {
    return CircleAvatar(
      backgroundColor: Colors.black.withOpacity(0.05),
      radius: 30,
      child: IconButton(
        icon: Icon(icon, color: Colors.black),
        onPressed: onTap,
      ),
    );
  }

class EmojiColumn extends StatelessWidget {
  final String label;
  final String emoji;

  const EmojiColumn({super.key, required this.label, required this.emoji});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 40)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

