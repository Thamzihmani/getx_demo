import 'package:flutter/material.dart';
import 'package:getx_demo/views/testPage.dart';

class Test1 extends StatefulWidget {
  const Test1({Key? key}) : super(key: key);

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
                        expandedHeight: MediaQuery.sizeOf(context).height / 2,
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.transparent,
                      ),
                      SliverAppBar(
                        expandedHeight:
                            MediaQuery.sizeOf(context).height * 0.25,
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.transparent,
                        flexibleSpace: FlexibleSpaceBar(
                            background: Container(
                                padding: EdgeInsets.only(top: 10),
                                width: double.maxFinite,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                                child: carouselBody())),
                      ),
                    ],
                body: DefaultTabController(
                  length: 3,
                  child: Container(
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      children: [
                        const TabBar(tabs: [
                          Tab(
                            text: "Category 1",
                          ),
                          Tab(
                            text: "Category 2",
                          ),
                          Tab(
                            text: "Category 3",
                          ),
                        ]),
                        Expanded(
                          child: TabBarView(children: [
                            Row(children: [
                              Expanded(
                                child: ListView.builder(
                                  physics: ClampingScrollPhysics(),
                                  padding: EdgeInsets.only(bottom: 150),
                                  itemCount: 20,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            constraints: const BoxConstraints(
                                              minWidth: 0, // minimum width
                                              maxWidth: 100,
                                              //maximum width set to 100% of width
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 5,
                                                  top: 10,
                                                  bottom: 10),
                                              child: Text(
                                                "item $index",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ),
                                          //Todo selectable category list
                                          Expanded(
                                            flex: 1,
                                            child: Divider(
                                              key: Key("$index"),
                                              color: Colors.green,
                                              thickness: 2,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  physics: ClampingScrollPhysics(),
                                  padding: EdgeInsets.only(bottom: 150),
                                  itemCount: 20,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: 60,
                                      color: Colors.brown,
                                      margin: EdgeInsets.all(5),
                                    );
                                  },
                                ),
                              ),
                            ]),
                            Container(),
                            Container(),
                          ]),
                        )
                      ],
                    ),
                  ),
                )),
          ),
        ),
      )
    ]));
  }
}

/*
CustomScrollView(
slivers: [
SliverAppBar(
toolbarHeight: size.height / 2,
flexibleSpace: FlexibleSpaceBar(
background: CachedNetworkImage(
imageUrl:
"https://images.pexels.com/photos/339567/pexels-photo-339567.jpeg?cs=srgb&dl=pexels-zukiman-mohamad-339567.jpg&fm=jpg",
imageBuilder: (context, imageProvider) {
return Container(
width: size.width,
height: size.height / 2,
decoration: BoxDecoration(
image: DecorationImage(
image: imageProvider, fit: BoxFit.fill)),
);
},
placeholder: (context, url) => const SizedBox(
width: 100,
height: 100,
child: CircularProgressIndicator()),
errorWidget: (context, url, error) =>
const Icon(Icons.error)),
),
),
SliverList.builder(
itemBuilder: (context, index) => Text("Item $index"),
itemCount: 50,
)
],
),*/
