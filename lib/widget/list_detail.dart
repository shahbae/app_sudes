import 'package:flutter/material.dart';

class ListDetail extends StatefulWidget {
  final String? valueAtribut;
  final String? atribut;
  const ListDetail({
    Key? key,
    this.valueAtribut,
    this.atribut,
  }) : super(key: key);

  @override
  State<ListDetail> createState() => _ListDetailState();
}

class _ListDetailState extends State<ListDetail> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: SizedBox(
            width: 100.0,
            child: Text(
              widget.atribut.toString(),
              maxLines: 2,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        const Text(
          ":",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Flexible(
          child: Text(
            widget.valueAtribut.toString(),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }
}
