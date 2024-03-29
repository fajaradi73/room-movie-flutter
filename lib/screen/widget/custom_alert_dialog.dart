import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog(
      {Key? key,
      required this.title,
      required this.description,
      required this.yesTitle,
      required this.noTitle,
      required this.actionYes,
      required this.actionNo})
      : super(key: key);

  final String title, description, yesTitle, noTitle;

  final void Function() actionYes;

  final void Function() actionNo;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            child: Text(description),
          ),
          const SizedBox(height: 20),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          SizedBox(
            width: Get.width,
            height: 50,
            child: InkWell(
              // highlightColor: Colors.grey[200],
              onTap: actionYes,
              child: Center(
                child: Text(
                  yesTitle,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          SizedBox(
            width: Get.width,
            height: 50,
            child: InkWell(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
              // highlightColor: Colors.grey[200],
              onTap: actionNo,
              child: Center(
                child: Text(
                  noTitle,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
