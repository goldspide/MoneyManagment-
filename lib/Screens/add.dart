import 'package:flutter/material.dart';

class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  DateTime date = DateTime.now();
  String? selectedItems;
  String? selectedItems2;
  final TextEditingController explain_C = TextEditingController();
  FocusNode ex = FocusNode();
  final TextEditingController amount_C = TextEditingController();
  FocusNode amount_ = FocusNode();
  final List<String> _item = [
    'food',
    'Transfer',
    'Transportation',
    'Education'
  ];  final List<String> _item2 = [
    'Transportation',
    'Education'
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ex.addListener(() {
      setState(() {});
    });

    amount_.addListener(() {
      setState(() {});
    });
  }

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
          ),
          // TextField implementation
          explain(),
          const SizedBox(
            height: 30,
          ),
          amount(),
          const SizedBox(
            height: 30,
          ),
          how(),
          const SizedBox(
            height: 30,
          ),
          date_time(),
          const SizedBox(height: 30,),
          const Spacer(),
          save(),
          const SizedBox(height: 20,)


        ],
      ),
    );
  }

  GestureDetector save(){
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xff368983),
        ),
        width: 120,
        height: 50,
        child: const Text('Save', style: TextStyle(
          fontFamily: 'f',
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontSize: 17,
        ),),
      ),
    );
  }

  Widget date_time(){
    return Container(
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2, color: const Color(0xffC5C5C5),
        ),
      ),
      width: 300,
      child: TextButton(onPressed: () async{
        DateTime? newDate = await showDatePicker(context: context, initialDate: date, firstDate: DateTime(2022), lastDate: DateTime(2025),);
        if (newDate == null) return;
        setState(() {
          date = newDate!;
        });
      }, child: Text('Date : ${date.year} /${date.month} /${date.day}' ,style: const TextStyle(
          fontSize: 15,
          color: Colors.black
      ),),),
    );
  }

  Padding how() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: const Color(0xffC5C5C5))),
        child: DropdownButton<String>(
          value: selectedItems2,
          items: _item2
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
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            e,
                            style: const TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ))
              .toList(),
          selectedItemBuilder: (BuildContext context) => _item2
              .map((e) => Row(
                    children: [
                      SizedBox(
                        width: 42,
                        child: Image.asset('images/$e.png'),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(e),
                    ],
                  ))
              .toList(),
          hint: const Text(
            'how',
            style: TextStyle(color: Colors.grey),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
          onChanged: ((value) {
            setState(
              () {
                selectedItems2 = value!;
              },
            );
          }),
        ),
      ),
    );
  }

  Padding explain() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        focusNode: ex,
        controller: explain_C,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'explain',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 2, color: Color(0xffC5C5C5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 2, color: Color(0xffC5C5C5)),
          ),
        ),
      ),
    );
  }

  Padding amount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        keyboardType: TextInputType.number,
        focusNode: amount_,
        controller: amount_C,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'amount',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 2, color: Color(0xffC5C5C5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 2, color: Color(0xffC5C5C5)),
          ),
        ),
      ),
    );
  }

  Padding name() {
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
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            e,
                            style: const TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ))
              .toList(),
          selectedItemBuilder: (BuildContext context) => _item
              .map((e) => Row(
                    children: [
                      SizedBox(
                        width: 42,
                        child: Image.asset('images/$e.png'),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(e),
                    ],
                  ))
              .toList(),
          hint: const Text(
            'Name',
            style: TextStyle(color: Colors.grey),
          ),
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
