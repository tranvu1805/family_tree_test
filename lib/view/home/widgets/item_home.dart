import 'package:family_tree_test/view/home/widgets/card_item.dart';
import 'package:flutter/material.dart';

class ItemHome extends StatelessWidget {
  const ItemHome(
      {super.key,
      required this.name,
      required this.gender,
      required this.member,
      required this.date,
      required this.author});
  final String name;
  final String gender;
  final String member;
  final String date;
  final String author;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$gender đời'),
                  Text('$member thành viên'),
                  Text('Ngày: $date'),
                ],
              ),
              Text('Người tạo: $author')
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CardItem(
                    title: 'Danh sách thành viên',
                    iconData: Icons.list_alt,
                    buttonTitle: 'Phả Hệ',
                    color: Colors.orange,
                    onTap: () {}),
              ),
              Expanded(
                child: CardItem(
                    title: 'Danh sách chi',
                    iconData: Icons.lan_outlined,
                    buttonTitle: 'Chi Họ',
                    color: Colors.orange,
                    onTap: () {}),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: CardItem(
                    title: 'Toàn bộ gia phả',
                    iconData: Icons.design_services_outlined,
                    buttonTitle: 'Thiết kế gia phả',
                    color: Colors.orange,
                    onTap: () {}),
              )
            ],
          )
        ],
      ),
    );
  }
}
