import 'package:afrocom/app/constants/images.tag.dart';
import 'package:afrocom/meta/views/authentication/login/login.exports.dart';
import 'package:afrocom/meta/widgets/custom_button.dart';

class AddPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postController = TextEditingController();
    return Scaffold(
      backgroundColor: KConstantColors.bgColor,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: TextField(
                    controller: postController,
                    decoration: new InputDecoration(
                        filled: true,
                        hintText: "Write something...",
                        hintStyle: new TextStyle(
                            color: KConstantColors.textColor, fontSize: 16.0),
                        fillColor: KConstantColors.darkColor,
                        border: new OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(const Radius.circular(10.0)))),
                    style: KConstantTextStyles.MBody1(fontSize: 18),
                    minLines: 5,
                    maxLines: 10,
                  ),
                ),
              ),
              vSizedBox3,
              Container(
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      iconData: Icons.camera,
                      height: 50,
                      width: 180,
                      tag: "Camera",
                      onPressed: () {},
                    ),
                    CustomButton(
                      iconData: Icons.camera,
                      height: 50,
                      width: 180,
                      tag: "Gallery",
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              vSizedBox1,
              CustomButton(
                iconData: Icons.document_scanner,
                height: 50,
                width: 380,
                tag: "Attach a document",
                onPressed: () {},
              ),
              vSizedBox3,
              Container(
                width: 400,
                child: Column(
                  children: [
                    vSizedBox1,
                    Text(
                      "What's your mood?",
                      style: KConstantTextStyles.MBody1(fontSize: 16),
                    ),
                    vSizedBox1,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(ImageTags.HappyFace),
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(ImageTags.AngryFace),
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(ImageTags.ArrogantFace),
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(ImageTags.ShockFace),
                        )
                      ],
                    ),
                    vSizedBox1
                  ],
                ),
                decoration: BoxDecoration(
                    color: KConstantColors.darkColor,
                    borderRadius: BorderRadius.circular(5)),
              ),
              vSizedBox4,
              GestureDetector(
                // onTap: () => AppwriteAPI.createInstance
                //     .addData(data: postController.text),
                child: Container(
                  height: 50,
                  width: 200,
                  child: Center(
                      child: Text(
                    "Post",
                    style: KConstantTextStyles.BHeading1(fontSize: 20),
                  )),
                  decoration: BoxDecoration(
                      color: KConstantColors.greenColor,
                      borderRadius: BorderRadius.circular(5)),
                ),
              )
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: KConstantColors.bgColorFaint,
      //   child: Icon(
      //     Icons.add,
      //     color: KConstantColors.whiteColor,
      //   ),
      // ),
    );
  }
}
