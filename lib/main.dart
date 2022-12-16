import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';
import 'package:test_app/screens/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Home());
  }
}

class Home extends StatelessWidget {
  final StoryController controller = StoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delicious Ghanaian Meals"),
      ),
     
      body:
       Container(
        margin: EdgeInsets.all(
          8,
        ),
       child: ListView(
          children: <Widget>[
            Container(
              height: 300,
              child: StoryView(
                controller: controller,

                storyItems: [
                  StoryItem.text(
                    title:
                        "Hello world!\nHave a look at some great Ghanaian delicacies. I'm sorry if your mouth waters. \n\nTap!",
                    backgroundColor: Colors.orange,
                    roundedTop: true,
                  ),
                   StoryItem.inlineImage(
                    url: 
                        "https://image.ibb.co/gCZFbx/Banku-and-tilapia.jpg",
                         controller: controller,
                    caption: Text(
                       "Banku & Tilapia. The food to keep you charged whole day.\n#1 Local food.",
                       style: TextStyle(
                         color: Colors.white,
                         backgroundColor: Colors.black54,
                        fontSize: 17,
                       ),
                    ),
                  ),
                  StoryItem.inlineImage(
                    url:
                        "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
                    controller: controller,
                    caption: Text(
                      "Omotuo & Nkatekwan; You will love this meal if taken as supper.",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  StoryItem.inlineImage(
                    url:
                        "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
                    controller: controller,
                    caption: Text(
                      "Hektas, sektas and skatad",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  )
                ],
                onStoryShow: (s) {
                  print("Showing a story");
                },
                onComplete: () {
                  print("Completed a cycle");
                },
                progressPosition: ProgressPosition.bottom,
                repeat: false,
                inline: true,
                onVerticalSwipeComplete: (direction) {
                  if(direction==Direction.up){
                    PlaybackState.pause;
                  }
                },
              ),
            ),
            Material(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MoreStories()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(8))),
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "View more stories",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      
      ),
    
    );
  }
}

class MoreStories extends StatefulWidget {
  @override
  _MoreStoriesState createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<MoreStories>with TickerProviderStateMixin {
  final storyController = StoryController();
 late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
   
   _animationController =
         AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("More"),
      ),
      body: StoryView(
         onVerticalSwipeComplete: (direction) {
                  if(direction==Direction.up){
                    _animationController.stop();
                        PlaybackState.pause;
                        print('swipe up');   
                    
                  }
                },
        /* onVerticalSwipeComplete: (direction){
                 if(direction==Direction.up){
                   Get.bottomSheet( 
                  Container(
                    height: 150,
                    color: Colors.greenAccent,
                    child:Column(
                      children: [
                        Text('Hii 1', textScaleFactor: 2),
                        Text('Hii 2',  textScaleFactor: 2),
                        Text('Hii 3',  textScaleFactor: 2),
                        Text('Hii 4',  textScaleFactor: 2),
                      ],
                    )
                  ),
                  barrierColor: Colors.red[50],
                  isDismissible: false,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                    side: BorderSide(
                      width: 5,
                      color: Colors.black
                    )
                  ),
                  enableDrag: false,
 
                );
                 }
                },*/
        storyItems: [
          StoryItem.text(
            title: "I guess you'd love to see more of our food. That's great.",
            backgroundColor: Colors.blue,
          ),
          StoryItem.text(
            title: "Nice!\n\nTap to continue.",
            backgroundColor: Colors.red,
            textStyle: TextStyle(
              fontFamily: 'Dancing',
              fontSize: 40,
            ),
          ),
          StoryItem.pageImage(
            url:
                "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
            caption: "Still sampling",
            controller: storyController,
          ),
          StoryItem.pageImage(
              url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
              caption: "Working with gifs",
              controller: storyController),
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            caption: "Hello, from the other side",
            controller: storyController,
          ),
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            caption: "Hello, from the other side2",
            controller: storyController,
          ),
        ],
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          print("Completed a cycle");
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: storyController,
      ),
    );
  }
}


/*import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:story_designer/story_designer.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text('Story Designer Example'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () async {

                final picker = ImagePicker();
                await picker.getImage(source: ImageSource.gallery).then((file) async {

                  File editedFile = await Navigator.of(context).push(
                      new MaterialPageRoute(builder: (context)=> StoryDesigner(
                        filePath: file.path,
                      ))
                  );

                  // ------- you have editedFile

                  if(editedFile!=null) {
                    print('editedFile: ' + editedFile.path);



                  }

                });

              },
              child: Text('Pick Image'),
            ),
          ],
        ),
      ),
    );
  }
}*/
