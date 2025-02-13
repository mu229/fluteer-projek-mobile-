import 'package:flutter/material.dart';
import '../models/item_model.dart';
import 'change_password_screen.dart';
import 'detail_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ItemModel> items = [
    ItemModel(
      title: 'Adit Sopo Jarwo',
      subtitle: 'Indonesia, Inggris',
      imageUrl: 'assets/1jarwo.jpg',
      rating: 5.0,
      description:
          'Adit Sopo Jarwo adalah sebuah serial animasi kartun asli Indonesia yang mengisahkan tentang petualangan Adit dan teman-temannya yang selalu dihalangi oleh Sopo Jarwo, dua karakter yang berusaha mendapat keuntungan tanpa berusaha',
      mainCharacters: 'Adit, Sopo, Jarwo',
    ),
    ItemModel(
      title: 'Upin dan Ipin',
      subtitle: 'Indonesia, Malaysia, Inggris',
      imageUrl: 'assets/upinipin.jpg',
      rating: 5.0,
      description:
          'Upin dan Ipin adalah sebuah serial animasi Malaysia yang mengisahkan tentang petualangan dua bersaudara kembar, Upin dan Ipin yang tinggal di Malaysia.',
      mainCharacters: 'Upin, Ipin',
    ),
    ItemModel(
      title: 'The Backyardigans',
      subtitle: 'Indonesia, Inggris',
      imageUrl: 'assets/back.jpg',
      rating: 5.0,
      description:
          'The Backyardigans adalah sebuah serial musikal untuk anak-anak yang mengisahkan tentang petualangan 5 teman binatang yang berimajinasi untuk mengubah halaman belakang menjadi dunia yang berbeda',
      mainCharacters: 'Pablo, Tyrone, Uniqua, Tasha, Austin',
    ),
    ItemModel(
      title: 'Thomas and Friends',
      subtitle: 'Indonesia, Inggris',
      imageUrl: 'assets/thomas.jpg',
      rating: 5.0,
      description:
          'Thomas dan Friends adalah sebuah serial televisi anak-anak yang mengisahkan petualangan Thomas, sebuah lokomotif uap biru dan teman-temannya di Pulau Sodor',
      mainCharacters: 'Thomas, Edward, Henry, Gordon, James, Percy, Toby',
    ),
    ItemModel(
      title: 'Tayo The Little Bus',
      subtitle: 'Indonesia, Inggris',
      imageUrl: 'assets/bus.jpg',
      rating: 5.0,
      description:
          'Tayo The Little Bus adalah serial animasi dari Korea Selatan yang mengisahkan tentang petualangan Tayo, sebuah bus biru, dan teman-temannya di kota yang dihuni oleh kendaraan antropomorfik',
      mainCharacters: 'Tayo, Rogi, Lani, Gani',
    ),
    ItemModel(
      title: 'Nussa dan Rara',
      subtitle: 'Indonesia, Inggris',
      imageUrl: 'assets/nusa.jpg',
      rating: 5.0,
      description:
          'Nussa dan Rara adalah serial animasi Indonesia yang mengisahkan tentang petualangan Nussa dan Rara, dua kakak beradik yang hidup di sebuah kampung.',
      mainCharacters: 'Nussa, Rara',
    ),
  ];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
  }

  Widget _buildRatingStars(double rating) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 14, // Mengurangi ukuran bintang
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text('Dunia Animasi Anak'),
                    background: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.deepPurple,
                            Colors.deepPurple.shade200
                          ],
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.movie,
                          size: 80,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.lock),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangePasswordScreen()),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.logout),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                    ),
                  ],
                ),
                SliverPadding(
                  padding: EdgeInsets.all(16.0),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio:
                          0.6, // Menurunkan rasio aspek untuk memberikan lebih banyak ruang vertikal
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        final item = items[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(item: item),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(15)),
                                      child: Image.asset(
                                        item.imageUrl,
                                        height: 120, // Mengurangi tinggi gambar
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black54,
                                      ),
                                      child: IconButton(
                                        icon: Icon(Icons.play_arrow,
                                            color: Colors.white,
                                            size: 20), // Mengurangi ukuran ikon
                                        onPressed: () {
                                          // Implementasi untuk memutar video
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  // Menggunakan Expanded untuk mengisi sisa ruang
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.title,
                                          style: TextStyle(
                                            fontSize:
                                                14, // Mengurangi ukuran font
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          item.subtitle,
                                          style: TextStyle(
                                            fontSize:
                                                10, // Mengurangi ukuran font
                                            color: Colors.grey[600],
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 2),
                                        _buildRatingStars(item.rating),
                                        SizedBox(height: 2),
                                        Text(
                                          'Karakter: ${item.mainCharacters}',
                                          style: TextStyle(
                                              fontSize:
                                                  10), // Mengurangi ukuran font
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 2),
                                        Expanded(
                                          // Menggunakan Expanded untuk deskripsi
                                          child: Text(
                                            item.description,
                                            style: TextStyle(
                                                fontSize:
                                                    10), // Mengurangi ukuran font
                                            maxLines:
                                                3, // Membatasi jumlah baris
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: items.length,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
