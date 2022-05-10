import 'package:flutter/material.dart';

class DetailsItem extends StatelessWidget {
  final String title;
  final dynamic value;
  final IconData icon;

  const DetailsItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Text(
            "$value",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
