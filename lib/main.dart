
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List background_images = [
    {
      "title": "Background-2",
      "image": "https://milkiyat.bangalore2.com/media/images/bg_banner-02.jpg",
      "id": 2
    },
    {
      "title": "Background-1",
      "image": "https://milkiyat.bangalore2.com/media/images/bg_banner-04.jpg",
      "id": 1
    },
    {
      "title": "Background-1",
      "image": "https://milkiyat.bangalore2.com/media/images/bg_banner-03.jpg",
      "id": 3
    }
  ];

  List items = [
    {
      "title": "MS Apartments..",
      "image":
          "https://milkiyat.bangalore2.com/media/slides/app_bannera-08.jpg",
      "link": "/api/search/?q=MS Apartments"
    },
    {
      "title": ".Kashmir's Real Estate Solution,",
      "image":
          "https://milkiyat.bangalore2.com/media/slides/MSR26-2_G8h2046.jpg",
      "link": "//"
    },
    {
      "title": "Low Commission",
      "image": "https://milkiyat.bangalore2.com/media/slides/MSR26_AwMnVcR.jpg",
      "link": "/api/out_kashmir/"
    },
    {
      "title": "Request Visit..",
      "image":
          "https://milkiyat.bangalore2.com/media/slides/app_bannera-06_wQ7PWKO.jpg",
      "link": "/"
    },
    {
      "title": "Transparency & Trust.",
      "image":
          "https://milkiyat.bangalore2.com/media/slides/MSR26-3_95P0FqI.jpg",
      "link": "./"
    }
  ];

  int _current = 0;

  final colors = const [
    Colors.red,
    Colors.green,
    Colors.greenAccent,
    Colors.amberAccent,
    Colors.blue,
    Colors.amber,
  ];

  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context) {

    final pages = List.generate(
        items.length,
            (index) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.shade300,
          ),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Container(
            height: 280,
            child: Center(
                child: Image(width: MediaQuery.of(context).size.width,image: NetworkImage(items[index]['image']),fit: BoxFit.fill,)),
          ),
        ));


    return Scaffold(backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 280,color: Colors.black,
              child: Stack(
                children: <Widget>[
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 300,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      aspectRatio: 2.0,
                      initialPage: 1,
                      autoPlayInterval: Duration(seconds: 2),
                      autoPlayAnimationDuration:
                      Duration(milliseconds: 100),),
                    items: background_images.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image(width: MediaQuery.of(context).size.width,image: NetworkImage(i['image']),fit: BoxFit.fill,);
                        },
                      );
                    }).toList(),
                  ),
                  Positioned(
                    top: 30.0,
                    left: 0.0,
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        print("your menu action here");

                      },
                    ),
                  ),
                  Positioned(
                    top: 40.0,
                    left: 260.0,
                    right: 10,
                    child: Row(
                      children: const [
                        Icon(Icons.add_location_sharp,color: Colors.white,),
                        Text("1st Main Road",style: TextStyle(color: Colors.white,fontWeight:  FontWeight.bold),),
                        Icon(Icons.arrow_drop_down_outlined,color: Colors.white,)
                      ],
                    )
                  ),
                  Positioned(
                    top: 80.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90.0),
                            color: Colors.white),
                        child: Row(
                          children:  [
                            const Expanded(flex: 3,
                              child: TextField(
                                decoration: InputDecoration(contentPadding: EdgeInsets.only(left: 20.0,),
                                  hintText: "Locality ,Commercial, Flat",hintStyle: TextStyle(color: Colors.black26),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25),bottomLeft: Radius.circular(25) ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(child: Container(decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomRight: Radius.circular(25) ),
                                color: Colors.orange),height: 50,child: Center(child: const Text("Search",style: TextStyle(color: Colors.white),))))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 180.0,
                    left: 0.0,
                    right: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60,right: 60),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(90.0),
                                    color: Colors.orange),
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Find Property",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ))),
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(90.0),
                                    color: Colors.orange),
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Post a Property",
                                          style: TextStyle(color: Colors.white)),
                                    ))),
                          ],
                      ),
                    )
                  ),

                ],
              ),
            ),
            const SizedBox(height: 40,),
            Column(children: [
              CarouselSlider(
                options: CarouselOptions(

                  reverse: false,
                  autoPlay: false,
                  onPageChanged: (index, ih) {
                    setState(() {
                      _current = index;
                      print("${_current}");
                    });
                  },
                ),
                items: items.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                          i['image'],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: items.map(
                  (image) {
                    int index = items.indexOf(image);
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color:_current == index ? Colors.grey : Colors.white)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            width: 6.0,
                            height: 6.0,
                            margin: const EdgeInsets.symmetric(vertical: 0.50, horizontal: 0.50),
                            decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                color:  Colors.orange),
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(), // this was the part the I had to add
              ),
            ]),

        SafeArea(
        child: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 16),
          SizedBox(
            height: 240,
            child: PageView.builder(
              controller: controller,
              // itemCount: pages.length,
              itemBuilder: (_, index) {
                return pages[index % pages.length];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 12),
            child: Text(
              'Worm',
              style: TextStyle(color: Colors.black54),
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: pages.length,
            effect: CustomizableEffect(
             dotDecoration:  DotDecoration(
                width: 24,
                height: 12,
                color: Colors.grey,
                // dotBorder: DotBorder(
                //   padding: 2,
                //   width: 2,
                //   color: Colors.grey,
                // ),
                // borderRadius: BorderRadius.only(
                //     topLeft: Radius.circular(2),
                //     topRight: Radius.circular(16),
                //     bottomLeft: Radius.circular(16),
                //     bottomRight: Radius.circular(2)),
                borderRadius: BorderRadius.circular(16),
                verticalOffset: 0,
              ), activeDotDecoration: DotDecoration(
              width: 32,
              height: 12,
              color: Colors.indigo,
              rotationAngle: 180,
              verticalOffset: -10,
              borderRadius: BorderRadius.circular(24),
              // dotBorder: DotBorder(
              //   padding: 2,
              //   width: 2,
              //   color: Colors.indigo,
              // ),
            ),

              // strokeWidth: 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              'Jumping Dot',
              style: TextStyle(color: Colors.black54),
            ),
          ),
          Container(
            child: SmoothPageIndicator(
              controller: controller,
              count: pages.length,
              effect: JumpingDotEffect(
                dotHeight: 16,
                dotWidth: 16,
                jumpScale: .7,
                verticalOffset: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              'Swap',
              style: TextStyle(color: Colors.black54),
            ),
          ),
          Container(
            child: SmoothPageIndicator(
              controller: controller,
              count: pages.length,
              effect: SwapEffect(
                dotHeight: 16,
                dotWidth: 16,
                type: SwapType.yRotation,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 12),
            child: Text(
              'Scrolling Dots',
              style: TextStyle(color: Colors.black54),
            ),
          ),
          SmoothPageIndicator(
              controller: controller,
              count: pages.length,
              effect: ScrollingDotsEffect(
                activeStrokeWidth: 2.6,
                activeDotScale: 1.3,
                maxVisibleDots: 5,
                radius: 8,
                spacing: 10,
                dotHeight: 12,
                dotWidth: 12,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Text(
              'Customizable Effect',
              style: TextStyle(color: Colors.black54),
            ),
          ),
          Container(
            // color: Colors.red.withOpacity(.4),
            child: SmoothPageIndicator(
              controller: controller,
              count: pages.length,
              effect: CustomizableEffect(
                activeDotDecoration: DotDecoration(
                  width: 32,
                  height: 12,
                  color: Colors.indigo,
                  rotationAngle: 180,
                  verticalOffset: -10,
                  borderRadius: BorderRadius.circular(24),
                  // dotBorder: DotBorder(
                  //   padding: 2,
                  //   width: 2,
                  //   color: Colors.indigo,
                  // ),
                ),
                dotDecoration: DotDecoration(
                  width: 24,
                  height: 12,
                  color: Colors.grey,
                  // dotBorder: DotBorder(
                  //   padding: 2,
                  //   width: 2,
                  //   color: Colors.grey,
                  // ),
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(2),
                  //     topRight: Radius.circular(16),
                  //     bottomLeft: Radius.circular(16),
                  //     bottomRight: Radius.circular(2)),
                  borderRadius: BorderRadius.circular(16),
                  verticalOffset: 0,
                ),
                spacing: 6.0,
                 activeColorOverride: (i) => colors[i],
                inActiveColorOverride: (i) => colors[i],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
 // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



