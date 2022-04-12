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
          DevProfileTile(
            url:
                "https://media-exp1.licdn.com/dms/image/D5635AQFsyJKsEZa-6w/profile-framedphoto-shrink_400_400/0/1641966967283?e=1649761200&v=beta&t=AWnb9KZMUd1YT2Z2O3kts8I00TrXzsAsDNmAMuZ92mk",
            name: "Kurup Gokul",
            designation: "Backend Dev",
            icon: FeatherIcons.linkedin,
            socialLink: "https://www.linkedin.com/in/gokul-j-kurup-4538b4193/",
          ),
          DevProfileTile(
            url: "https://i.imgur.com/wyO5Hom.jpeg",
            name: "Alex Thomas",
            designation: "Documentation maintainer",
            icon: FeatherIcons.linkedin,
            socialLink: "https://www.linkedin.com/in/alex-thomas-6920651ba/",
          ),
          DevProfileTile(
            url:
                "https://media-exp1.licdn.com/dms/image/C5603AQE-8dctDAkl_w/profile-displayphoto-shrink_400_400/0/1639289869197?e=1655337600&v=beta&t=UgYigVVi-Upqdyi2uAdUIhsY5pXONFQYaO0m2D0aiho",
            name: "Keerthi Rajan",
            designation: "Frontend Dev",
            icon: FeatherIcons.linkedin,
            socialLink: "https://www.linkedin.com/in/keerthi-rajan-087672196/",
          ),
          DevProfileTile(
            name: "Abishek R",
            designation: "Backend Dev",
            icon: FeatherIcons.linkedin,
            socialLink: "https://www.linkedin.com/in/abishek-r-9aa0a41a0/",
          ),
          DevProfileTile(
            name: "Siddhi verma",
            designation: "Frontend Dev",
            icon: FeatherIcons.linkedin,
            socialLink: "https://www.linkedin.com/in/abishek-r-9aa0a41a0/",
          ),
          DevProfileTile(
            url:
                "https://media-exp1.licdn.com/dms/image/C5103AQEUIra6g5xD4Q/profile-displayphoto-shrink_400_400/0/1572323749353?e=1655337600&v=beta&t=13s4dnJYZDv_lRCwYF5bd73o7qq72OIpJOfKcTM3Q24",
            name: "SaratChandra Kumar",
            designation: "Backend Dev",
            icon: FeatherIcons.linkedin,
            socialLink:
                "https://www.linkedin.com/in/saratchandra-kumar-23a167196/",
          ),
        ],
      ),
    );
  }
}

class DevProfileTile extends StatelessWidget {
  const DevProfileTile({
    Key? key,
    this.url =
        "https://raw.githubusercontent.com/InSync-HQ/InSync_FlutterApp/main/assets/avatar.png",
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
