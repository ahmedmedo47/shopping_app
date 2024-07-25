import 'package:flutter/material.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .26,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child:
                    const Image(image: AssetImage("assets/images/test.webp"))),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: const Text(
                      "AhmedYasser Mansour Nasr Ah Waheed Omar Mohamed",
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: "GTSectraFine",
                          fontWeight: FontWeight.w600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      "Desc sss aaa qqqddddddd wwww ff aaaccc zzz xxxx dddd dsds sss fff sss",
                      style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 2),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "2220  \$",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w800),
                      ),
                      Spacer(
                        flex: 8,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Text(
                        "4.8",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Spacer(
                        flex: 5,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
