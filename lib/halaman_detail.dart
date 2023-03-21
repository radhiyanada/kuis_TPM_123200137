import 'package:flutter/material.dart';
import 'package:kuis/data_buku.dart';
//import 'package:url_launcher/url_launcher.dart';

class HalamanDetail extends StatefulWidget {
  final DataBuku buku;
 // final Uri _url = Uri.parse(widget.buku.link);
  const HalamanDetail({Key? key, required this.buku}) : super(key: key);

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  //Future<void> _launchUrl() async {
  //  if (!await launchUrl(_url)) {
  //    throw Exception('Could not launch $_url');
  //  }
  //}
  bool isTrue = true;
  bool isAvailable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.buku.title),
        centerTitle: true,
        actions: <Widget>[
            IconButton(icon: new Icon(Icons.search, color: Colors.white),
            onPressed: () {
             // _launchUrl;
            },),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.buku.imageLink.length,
                    itemBuilder: (context, index){
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Image.network(widget.buku.imageLink),

                      );
                    },
                    pageSnapping: true,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Text('Title                          : ' + widget.buku.title),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Text('Penulis                     : ' + widget.buku.author),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Text('Bahasa                     : ' + widget.buku.language),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Text('Negara                      : ' + widget.buku.country),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Text('Jumlah Halaman    : ' + widget.buku.pages.toString()),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Text('Tahun Terbit            : ' + widget.buku.year.toString()),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Row(
                        children: [
                          Text(
                            'Status                       : ',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            widget.buku.isAvailable ? 'Tersedia' : 'Tidak Tersedia',
                            style: TextStyle(
                              color: widget.buku.isAvailable ? Colors.green : Colors.red,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: widget.buku.isAvailable
                      ? () {
                    setState(() {
                      widget.buku.isAvailable = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Berhasil Meminjam Buku!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                      : null,
                  child: Text(widget.buku.isAvailable ? 'Pinjam' : 'Pinjam'),
                  style: ElevatedButton.styleFrom(
                    primary: widget.buku.isAvailable ? Colors.blue : Colors.grey,
                    textStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
