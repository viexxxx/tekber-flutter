import 'package:flutter/material.dart';

void main() {
  runApp(AboutPage());
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      home: ProfileListPage(),
    );
  }
}

class ProfileListPage extends StatelessWidget {
  final List<Map<String, dynamic>> profileList = [
    {
      'title': 'Data Pribadi',
      'description': 'Berisi data pribadi milik Viqi Alvianto',
      'aboutme':
          'Saya lulusan SMAN 1 Pamekasan dan saat ini sedang duduk di bangku semester lima di Institut Teknologi Sepuluh Nopember (ITS) jurusan Sistem Informasi. Sejak SMA saya sudah mempunyai ketertarikan pada bidang IT, oleh karena itu saya memutuskan untuk mengambil jurusan Sistem Informasi.',
      'imageUrl':
          'https://media.licdn.com/dms/image/v2/D5603AQGwMf_iYkmSkg/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1696227364610?e=1736985600&v=beta&t=avxHV0yWkcre6Ps_NdJlaEjnWS8Kuvw6KLF3FfD_n3o', // Link gambar profil
      'data': [
        'Nama : Viqi Alvianto',
        'NRP: 5026221001',
        'Tanggal Lahir : 11 September 2003',
        'Funfact: Tim Bubur tidak diaduk'
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Data Pribadi'),
      ),
      body: ListView.builder(
        itemCount: profileList.length,
        itemBuilder: (context, index) {
          return Card(
            color: const Color.fromARGB(255, 79, 193, 255),
            child: ListTile(
              leading: Image.network(
                profileList[index]['imageUrl']!,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              title: Text(
                profileList[index]['title']!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(profileList[index]['description']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProfileDetailPage(profileData: profileList[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProfileDetailPage extends StatelessWidget {
  final Map<String, dynamic> profileData;
  ProfileDetailPage({required this.profileData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(profileData['title']!),
        backgroundColor: const Color.fromARGB(255, 79, 193, 255),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Profil
            Image.network(
              profileData['imageUrl']!,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),

            // Judul Profil
            Text(
              profileData['title']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            Text(
              profileData['aboutme']!,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: profileData['data'].length,
              itemBuilder: (context, index) {
                return Text(
                  '- ${profileData['data'][index]}',
                  style: TextStyle(fontSize: 16),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
