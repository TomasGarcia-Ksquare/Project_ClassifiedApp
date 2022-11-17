import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:new_project/data/Ads_data.dart';
import 'package:new_project/models/ads.dart';
import 'package:new_project/services/ads.dart';

class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Ads'),
        ),
        body: Ads(),
      ),
    );
  }
}

class Ads extends StatelessWidget {
  final ads = AdsData();

  Ads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: FutureBuilder(
        future: AdsService().fetchAds(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<AdsModel> ads = snapshot.data!;
            return ListView.builder(
              itemCount: ads.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    /*Navigator.pushNamed(context, '/EditAdScreen',
                  arguments: ads.myAds()[index]);*/
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              margin: EdgeInsets.only(right: 12),
                              height: 80,
                              width: 80,
                              child: Image.network(
                                ads[index].images![0],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(ads[index].title!),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.timer_outlined,
                                    color: Colors.grey,
                                    size: 15,
                                  ),
                                  Text(
                                    ads[index].createdAt!,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                ads[index].price!.toString(),
                                style: TextStyle(
                                  color: Color(0xfff25723),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Erro'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
