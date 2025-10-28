import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:ppkd_uqyy/9day17/appimage.dart';
import 'package:ppkd_uqyy/extension/rupiah.dart';

class tugas9 extends StatefulWidget {
  const tugas9({super.key});

  @override
  State<tugas9> createState() => _tugas9State();
}

class _tugas9State extends State<tugas9> {
  final List<Map<String, dynamic>> namaobat = [
    {
      "name": "Paracetamol",
      "price": 5000,
      "condition": "Segar",
      "image": AppImages.Paracetamol,
    },
    {
      "name": "Fresh care",
      "price": 5000,
      "condition": "Segar",
      "image": AppImages.Fresh_care,
    },
    {
      "name": "Balsem",
      "price": 15000,
      "condition": "Segar",
      "image": AppImages.Balsem,
    },
    {
      "name": "Promag",
      "price": 35000,
      "condition": "Segar",
      "image": AppImages.Promag,
    },
    {
      "name": "koyo",
      "price": 2000,
      "condition": "Segar",
      "image": AppImages.koyo,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: namaobat.length,
      itemBuilder: (BuildContext context, int index) {
        final item = namaobat[index];
        return ListTile(
          onTap: () {
            //Versi 1
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     backgroundColor: AppColor.army1,
            //     content: Text(
            //       "${item["name"]} ${item["price"].toString().toRPCurrency()} aja",
            //     ),
            //   ),
            // );

            //Versi 2
            // Fluttertoast.showToast(
            //   backgroundColor: Colors.blue,
            //   msg:
            //       "${item["name"]} ${item["price"].toString().toRPCurrency()} aja",
            // );

            //Versi 3
            DelightToastBar(
              autoDismiss: true,
              snackbarDuration: Duration(milliseconds: 2000),
              builder: (context) => ToastCard(
                leading: Icon(Icons.flutter_dash, size: 28),
                title: Text(
                  "${item["name"]} ${item["price"].toString().toRPCurrency()} aja",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
              ),
            ).show(context);
          },
          leading: Image.asset(item["image"], width: 60),
          title: Text(item["name"]),
          subtitle: Text(item["price"].toString().toRPCurrency()),
        );
      },
    );
  }
}
