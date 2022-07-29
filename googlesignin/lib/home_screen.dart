import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyAp());
// }

class MyAp extends StatelessWidget {
  const MyAp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListViewHomePage(),
    );
  }
}

class ListViewHomePage extends StatefulWidget {
  const ListViewHomePage({Key? key}) : super(key: key);

  @override
  _ListViewHomePageState createState() => _ListViewHomePageState();
}

var titleList = [
  "Gift Shop",
  "Book Shop",
  "Super Market",
  "Computer Shop",
  "Cool Drink Shop"
];

var locationList = [
  "Location : Colombo",
  "Location : Matara",
  "Location : Avissawella",
  "Location : Galle",
  "Location : Dehiowita"
];

var imgList = [
  "assets/giftshop.jpg",
  "assets/bookshop.jpg",
  "assets/supermarket.jpg",
  "assets/computershop.jpg",
  "assets/cooldrink.jpg"
];

var tapToViewList = [
  "Tap to view Products",
  "Tap to view Products",
  "Tap to view Products",
  "Tap to view Products",
  "Tap to view Products"
];

var openHourList = [
      "Between 2-4 days island wide delivery",
      "Between 2-4 days island wide delivery",
      "Between 2-4 days island wide delivery",
      "Between 2-4 days island wide delivery",
      "Between 2-4 days island wide delivery"
];

class _ListViewHomePageState extends State<ListViewHomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        title: const Text("List View",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
          itemCount: imgList.length,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: () {
                print(titleList[index]);
              },
              child: Card(
              // clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: (){},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      // Container(
                      //   width: 200,
                      //   height: 100,
                      //   child: Image.asset(imgList[index]),
                      // ),
                      Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Ink.image(
                                image: AssetImage(imgList[index]),
                                height: 220,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),


                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  <Widget>[
                            Text(
                              titleList[index],
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Container(
                              width: width,
                              child: Text(
                                locationList[index],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.red[500],
                                ),
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Container(
                              width: width,
                              child: Text(
                                tapToViewList[index],
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Container(
                              width: width,
                              child: Text(
                                openHourList[index],
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
              ),
            ),
            );
          }
      ),
    );
  }
}














