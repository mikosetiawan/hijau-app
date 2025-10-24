import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hijau/datas/product_dummy.dart';
import 'package:hijau/models/product.dart';
import 'package:hijau/theme.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({super.key});

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  final List<Product> products = productDummy;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelColor: primaryColor,
            unselectedLabelColor: greyColor,
            indicatorColor: primaryColor,
            labelStyle: GoogleFonts.notoSans(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            tabs: [
              Tab(text: "Promo Sayuran"),
              Tab(text: "Promo Buah buahan"),
              Tab(text: "Promo Bumbu"),
            ],
          ),

          // Tab menunya
          SizedBox(
            height: 300,
            child: TabBarView(
              children: [
                _ListContainerProduct("sayuran"),
                _ListContainerProduct("buah"),
                _ListContainerProduct("bumbu"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widge product sesuai dengan category
  // ignore: non_constant_identifier_names
  Widget _ListContainerProduct(String keyword) {
    final filtered = products.where((p) => p.category == keyword).toList();

    if (filtered.isEmpty) {
      return Center(
        child: Text(
          "Tidak ada promo produk $keyword",
          style: GoogleFonts.notoSans(fontSize: 12),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: filtered.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // dua kolom
        childAspectRatio: 0.57, // rasio ukuran kartu
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        return _ProductItem(filtered[index]);
      },
    );
  }
}

// Widget tampilan per produk
class _ProductItem extends StatelessWidget {
  final Product product;
  const _ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar produk
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    product.image,
                    height: 170,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 145,
                  child: Container(
                    width: 120,
                    height: 25,
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [secondaryColor, twoSecondaryColor],
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.discount, color: Colors.white, size: 12),
                        SizedBox(width: 5),
                        Text(
                          "Murah Banget!",
                          style: GoogleFonts.notoSans(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),
            // Judul produk
            Text(
              product.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),

            // Qty
            Text(
              '${product.qty.toStringAsFixed(0)} /pcs',
              style: GoogleFonts.notoSans(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),

            // Minimal Order
            Text(
              'Min Belanja Rp. ${product.minOrder.toStringAsFixed(0)}',
              style: GoogleFonts.notoSans(fontSize: 14, color: secondaryColor),
            ),

            Spacer(),

            // Harga & Added Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rp. ${product.price.toStringAsFixed(0)}',
                      style: GoogleFonts.notoSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    Text(
                      'Rp. ${product.diskonPrice.toStringAsFixed(0)}',
                      style: GoogleFonts.notoSans(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: greyColor,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
