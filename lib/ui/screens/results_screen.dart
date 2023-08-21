// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/ui/widgets/results_widget.dart';
import 'package:amazon_clone/ui/widgets/search_bar_widget.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ResultsScreeen extends StatelessWidget {
  final String query;
  const ResultsScreeen({
    Key? key,
    required this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = Utils().getScreenSize(MediaQuery.of(context));
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: false,
        hasBackButton: true,
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Showing result for ',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    TextSpan(
                      text: query,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // get query search from database
          Expanded(
            child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('products')
                  .where('productName', isEqualTo: query)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container();
                } else {
                  return GridView.builder(
                    itemCount: snapshot.data!.docs.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 2 / 3),
                    itemBuilder: (context, index) {
                      final dataJson = snapshot.data!.docs[index].data();
                      final ProductModel product =
                          ProductModel.fromJson(dataJson);
                      return SizedBox(
                        width: screenSize.width / 3,
                        child: FittedBox(
                          child: ResultsWidget(product: product),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
