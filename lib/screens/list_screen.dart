import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late final List<String> _todoList;

  @override
  void initState() {
    super.initState();
    _todoList = List.generate(10, (int index) {
      return "photo$index";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SvgPicture.asset("assets/icons/logo.svg"),
        ),
        toolbarHeight: 70.0,
        leadingWidth: 120.0,
        surfaceTintColor: Colors.black,
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: _todoList.length,
          separatorBuilder: (context, index) => const SizedBox(height: 20.0),
          itemBuilder: (context, index) {
            final item = _todoList[index];

            if (index == 0) {
              return Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      "assets/images/background.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Positioned.fill(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          cursorColor: Colors.black,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w300,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            hintText: "Поиск",
                            hintStyle: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w300,
                            ),
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(20.0),
                            suffixIcon: Icon(
                              Icons.search,
                              size: 40.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Image.asset("assets/images/$item.png", fit: BoxFit.cover),
            );
          },
        ),
      ),
    );
  }
}
