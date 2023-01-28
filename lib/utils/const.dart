
import 'package:catalogs/modal/cartmodal.dart';
import 'package:catalogs/modal/errmodal.dart';
import 'package:catalogs/modal/userclass.dart';
import 'package:catalogs/provider/updateprovider.dart';
import 'package:connectivity/connectivity.dart';

import '../modal/Colorsdata.dart';
import '../modal/prodmodal.dart';
import '../modal/usermodal.dart';

Future<bool> checkInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

usermodal? userData;
updateddata? newData;
colorsdata? clrdata;
Prodmodal? prods;
Datamodal? eror;
CartModal? cart;
userdatamodal? usernew;


const String baseUrl = 'https://adibun.fableadtechnolabs.com/api';

Map<String, String> headers = {
  'Authorization': 'hXuRUGsEGuhGf6KG',
};
String? sun =
    """
<HTML>
<BODY LANG='en-GB' DIR='LTR'>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Sun PERIOADA 06.05.2022 - 23.09.2022 AVETI URMATOARELE <A HREF='https://youtu.be/oyJOMv3FGeE' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Sun PERIOADA 24.09.2022 - 22.10.2022 AVETI URMATOARELE <A HREF='https://youtu.be/aMTnl-Ba0tY' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Sun PERIOADA 23.10.2022 - 25.02.2023 AVETI URMATOARELE <A HREF='https://youtu.be/tqtahn9Wpfg' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Sun PERIOADA 26.02.2023 - 25.04.2023 AVETI URMATOARELE <A HREF='https://youtu.be/6RRiNx8_qKk' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>ULTERIOR DATEI DE 26.04.2023, PLANETA JUPITER VA AVEA O INFLUENTA MAI TEMPERATA, DAR VOR INTERACTIONA ACELEASI SECTOARE DE VIATA PREZENTATE IN ULTIMUL CALUP DE PREVIZIUNI</FONT></P>
</BODY>
</HTML>
    """;
String? moon =
    """
<HTML>
 <BODY LANG='en-GB' DIR='LTR'>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Moon PERIOADA 06.05.2022 - 23.09.2022 AVETI URMATOARELE <A HREF='https://youtu.be/oyJOMv3FGeE' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Moon PERIOADA 24.09.2022 - 22.10.2022 AVETI URMATOARELE <A HREF='https://youtu.be/aMTnl-Ba0tY' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Moon PERIOADA 23.10.2022 - 25.02.2023 AVETI URMATOARELE <A HREF='https://youtu.be/tqtahn9Wpfg' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Moon PERIOADA 26.02.2023 - 25.04.2023 AVETI URMATOARELE <A HREF='https://youtu.be/6RRiNx8_qKk' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>ULTERIOR DATEI DE 26.04.2023, PLANETA JUPITER VA AVEA O INFLUENTA MAI TEMPERATA, DAR VOR INTERACTIONA ACELEASI SECTOARE DE VIATA PREZENTATE IN ULTIMUL CALUP DE PREVIZIUNI</FONT></P>
</BODY>
</HTML>""";
String? marcury =
    """
<HTML>
<BODY LANG='en-GB' DIR='LTR'>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Mercury PERIOADA 06.05.2022 - 23.09.2022 AVETI URMATOARELE <A HREF='https://youtu.be/oyJOMv3FGeE' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Mercury PERIOADA 24.09.2022 - 22.10.2022 AVETI URMATOARELE <A HREF='https://youtu.be/aMTnl-Ba0tY' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Mercury PERIOADA 23.10.2022 - 25.02.2023 AVETI URMATOARELE <A HREF='https://youtu.be/tqtahn9Wpfg' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Mercury PERIOADA 26.02.2023 - 25.04.2023 AVETI URMATOARELE <A HREF='https://youtu.be/6RRiNx8_qKk' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>ULTERIOR DATEI DE 26.04.2023, PLANETA JUPITER VA AVEA O INFLUENTA MAI TEMPERATA, DAR VOR INTERACTIONA ACELEASI SECTOARE DE VIATA PREZENTATE IN ULTIMUL CALUP DE PREVIZIUNI</FONT></P>
</BODY>
</HTML>
""";
String? venus =
    """
<HTML>
<BODY LANG='en-GB' DIR='LTR'>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Venus PERIOADA 06.05.2022 - 23.09.2022 AVETI URMATOARELE <A HREF='https://youtu.be/oyJOMv3FGeE' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Venus PERIOADA 24.09.2022 - 22.10.2022 AVETI URMATOARELE <A HREF='https://youtu.be/aMTnl-Ba0tY' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Venus PERIOADA 23.10.2022 - 25.02.2023 AVETI URMATOARELE <A HREF='https://youtu.be/tqtahn9Wpfg' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Venus PERIOADA 26.02.2023 - 25.04.2023 AVETI URMATOARELE <A HREF='https://youtu.be/6RRiNx8_qKk' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>ULTERIOR DATEI DE 26.04.2023, PLANETA JUPITER VA AVEA O INFLUENTA MAI TEMPERATA, DAR VOR INTERACTIONA ACELEASI SECTOARE DE VIATA PREZENTATE IN ULTIMUL CALUP DE PREVIZIUNI</FONT></P>
</BODY>
</HTML>

""";
String? mars =
    """
<HTML>
<BODY LANG='en-GB' DIR='LTR'>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Mars PERIOADA 06.05.2022 - 23.09.2022 AVETI URMATOARELE <A HREF='https://youtu.be/oyJOMv3FGeE' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Mars PERIOADA 24.09.2022 - 22.10.2022 AVETI URMATOARELE <A HREF='https://youtu.be/aMTnl-Ba0tY' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Mars PERIOADA 23.10.2022 - 25.02.2023 AVETI URMATOARELE <A HREF='https://youtu.be/tqtahn9Wpfg' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Mars PERIOADA 26.02.2023 - 25.04.2023 AVETI URMATOARELE <A HREF='https://youtu.be/6RRiNx8_qKk' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>ULTERIOR DATEI DE 26.04.2023, PLANETA JUPITER VA AVEA O INFLUENTA MAI TEMPERATA, DAR VOR INTERACTIONA ACELEASI SECTOARE DE VIATA PREZENTATE IN ULTIMUL CALUP DE PREVIZIUNI</FONT></P>
</BODY>
</HTML>
""";
String? jupiter =
    """
<HTML>
<BODY LANG='en-GB' DIR='LTR'>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Jupiter PERIOADA 06.05.2022 - 23.09.2022 AVETI URMATOARELE <A HREF='https://youtu.be/oyJOMv3FGeE' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Jupiter PERIOADA 24.09.2022 - 22.10.2022 AVETI URMATOARELE <A HREF='https://youtu.be/aMTnl-Ba0tY' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Jupiter PERIOADA 23.10.2022 - 25.02.2023 AVETI URMATOARELE <A HREF='https://youtu.be/tqtahn9Wpfg' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Jupiter PERIOADA 26.02.2023 - 25.04.2023 AVETI URMATOARELE <A HREF='https://youtu.be/6RRiNx8_qKk' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>ULTERIOR DATEI DE 26.04.2023, PLANETA JUPITER VA AVEA O INFLUENTA MAI TEMPERATA, DAR VOR INTERACTIONA ACELEASI SECTOARE DE VIATA PREZENTATE IN ULTIMUL CALUP DE PREVIZIUNI</FONT></P>
</BODY>
</HTML>""";
String? saturn =
    """
<HTML>
<BODY LANG='en-GB' DIR='LTR'>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Saturn PERIOADA 06.05.2022 - 23.09.2022 AVETI URMATOARELE <A HREF='https://youtu.be/oyJOMv3FGeE' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Saturn PERIOADA 24.09.2022 - 22.10.2022 AVETI URMATOARELE <A HREF='https://youtu.be/aMTnl-Ba0tY' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Saturn PERIOADA 23.10.2022 - 25.02.2023 AVETI URMATOARELE <A HREF='https://youtu.be/tqtahn9Wpfg' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0in;font-size:15px;'><FONT COLOR='#ffffff'>Saturn PERIOADA 26.02.2023 - 25.04.2023 AVETI URMATOARELE <A HREF='https://youtu.be/6RRiNx8_qKk' TARGET='_blank'>PREVIZIUNI</A></FONT></P>
<P ALIGN=CENTER STYLE='margin-bottom: 0inv;font-size:15px;'><FONT COLOR='#ffffff'>ULTERIOR DATEI DE 26.04.2023, PLANETA JUPITER VA AVEA O INFLUENTA MAI TEMPERATA, DAR VOR INTERACTIONA ACELEASI SECTOARE DE VIATA PREZENTATE IN ULTIMUL CALUP DE PREVIZIUNI</FONT></P>
</BODY>
</HTML>
""";
