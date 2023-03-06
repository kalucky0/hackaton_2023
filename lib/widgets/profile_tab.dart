import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Statystyki",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 5,
                    bottom: 5,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Odwiedzone miejsca',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 5,
                          bottom: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[100]!,
                        ),
                        child: const Text(
                          '10',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width - 35,
                color: Colors.grey.withOpacity(.2),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 5,
                    bottom: 5,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Ukończone trasy',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 5,
                          bottom: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[100]!,
                        ),
                        child: const Text(
                          '5',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width - 35,
                color: Colors.grey.withOpacity(.2),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 5,
                    bottom: 5,
                  ),
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Ulubiona kategoria',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 5,
                          bottom: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[100]!,
                        ),
                        child: const Text(
                          'Restauracje',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width - 35,
                color: Colors.grey.withOpacity(.2),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 5,
                    bottom: 5,
                  ),
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Najdłuższa trasa',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 5,
                          bottom: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[100]!,
                        ),
                        child: const Text(
                          '8.7 km',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width - 35,
                color: Colors.grey.withOpacity(.2),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 5,
                    bottom: 5,
                  ),
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Najdłuszy pokonany odcinek',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 5,
                          bottom: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[100]!,
                        ),
                        child: const Text(
                          '3.2 km',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
