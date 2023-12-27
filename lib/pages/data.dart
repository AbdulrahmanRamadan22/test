import 'package:flutter/material.dart';
import 'package:login_firebase/models/Charitie.dart';
import 'package:login_firebase/widgets/defaultButton.dart';

class data extends StatelessWidget {
  final Charitie charitie;
  const data({
    super.key,
    required this.charitie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${charitie.name}"),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          const Positioned.fill(
            child: Image(
              image: AssetImage('assets/plastaine.jpg'),
              fit: BoxFit.cover,
              color: Color.fromRGBO(255, 255, 255, 0.5),
              colorBlendMode: BlendMode.modulate,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(
                  image: AssetImage(
                      charitie.image ?? 'assets/placeholder_image.jpg'),
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(height: 16),
                    Text('Name: ${charitie.name ?? 'N/A'}',
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Text('Phone Number: ${charitie.phoneNum ?? 'N/A'}',
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Text('Instapay: ${charitie.instapay ?? 'N/A'}',
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Text('Bank Account: ${charitie.bankAccount ?? 'N/A'}',
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Text('Hotline: ${charitie.hotline ?? 'N/A'}',
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                  ],
                ),
                const SizedBox(height: 20),
                defaultButton(
                    color: Colors.grey[200],
                    onPressed: () {
                      Navigator.of(context).pushNamed("DonationPage");
                    },
                    text: "اتبرع الان",
                    width: 200),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class customCard extends StatelessWidget {
  const customCard({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image(
            image: AssetImage(image),
            fit: BoxFit.fill,
            height: 100,
            width: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class CustomList extends StatelessWidget {
//   const CustomList({super.key, required this.charitie});
//   final List<Charitie> charitie;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount:charitie.length ,
//       itemBuilder: (context, index) {
//         Row(
//           children: [
//             Text('')
//           ],
//         )
//       }
//     );
//   }
// }

