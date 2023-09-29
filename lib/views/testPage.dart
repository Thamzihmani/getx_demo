import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class RandD extends StatefulWidget {
  const RandD({Key? key}) : super(key: key);

  @override
  State<RandD> createState() => _RandDState();
}

class _RandDState extends State<RandD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(
              child: Text(
            "Title",
            style: TextStyle(color: Colors.white),
          )),
        ),
        body: Stack(children: [
          NestedScrollView(
            key: Key("A"),
            physics: NeverScrollableScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                toolbarHeight: MediaQuery.sizeOf(context).height / 1.5,
                /*leading: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 20.sp, top: 10.sp),
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: CircleAvatar(
                      backgroundColor: Colors.black38,
                      child: Icon(
                        Icons.arrow_back,
                        size: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),*/
                flexibleSpace: FlexibleSpaceBar(
                    background: SizedBox(
                  child: myCacheImage(
                      context: context,
                      imageURL:
                          "https://images.pexels.com/photos/339567/pexels-photo-339567.jpeg?cs=srgb&dl=pexels-zukiman-mohamad-339567.jpg&fm=jpg",
                      // "https://paytmblogcdn.paytm.com/wp-content/uploads/2023/03/Paytm-Wallet.jpeg",
                      width: double.maxFinite,
                      height: MediaQuery.sizeOf(context).height / 1.5,
                      shape: BoxShape.rectangle,
                      boxColor: Colors.grey[200]!,
                      fit: BoxFit.fill),
                )),
              )
            ],
            body: Container(),
          ),
          SafeArea(
            child: Container(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowIndicator();
                  return true;
                },
                child: NestedScrollView(
                    key: Key("B"),
                    physics: ClampingScrollPhysics(),
                    headerSliverBuilder: (context, innerBoxIsScrolled) => [
                          SliverAppBar(
                            expandedHeight:
                                MediaQuery.sizeOf(context).height / 2,
                            automaticallyImplyLeading: false,
                            backgroundColor: Colors.transparent,
                          ),
                        ],
                    body: Container(
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: CustomScrollView(
                        key: const Key("C"),
                        shrinkWrap: true,
                        slivers: [
                          SliverAppBar(
                            flexibleSpace: FlexibleSpaceBar(
                              background: Container(
                                height: 100,
                                color: Colors.red,
                                width: double.maxFinite,
                              ),
                            ),
                          ),
                          ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text("Item $index"),
                              );
                            },
                            itemCount: 10,
                          )
                        ],
                      ),
                    )),
              ),
            ),
          )
        ]));
  }

  Widget _body() {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: const Column(
        children: [
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

Widget carouselBody() {
  return SizedBox(
    height: 140,
    width: double.infinity,
    child: CarouselSlider(
      items: banner
          .map((item) => InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 12, right: 12),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: banner[0],
                    width: double.infinity,
                    placeholder: (context, url) => const Center(
                      child: SizedBox(
                        width: 120,
                        height: 120,
                      ),
                    ),
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover)),
                      );
                    },
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ))
          .toList(),
      options: CarouselOptions(
        autoPlay: banner.length > 1,
        enableInfiniteScroll: banner.length > 1,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {},
        viewportFraction: 1.0,
        aspectRatio: 1.0,
      ),
    ),
  );
}

List<String> banner = [
  "https://images.pexels.com/photos/339567/pexels-photo-339567.jpeg?cs=srgb&dl=pexels-zukiman-mohamad-339567.jpg&fm=jpg",
  "https://paytmblogcdn.paytm.com/wp-content/uploads/2023/03/Paytm-Wallet.jpeg",
];

Widget myCacheImage({
  required BuildContext context,
  required String imageURL,
  double? width,
  double? height,
  BoxShape? shape,
  Color? boxColor,
  BoxFit? fit,
}) {
  return CachedNetworkImage(
      imageUrl: imageURL,
      imageBuilder: (context, imageProvider) {
        return Container(
          width: width ?? 0,
          height: height ?? 0,
          decoration: BoxDecoration(
              shape: shape ?? BoxShape.rectangle,
              color: boxColor ?? Colors.grey[200],
              image: DecorationImage(
                  image: imageProvider, fit: fit ?? BoxFit.fill)),
        );
      },
      placeholder: (context, url) => SizedBox(
          width: width,
          height: width,
          child: const CircularProgressIndicator()),
      errorWidget: (context, url, error) => SizedBox(
          width: width ?? 0,
          height: height ?? 0,
          child:
              const Image(image: AssetImage("assets/icons/ic_img_error.png"))));
}
