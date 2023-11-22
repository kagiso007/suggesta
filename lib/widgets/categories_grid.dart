import 'package:suggesta/data/data.dart';
import 'package:flutter/material.dart';
import 'package:suggesta/pages/list_page.dart';
//import 'package:suggesta/pages/category_page.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: category.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 15 / 7, crossAxisCount: 1, mainAxisSpacing: 20),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(category[index].backImage),
                  fit: BoxFit.fill),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            //Navigator.push(
                              //context,
                              //MaterialPageRoute(
                                  //builder: (context) => category_page()),
                            //);
                          },
                          child: Text(
                            category[index].text,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const list_page()),
                            );
                          },
                          child: Text(
                            category[index].topic,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25),
                          ),
                        ),
                        Text(
                          "${category[index].numOfEngagements} engagements",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
