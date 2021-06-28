import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:newsapp/controllers/newsController.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/instance_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var count = 0.obs;
    final NewsController _newsController = Get.put(NewsController());
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              color: Colors.black,
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(25)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          margin: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Bright News",
                                style: TextStyle(
                                    color: Colors.teal[50],
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w800),
                              ),
                              Icon(Icons.search)
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0, vertical: 4.0),
                                      child: Text(
                                        "Breaking News",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   height: 5.0,
                                // ),
                                Column(
                                  children: [
                                    Container(
                                      height: 240.0,
                                      child: GetX<NewsController>(
                                        init: NewsController(),
                                        builder: (_newsController) {
                                          if (!_newsController
                                              .isLoading.value) {
                                            // count.value = 0;
                                            return ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: _newsController
                                                    .articleList
                                                    .value
                                                    .totalResults,
                                                itemBuilder: (context, index) {
                                                  if (index < 5) {
                                                    return Expanded(
                                                      child: GestureDetector(
                                                        // onTap: () async {
                                                        //   var url = _newsController
                                                        //       .articleList
                                                        //       .value
                                                        //       .articles[index]
                                                        //       .url;
                                                        //   if (await canLaunch(url)) {
                                                        //     await launch(
                                                        //       url,
                                                        //       forceSafariVC: false,
                                                        //       forceWebView: false,
                                                        //       headers: <String, String>{
                                                        //         'my_header_key':
                                                        //             'my_header_value'
                                                        //       },
                                                        //     );
                                                        //   } else {
                                                        //     throw 'Could not launch $url';
                                                        //   }
                                                        // },

                                                        onTap: () async {
                                                          var url =
                                                              _newsController
                                                                  .articleList
                                                                  .value
                                                                  .articles[
                                                                      index]
                                                                  .url;
                                                          if (await canLaunch(
                                                              url)) {
                                                            await launch(url,
                                                                forceSafariVC:
                                                                    true,
                                                                forceWebView:
                                                                    true);
                                                          } else {
                                                            throw 'Could not launch $url';
                                                          }
                                                        },
                                                        child: Container(
                                                          //height: 500.0,
                                                          width: 300.0,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Column(
                                                              children: <
                                                                  Widget>[
                                                                Card(
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25.0),
                                                                  ),
                                                                  elevation: 5,
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5.0),
                                                                  child:
                                                                      AspectRatio(
                                                                          aspectRatio: 16.0 /
                                                                              9.0,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.black,
                                                                              borderRadius: BorderRadius.circular(16),
                                                                            ),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(16),
                                                                              child: Image.network(
                                                                                (_newsController.articleList.value.articles[index].urlToImage) != null ? _newsController.articleList.value.articles[index].urlToImage : 'https://region4.uaw.org/sites/default/files/bio/10546i3dac5a5993c8bc8c_6.jpg',
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          )),
                                                                ),
                                                                Flexible(
                                                                  child: Column(
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(left: 5.0),
                                                                        child:
                                                                            Text(
                                                                          '${_newsController.articleList.value.articles[index].title.toString()}',
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 15.0),
                                                                          maxLines:
                                                                              3,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                });
                                          } else {
                                            return shimmer();
                                          }
                                        },
                                      ),
                                    ),
                                    Container(
                                      height: 355.0,
                                      child: GetX<NewsController>(
                                          init: NewsController(),
                                          builder: (_newsController) {
                                            if (!_newsController
                                                .isLoading.value) {
                                              // count.value = 0;
                                              return ListView.builder(
                                                  // shrinkWrap: true,

                                                  itemCount: _newsController
                                                      .totalItems.value,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return GestureDetector(
                                                      onTap: () async {
                                                        var url =
                                                            _newsController
                                                                .articleList
                                                                .value
                                                                .articles[index]
                                                                .url;
                                                        if (await canLaunch(
                                                            url)) {
                                                          await launch(url,
                                                              forceSafariVC:
                                                                  true,
                                                              forceWebView:
                                                                  true);
                                                        } else {
                                                          throw 'Could not launch $url';
                                                        }
                                                      },
                                                      child: Container(
                                                          height: 100.0,
                                                          // if (index > 4) {
                                                          child: Row(
                                                            children: <Widget>[
                                                              Card(
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              24),
                                                                ),
                                                                child:
                                                                    AspectRatio(
                                                                        aspectRatio:
                                                                            1,
                                                                        child: Image
                                                                            .network(
                                                                          (_newsController.articleList.value.articles[index].urlToImage) != null
                                                                              ? _newsController.articleList.value.articles[index].urlToImage
                                                                              : 'https://region4.uaw.org/sites/default/files/bio/10546i3dac5a5993c8bc8c_6.jpg',
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        )),
                                                              ),
                                                              SizedBox(
                                                                  width: 16),
                                                              Flexible(
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: <
                                                                      Widget>[
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Text(
                                                                        _newsController
                                                                            .articleList
                                                                            .value
                                                                            .articles[index]
                                                                            .title,
                                                                        maxLines:
                                                                            3,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              15.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          )),
                                                    );
                                                  });
                                            } else {
                                              return Container(
                                                height: 0.0,
                                                width: 0.0,
                                              );
                                            }
                                          }),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class shimmer extends StatefulWidget {
  shimmer({Key key}) : super(key: key);

  @override
  _shimmerState createState() => _shimmerState();
}

class _shimmerState extends State<shimmer> {
  @override
  Widget build(BuildContext context) {
    bool _enabled = true;
    return Shimmer.fromColors(
        enabled: _enabled,
        child: Column(
          children: <Widget>[
            Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                elevation: 5,
                margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                child: AspectRatio(
                  aspectRatio: 16.0 / 9.0,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: Column(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
                      height: 12.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
                      height: 12.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
                      height: 12.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.black,
                      ),
                    ),
                  ],
                )),
            
          ],
        ),
        baseColor: Colors.grey[600],
        highlightColor: Colors.grey[500]);
  }
}
