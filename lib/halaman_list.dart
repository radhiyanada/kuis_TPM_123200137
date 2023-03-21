import 'package:flutter/material.dart';
import 'package:kuis/data_buku.dart';
import 'package:kuis/halaman_detail.dart';

class HalamanList extends StatelessWidget {
  const HalamanList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Buku'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: DataBuku.length,
        itemBuilder: (context, index){
          final DataBuku buku = listBuku[index];
          return InkWell(
            onTap: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => HalamanDetail(buku: buku,),),
              );
            },
            child: Card(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.network(
                      buku.imageLink,
                      width: 100,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(buku.title,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          buku.author,
                          style: TextStyle(
                              fontSize: 10,
                              fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}