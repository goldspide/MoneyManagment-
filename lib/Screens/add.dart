import 'package:flutter/material.dart';

class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  String? selectedItems;
  final List<String> _item = [
    'food',
    'Transfer',
    'Transportation',
    'Education'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            background_container(context),
            Positioned(
              top: 120,
              child: main_container(context),
            ),
          ],
        ),
      ),
    );
  }

  Container main_container(BuildContext context) {
    return Container(
      height: 550,
      width: 340,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          name(),
          const SizedBox(
            height: 30,
          )
          // TextField implementation
        ],
      ),
    );
  }
  Padding name(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: const Color(0xffC5C5C5))),
        child: DropdownButton<String>(
          value: selectedItems,
          items: _item
              .map((e) => DropdownMenuItem(
            value: e,
            child: Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                    child: Image.asset('images/$e.png'),
                  ),
                  const SizedBox(width: 10,),
                  Text(e,style: const TextStyle(fontSize: 18),)
                ],
              ),
            ),
          ))
              .toList(),
          selectedItemBuilder: (BuildContext context )=> _item.map((e) => Row(children: [
            SizedBox(
              width: 42,
              child: Image.asset('images/$e.png'),
            ),
            const SizedBox(width: 5,),
            Text(e),
          ],)).toList(),
          hint: const Text('Name',style: TextStyle(color: Colors.grey),),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
          onChanged: ((value) {
            setState(
                  () {
                selectedItems = value!;
              },
            );
          }),
        ),
      ),
    );
  }

  Column background_container(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 240,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xff368983),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    const Text(
                      'Adding',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    const Icon(
                      Icons.attach_file_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
