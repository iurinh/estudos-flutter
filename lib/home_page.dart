import 'package:flutter/material.dart';
import 'package:hello_world/insert_page.dart';
// import 'package:hello_world/home_controller.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     var controller = HomeController.of(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//       ),
//       body: Center(
//         child: Text('Flutterando ${controller.value}')
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           controller.increment();
//         },
//         child: const Icon(
//           Icons.add,
//           color: Colors.indigo,
//           size: 50,
//         ),
//       ),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var counter = 0;
  var list = ['primeiro'];
  var controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [                
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/img/vinland.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Image.network(
                    "https://i.pinimg.com/originals/14/72/4c/14724ccc0996965ad593e55119bf913e.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  color: Colors.red,
                  height: 150,
                  width: 150,
                ),
                Container(
                  color: Colors.green,
                  height: 100,
                  width: 100,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withOpacity(0.20),
                ),
                Container(
                  color: Colors.black,
                  height: 50,
                  width: 50,
                ), 
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FlutterLogo(
                        size: 150,
                        textColor: Colors.white,
                        style: FlutterLogoStyle.horizontal,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const InsertPage()));
                        }, 
                        child: const Text('Entrar')
                      )
                    ],
                  ),
                )               
              ],
            ),
            Row(
              children: [
                Expanded(child: TextField(
                  controller: controller,
                )),
                IconButton(
                  onPressed: () {
                    setState(() => list.add(controller.text));
                    controller.clear();
                  },
                  icon: const Icon(Icons.add_circle_outline_sharp)
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final item = list[index];
                  return Row(
                    children: [
                      Expanded(child: Text(list[index])),
                      IconButton(onPressed: () => setState(() => list.remove(item) ), 
                        icon: const Icon(Icons.remove_circle_outline)
                      ),
                    ],
                  );
                },
              )),          
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Text('Flutterando $counter'),
                    SizedBox(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: 50,
                            height: 80,
                            color: Colors.grey,
                          ),
                          Container(
                            width: 50,
                            height: 100,
                            color: Colors.orange,
                          ),
                          for(var i=0; i<10; i++)
                            Container(
                              margin: const EdgeInsets.all(10),
                              width: 50,
                              height: 70,
                              color: Colors.cyan,
                            ),
                        ]
                      ),
                    ),
                    // ListView(
                    //   scrollDirection: Axis.horizontal,
                    //   children: [
                    //     Container(
                    //       width: 50,
                    //       height: 80,
                    //       color: Colors.grey,
                    //     ),
                    //     Container(
                    //       width: 50,
                    //       height: 100,
                    //       color: Colors.orange,
                    //     ),
                        // for(var i=0; i<10; i++)
                        //   Container(
                        //     margin: const EdgeInsets.all(10),
                        //     width: 50,
                        //     height: 70,
                        //     color: Colors.cyan,
                        //   ),
                    //   ],
                    // ),
                    // Expanded(
                    //   child: ListView.builder(
                    //     itemCount: list.length,
                    //     itemBuilder: (context, index) {
                    //       final item = list[index];
                          
                    //       return Row(
                    //         children: [
                    //           const Expanded(child: TextField()),
                    //           IconButton(
                    //             onPressed: () {
                    //               print('clicou');
                    //             },
                    //             icon: const Icon(Icons.add)
                    //           )
                    //         ],
                    //       );
                    //     },                    
                    //   ),
                    // ),
                    for(var i=0; i<10; i++)
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: 50,
                          height: 70,
                          color: Colors.black,
                        ),
                  ],
                ),
              ),
        // child: SingleChildScrollView(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text('Flutterando $counter'),
        //       ListView(
        //         children: [
        //           for(var i=0; i<10; i++)
        //               Container(
        //                 margin: const EdgeInsets.all(10),
        //                 width: 50,
        //                 height: 70,
        //                 color: Colors.black,
        //               ),
        //         ],
        //       ),
        //       SingleChildScrollView(
        //         scrollDirection: Axis.horizontal,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [                
        //             Container(
        //               width: 50,
        //               height: 80,
        //               color: Colors.grey,
        //             ),
        //             Container(
        //               width: 50,
        //               height: 100,
        //               color: Colors.orange,
        //             ),
        //             for(var i=0; i<10; i++)
        //               Container(
        //                 margin: const EdgeInsets.all(10),
        //                 width: 50,
        //                 height: 70,
        //                 color: Colors.cyan,
        //               ),
        //           ],
        //         ),
        //       ),              
        //       Container(
        //         width: 10,
        //         height: 50,
        //         color: Colors.green,
        //       ),
        //       Container(
        //         width: 80,
        //         height: 50,
        //         color: Colors.red,
        //       ),
        //       Container(
        //         width: 100,
        //         height: 50,
        //         color: Colors.indigoAccent,
        //       ),
        //       for(var i=0; i<10; i++)
        //         Container(
        //           margin: const EdgeInsets.all(10),
        //           width: 50,
        //           height: 70,
        //           color: Colors.pink,
        //         ),
        //     ]
        //   ),
        // )
        ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;            
          });
        },
        child: const Icon(
          Icons.add,
          color: Colors.indigo,
          size: 50,
        ),
      ),
    );
  }
}