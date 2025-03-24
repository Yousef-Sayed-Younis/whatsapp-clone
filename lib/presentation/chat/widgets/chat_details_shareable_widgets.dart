import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String name;
  final double? size;
  final Color? color;
  final double padding;
  final TextAlign align;
  final FontWeight? weight;
  const CustomText({super.key, this.size, this.color, this.weight, this.padding = 0, required this.name, this.align = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Text(name, textAlign: align, style: TextStyle(fontSize: size, fontWeight: weight)),
    );
  }
}

class InfoTile extends StatelessWidget {
  final String title;
  final Color? color;
  final IconData? icon;
  final String? subtitle;
  const InfoTile({super.key, this.icon, this.color, this.subtitle = "", required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      textColor: color,
      minTileHeight: 30,
      leading: (icon != null) ? Icon(icon) : null,
      contentPadding: EdgeInsets.only(right: 4, left: 10),
      title: CustomText(name: title, size: 15, weight: FontWeight.w500, color: color),
      trailing: (icon != null)
          ? SizedBox(
              width: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(subtitle!, style: const TextStyle(color: Colors.grey)),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                ],
              ),
            )
          : Icon(icon, size: 16, color: Colors.grey),
    );
  }
}

class ContactButton extends StatelessWidget {
  final String label;
  final IconData icon;

  const ContactButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.sizeOf(context).width / 5,
      height: 76,
      child: Card(
        child: Column(
          children: [IconButton(icon: Icon(icon, size: 30, color: Colors.green), onPressed: () {}), Text(label)],
        ),
      ),
    );
  }
}

class CustomCards extends StatelessWidget {
  final List<dynamic> media;
  const CustomCards({super.key, required this.media});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Column(
          children: ListTile.divideTiles(
            context: context,
            color: const Color(0xffefefef),
            tiles: List.generate(
                media.length, (index) => InfoTile(title: media[index].media, subtitle: media[index].number ?? "", icon: media[index].icon)),
          ).toList(),
        ),
      ),
    );
  }
}

class CustomCircularAvatar extends StatelessWidget {
  final String image;
  final double radius;
  const CustomCircularAvatar({super.key, required this.image, required this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(radius: radius, backgroundImage: AssetImage(image));
  }
}
