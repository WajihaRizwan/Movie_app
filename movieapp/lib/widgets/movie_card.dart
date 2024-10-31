import 'package:flutter/material.dart';
import 'package:movieapp/models/moviemodel.dart';
import 'package:movieapp/util/utils.dart';
import 'package:movieapp/widgets/movie_detail.dart';

class MovieCardWidget extends StatelessWidget {
  final Future<MovieModel> future;
  final String headLineText;
  const MovieCardWidget(
      {super.key, required this.future, required this.headLineText});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        var data = snapshot.data?.results;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                headLineText,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                       Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MovieDetail()),
          );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.network("$imgURL${data[index].posterPath}"),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
