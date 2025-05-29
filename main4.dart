

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

// import 'package:qr_code_scanner/qr_code_scanner.dart';


void main() {
  runApp(const WellnessApp());
}

class WellnessApp extends StatelessWidget {
  const WellnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 140, 152, 94), // Set background color here
      ),
      title: 'Wellness App',
      debugShowCheckedModeBanner: false,
      routes: {
        '/screen2': (context) => const MoodSym(),
       '/screen3': (context) => const Amoxi(),
      },
      home:  HomeScreen(),
    );
  }
}



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
   canPop: false,
      child: Scaffold(
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
                  _circleButton(Icons.search, () {
                    Navigator.pushNamed(context,'/screen3');
                  }),
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
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                        'https://thumb.ac-illust.com/af/af66a4c4791f001597e14459ddc38050_t.jpeg'),
                    radius: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Sync Meals \n& Meds',
                    style: GoogleFonts.bungeeShade(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Syncing meals and pills boosts treatment results.',
                style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 3, 17, 6)),
              ),
              const SizedBox(height: 20),
              // Meals & Meds Card
              _buildMealCard(),
              const SizedBox(height: 10),
              _buildUpcomingMealSection(context),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMealCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 229, 233, 209),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _mealItem(
            imageUrl:
                'https://static.vecteezy.com/system/resources/thumbnails/028/298/616/small_2x/vegan-salad-with-cucumber-tomato-onion-and-dill-top-view-on-a-plate-illustration-vector.jpg',
            title: 'Breakfast',
            subtitle: 'Salad x 230g',
            time: '8:00am',
          ),
          _mealItem(
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxFB4iqTKNi31qKPJig51QyGE_BVVkexzwvA&s',
            title: 'Vitamin D3',
            subtitle: '2,000 MUI',
            time: '8:30am',
          ),
          _mealItem(
            imageUrl:
                'https://t4.ftcdn.net/jpg/14/39/23/35/360_F_1439233574_XXwJCfNEdJHU2kdV3ygCxqCz0mEXnp3K.jpg',
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
    );
  }

  Widget _mealItem({required String imageUrl, required String title, required String subtitle, required String time}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: Text(time),
    );
  }

  Widget _actionButton(String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 140, 152, 94),
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Text(label, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildUpcomingMealSection(context) {
    return Container(
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
              Text('Upcoming Meal', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900)),
              Icon(Icons.add),
            ],
          ),
          const SizedBox(height: 20),

GestureDetector(
          onTap:() {
            Navigator.pushNamed(context,'/screen3');
          },
          child:
          Container(
          
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 207, 213, 177),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: const [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://t4.ftcdn.net/jpg/14/39/23/35/360_F_1439233574_XXwJCfNEdJHU2kdV3ygCxqCz0mEXnp3K.jpg'),
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
          ),),

          const SizedBox(height: 10),
          Row(
            children: const [
              Icon(Icons.lightbulb, color: Color.fromARGB(255, 140, 152, 94)),
              SizedBox(width: 8),
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
    );
  }

  Widget _circleButton(IconData icon, VoidCallback onTap) {
    return CircleAvatar(
      backgroundColor: Colors.black.withOpacity(0.05),
      radius: 24,
      child: IconButton(
        icon: Icon(icon, color: Colors.black),
        onPressed: onTap,
      ),
    );
  }
}

 //SCREEN2

class MoodSym extends StatefulWidget {
  const MoodSym({super.key});

  @override
  State<MoodSym> createState() => _MoodSymState();
}

class _MoodSymState extends State<MoodSym> {
  double moodSlider = 60;
  double energySlider = 40;
  double painSlider = 20;

  bool isSleepEnabled = false;
  bool isAddingNote = false;
  String noteText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 215, 211, 208),
        elevation: 0,
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
                _circleButton(Icons.search, () {
                  Navigator.pushNamed(context,'/screen3');
                }),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 215, 211, 208),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text("😄", style: TextStyle(fontSize: 28)),
                    const SizedBox(width: 8),
                    Text(
                          "Mood &\n Symptoms",
                          style: GoogleFonts.bungeeShade(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
// ),import 'package:flutter/material.dart';
                  ],
                ),
                const SizedBox(height: 20),
                _buildMoodCard(),
                const SizedBox(height: 20),
                _buildNotesCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMoodCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 248, 246, 245),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              EmojiColumn(label: "Mood", emoji: "😄"),
              EmojiColumn(label: "Energy", emoji: "😫"),
              EmojiColumn(label: "Pain", emoji: "😡"),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(
            color: Color.fromARGB(255, 180, 182, 180),
            thickness: 1,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://t4.ftcdn.net/jpg/14/39/23/35/360_F_1439233574_XXwJCfNEdJHU2kdV3ygCxqCz0mEXnp3K.jpg',
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Amoxicillin",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text("8:30pm"),
            ],
          ),
          const SizedBox(height: 20),
          _buildColoredSlider("😄", "Mood", moodSlider, (val) {
            setState(() => moodSlider = val);
          }, const Color.fromRGBO(236, 207, 119, 1)),
          _buildColoredSlider("😫", "Energy", energySlider, (val) {
            setState(() => energySlider = val);
          }, const Color.fromRGBO(163, 141, 192, 1)),
          _buildColoredSlider("😡", "Pain", painSlider, (val) {
            setState(() => painSlider = val);
          }, const Color.fromRGBO(205, 106, 82, 1)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        isSleepEnabled ? Icons.nights_stay_outlined : Icons.wb_sunny_outlined,
                      ),
                      const SizedBox(width: 8),
                      Text(isSleepEnabled ? "Sleep" : "Awake"),
                    ],
                  ),
                  SizedBox(width:130),
                  Switch(
                    value: isSleepEnabled,
                    onChanged: (val) {
                      setState(() {
                        isSleepEnabled = val;
                      });
                    },
                  ),
                ],
              ),


            
            ],
          )
        ],
         
      ),
      
    );
  }

  Widget _buildNotesCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 248, 246, 245),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.note_alt_outlined),
              const SizedBox(width: 8),
              const Text("Note"),
              const Spacer(),
              IconButton(
                icon: Icon(isAddingNote ? Icons.check : Icons.add),
                onPressed: () {
                  setState(() {
                    isAddingNote = !isAddingNote;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 12),
          isAddingNote
              ? TextField(
                  onChanged: (val) {
                    setState(() {
                      noteText = val;
                    });
                  },
                  controller: TextEditingController(text: noteText),
                  decoration: const InputDecoration(
                    hintText: "Enter your note here...",
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                )
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      isAddingNote = true;
                    });
                  },
                  child: SelectableText(
                    noteText.isNotEmpty
                        ? noteText
                        : "This pill makes me feel great every day.",
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.bottomRight,
            child: CircleAvatar(
              backgroundColor: Colors.green,
              child: IconButton(
                icon: const Icon(Icons.mic, color: Colors.white),
                onPressed: () {
                 
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildColoredSlider(String emoji, String label, double value,
      Function(double) onChanged, Color activeColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 22)),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 12),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Slider(
              value: value,
              max: 100,
              divisions: 100,
              label: value.round().toString(),
              activeColor: activeColor,
              onChanged: onChanged,
            ),
          ),
        ],
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
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold,fontSize:12,)),
      ],
    );
  }
}



//SCREEN 3

// class Amoxi extends StatefulWidget {
//   const Amoxi({super.key});

//   @override
//   State<Amoxi> createState() => _AmoxiState();
// }

// class _AmoxiState extends State<Amoxi> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     )..repeat(reverse: true);

//     _animation = Tween<double>(begin: 0, end: 20).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 100,
//         automaticallyImplyLeading: false,
//         backgroundColor: const Color.fromARGB(255, 140, 152, 94),
//         elevation: 0,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             _circleButton(Icons.arrow_back, () {
//               Navigator.pop(context);
//             }),
//             Row(
//               children: [
//                 _circleButton(Icons.bookmark_border, () {
//                   Navigator.pushNamed(context, '/screen2');
//                 }),
//                 const SizedBox(width: 12),
//                 _circleButton(Icons.search, () {
//                   Navigator.pushNamed(context, '/screen3');
//                 }),
//                 const SizedBox(width: 12),
//                 _circleButton(Icons.qr_code_scanner, () {
//                   // QR scanner will be implemented later
//                 }),
//               ],
//             ),
//           ],
//         ),
//       ),
//       body: Container(
//         color: const Color.fromARGB(255, 140, 152, 94),
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               const SizedBox(height: 20),
//               AnimatedBuilder(
//                 animation: _animation,
//                 builder: (context, child) {
//                   return Transform.translate(
//                     offset: Offset(0, -_animation.value),
//                     child: child,
//                   );
//                 },
//                 child: Image.asset(
//                   "assets/final.png",
//                   width: 220,
//                   height: 220,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   _actionButton('500mg'),
//                   const SizedBox(width: 12),
//                   _actionButton('Take With Food'),
//                 ],
//               ),
//               const SizedBox(height: 30),
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: List.generate(5, (index) {
//                         IconData icon;
//                         Color color;
//                         if (index == 1) {
//                           icon = Icons.close;
//                           color = Colors.red;
//                         } else if (index == 4) {
//                           icon = Icons.circle_outlined;
//                           color = Colors.grey;
//                         } else {
//                           icon = Icons.check;
//                           color = Colors.green;
//                         }
//                         return Column(
//                           children: [
//                             const CircleAvatar(
//                               backgroundColor: Color(0xFFEFEFEF),
//                               radius: 22,
//                               backgroundImage: AssetImage("assets/pill.png"),
//                             ),
//                             const SizedBox(height: 4),
//                             Icon(icon, color: color, size: 16),
//                           ],
//                         );
//                       }),
//                     ),
//                     const SizedBox(height: 20),
//                     Row(
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: const [
//                             Text(
//                               "12 pills left",
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(height: 4),
//                             Text("4 days remaining"),
//                           ],
//                         ),
//                         const Spacer(),
//                         Image.network(
//                           "https://randomqr.com/assets/images/randomqr-256.png",
//                           width: 50,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           backgroundColor:
//                               const Color.fromARGB(255, 140, 152, 94),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                         ),
//                         onPressed: () {
//                           // Handle order refill
//                         },
//                         child: const Text("Order Refill",
//                             style:
//                                 TextStyle(fontSize: 16, color: Colors.white)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 40),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _actionButton(String label) {
//     return Flexible(
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 12),
//         decoration: BoxDecoration(
//           color: const Color.fromARGB(255, 200, 206, 171),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         alignment: Alignment.center,
//         child: Text(
//           label,
//           style: const TextStyle(
//               color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w400),
//         ),
//       ),
//     );
//   }

//   Widget _circleButton(IconData icon, VoidCallback onTap) {
//     return CircleAvatar(
//       backgroundColor: Colors.black.withOpacity(0.05),
//       radius: 30,
//       child: IconButton(
//         icon: Icon(icon, color: Colors.black),
//         onPressed: onTap,
//       ),
//     );
//   }
// }



class Amoxi extends StatefulWidget {
  const Amoxi({super.key});

  @override
  State<Amoxi> createState() => _AmoxiState();
}

class _AmoxiState extends State<Amoxi> with SingleTickerProviderStateMixin {
  String _qrResult = 'No result yet';

  Future<void> _scanQRCode() async {
    try {
      final result = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', // Line color
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        _qrResult = result;
      });
    } catch (e) {
      setState(() {
        _qrResult = 'Error scanning QR';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60), // top spacing
          Center(
            child: Image.network(
              'https://icons.iconarchive.com/icons/microsoft/fluentui-emoji-3d/72/Pill-3d-icon.png',
              width: 72,
              height: 72,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Your Health, Simplified',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 40),

          // QR Scan Button
          ElevatedButton.icon(
            onPressed: _scanQRCode,
            icon: const Icon(Icons.qr_code_scanner),
            label: const Text('Scan QR Code'),
          ),
          const SizedBox(height: 10),

          // QR Result Display
          Text(
            'QR Result: $_qrResult',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
