// import 'package:device_info_plus/device_info_plus.dart';
import 'package:calculadora_imc_2/constants/breakpoints.dart';
import 'package:calculadora_imc_2/widgets/label_h2.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:intl/intl.dart';
// import 'package:package_info_plus/package_info_plus.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:trilhaapp/pages/auto_size_text/auto_size_text_page.dart';
// import 'package:trilhaapp/pages/battery/battery_page.dart';
// import 'package:trilhaapp/pages/camera/camera_page.dart';
// import 'package:trilhaapp/pages/connectivity_plus/connectivity_plus_page.dart';
// import 'package:trilhaapp/pages/geolocator/geolocator_page.dart';
// import 'package:trilhaapp/pages/percent_indicator/percent_indicator_page.dart';
// import 'package:trilhaapp/pages/qr_code/qr_code_page.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:path_provider/path_provider.dart' as path_provider;

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        const Padding(
          padding: EdgeInsets.all(Breakpoints.b8),
          child: UserAccountsDrawerHeader(
            arrowColor: Colors.red,
            accountName: LabelH2(
              label: "Nome do usuario",
              color: Colors.white,
            ),
            accountEmail: LabelH2(
              label: "Email do usuarui",
              color: Colors.white,
            ),
            decoration: BoxDecoration(
              color: Colors.purple, // Cor de fundo do cabeçalho
            ),
          ),
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: Row(
                children: const [
                  Icon(Icons.abc_outlined),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Camera"),
                ],
              )),
          onTap: () async {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (_) => CameraPage()));
          },
        ),
      ]),
    );
  }
}
