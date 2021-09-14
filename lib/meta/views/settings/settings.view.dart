import 'package:afrocom/core/notifier/setting.notifier.dart';
import 'package:afrocom/meta/views/sub_categories/mood/mood.exports.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    SettingNotifier settingNotifier(bool renderUI) =>
        Provider.of<SettingNotifier>(context, listen: renderUI);

    optionTile({required String title, required dynamic onTap}) {
      return ListTile(
        title: Text(title,
            style: KConstantTextStyles.MediumColoredText(
                fontSize: 14, textColor: KConstantColors.textColor)),
        trailing: IconButton(
          onPressed: onTap,
          icon: Icon(FontAwesomeIcons.edit,
              size: 16, color: KConstantColors.bgColor),
        ),
      );
    }

    coloredOptionTile(
        {required Color textColor,
        required String title,
        required dynamic onTap}) {
      return ListTile(
        onTap: onTap,
        title: Text(title,
            style: KConstantTextStyles.MediumColoredText(
                fontSize: 14, textColor: textColor)),
      );
    }

    locationButtons(
        {required Color textColor,
        required String title,
        required dynamic onTap}) {
      return ListTile(
        onTap: onTap,
        trailing: Switch(
          value: false,
          onChanged: (val) {
            setState(() {
              val = !val;
            });
          },
        ),
        title: Text(title,
            style: KConstantTextStyles.MediumColoredText(
                fontSize: 14, textColor: textColor)),
      );
    }

    renderColors() {
      List<Color> colors = [
        Colors.redAccent,
        Colors.blueAccent,
        Colors.greenAccent,
        Colors.deepOrangeAccent,
        Colors.lightBlue,
        Colors.purpleAccent,
        Colors.pink,
        Colors.yellow
      ];
      return Container(
        width: 400,
        height: 80,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: colors.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  settingNotifier(false)
                      .setColorTheme(candidateColor: colors[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: colors[index],
                      ),
                      vSizedBox1,
                      if (settingNotifier(true).currentColorTheme ==
                          colors[index])
                        Container(
                          width: 20,
                          height: 5,
                          color: settingNotifier(true).currentColorTheme,
                        )
                    ],
                  ),
                ),
              );
            }),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings",
            style: KConstantTextStyles.MediumText(fontSize: 16)),
      ),
      body: Container(
        child: ListView(
          children: [
            vSizedBox2,
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text("Account settings",
                  style: KConstantTextStyles.BoldText(fontSize: 16)),
            ),
            optionTile(onTap: () {}, title: "First name"),
            optionTile(onTap: () {}, title: "last name"),
            optionTile(onTap: () {}, title: "User name"),
            optionTile(onTap: () {}, title: "Birth date"),
            optionTile(onTap: () {}, title: "Female"),
            optionTile(onTap: () {}, title: "English"),
            optionTile(onTap: () {}, title: "Email address"),
            optionTile(onTap: () {}, title: "Password"),
            coloredOptionTile(
                textColor: Colors.blueAccent,
                title: "Suspend account",
                onTap: () {}),
            coloredOptionTile(
                textColor: Colors.red, title: "Delete account", onTap: () {}),
            vSizedBox2,
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text("Location Share",
                  style: KConstantTextStyles.BoldText(fontSize: 16)),
            ),
            locationButtons(
                onTap: () {},
                textColor: KConstantColors.textColor,
                title: "Live location"),
            locationButtons(
                onTap: () {},
                textColor: KConstantColors.textColor,
                title: "Current location"),
            vSizedBox2,
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text("Theme or appearance",
                  style: KConstantTextStyles.BoldText(fontSize: 16)),
            ),
            vSizedBox1,
            Center(
              child: Text("Choose a color for main icons",
                  style: KConstantTextStyles.MediumColoredText(
                      textColor: KConstantColors.textColor, fontSize: 14)),
            ),
            vSizedBox2,
            renderColors(),
            vSizedBox2,
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text("Privacy",
                  style: KConstantTextStyles.BoldText(fontSize: 16)),
            ),
            locationButtons(
                onTap: () {},
                textColor: KConstantColors.textColor,
                title: "Public profile"),
            locationButtons(
                onTap: () {},
                textColor: KConstantColors.textColor,
                title: "Private profile"),
            vSizedBox2,
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text("Privacy",
                  style: KConstantTextStyles.BoldText(fontSize: 16)),
            ),
            locationButtons(
                onTap: () {},
                textColor: KConstantColors.textColor,
                title: "Facebook"),
            locationButtons(
                onTap: () {},
                textColor: KConstantColors.textColor,
                title: "Twitter"),
            locationButtons(
                onTap: () {},
                textColor: KConstantColors.textColor,
                title: "Github"),
            locationButtons(
                onTap: () {},
                textColor: KConstantColors.textColor,
                title: "Instagram"),
            locationButtons(
                onTap: () {},
                textColor: KConstantColors.textColor,
                title: "LinkedIN"),
          ],
        ),
      ),
    );
  }
}
