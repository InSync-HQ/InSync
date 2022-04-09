import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About us",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Our Team",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          DevProfileTile(
            url: "https://avatars.githubusercontent.com/u/55529269?v=4",
            name: "Hayat Tamboli",
            designation: "UX Designer, Frontend Dev",
            icon: FeatherIcons.globe,
            socialLink: "https://hayattamboli.vercel.app/",
          ),
        ],
      ),
    );
  }
}

class DevProfileTile extends StatelessWidget {
  const DevProfileTile({
    Key? key,
    required this.url,
    required this.name,
    required this.designation,
    this.icon = FeatherIcons.linkedin,
    this.socialLink = "https://linkedin.com",
  }) : super(key: key);
  final String url;
  final String name;
  final String designation;
  final String socialLink;
  final IconData icon;

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Image(
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              );
            },
            image: NetworkImage(url),
          ),
        ),
        title: Text(name),
        subtitle: Text(designation),
        trailing: IconButton(
          onPressed: () {
            launchURL(socialLink);
          },
          icon: Icon(
            icon,
            color: Theme.of(context).listTileTheme.iconColor,
          ),
        ),
      ),
    );
  }
}
