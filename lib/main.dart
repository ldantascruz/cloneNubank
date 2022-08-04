import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nubank',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

Color backgoundColor = Color.fromRGBO(131, 10, 210, 1);
Color secondaryPurple = Color.fromRGBO(155, 59, 218, 1);
Color greyColor = Color.fromRGBO(240, 241, 245, 1);

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    _setStatusbarColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgoundColor,
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(0),
      child: AppBar(
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
          )),
    );
  }

  _body() {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(),
                _account(),
                _actions(),
                _myCards(),
                _info(),
                _divider(),
                _credictCard(),
                _divider(),
                _loanArea(),
                _divider(),
                _easynvest(),
                _divider(),
                _lifeInsurance(),
                _divider(),
                _discover(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _header() {
    return Container(
      color: backgoundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _profile(),
              _options(),
            ],
          ),
          _welcome(),
        ],
      ),
    );
  }

  _profile() {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: secondaryPurple,
        ),
        child: Icon(
          MdiIcons.accountOutline,
          color: Colors.white,
        ),
      ),
      onTap: () {},
    );
  }

  _options() {
    return Row(
      children: [
        _icon(MdiIcons.eyeOffOutline),
        _icon(MdiIcons.helpCircleOutline),
        _icon(MdiIcons.emailPlus),
      ],
    );
  }

  _icon(icon) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }

  _welcome() {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        bottom: 20,
      ),
      child: Text(
        "Olá, Lucas",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _account() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _accountText(),
          _money(),
        ],
      ),
    );
  }

  _accountText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "Conta",
          style: TextStyle(
            fontSize: 20,
            //fontWeight: FontWeight.bold,
          ),
        ),
        Icon(MdiIcons.chevronRight),
      ],
    );
  }

  _money() {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      child: Text(
        "R\$ 680.254,45",
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _actions() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _actionItem(icon: MdiIcons.clover, name: 'Área Pix', isFirst: true),
            _actionItem(icon: MdiIcons.barcode, name: 'Pagar'),
            _actionItem(icon: MdiIcons.cash, name: 'Transferir'),
            _actionItem(icon: MdiIcons.cash, name: 'Receber'),
            _actionItem(icon: MdiIcons.creditCard, name: 'Recarga'),
            _actionItem(icon: MdiIcons.heartOutline, name: 'Doação'),
          ],
        ),
      ),
    );
  }

  _actionItem({required IconData icon, required String name, bool? isFirst}) {
    return Container(
      padding: isFirst != null && isFirst
          ? EdgeInsets.only(left: 20, right: 7)
          : EdgeInsets.symmetric(horizontal: 7),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Icon(icon),
          ),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  _myCards() {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(MdiIcons.creditCard),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text("Meus cartões"),
          ),
        ],
      ),
    );
  }

  _info() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _loan(),
          _saveMoney(),
        ],
      ),
    );
  }

  _loan() {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      margin: EdgeInsets.only(left: 20, top: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Você tem R\$100.000.00 disponíveis para ',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'empréstimo',
              style: TextStyle(
                color: backgoundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _saveMoney() {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      margin: EdgeInsets.only(left: 20, top: 10, right: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Conquiste planos futuros: conheça as opções para ',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'guardar dinheiro',
              style: TextStyle(
                color: backgoundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Divider(
        thickness: 2,
      ),
    );
  }

  _credictCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _credictCardIcon(),
          _creditCardText(),
          _invoiceText(),
          _invoiceValue(),
          _limitText(),
        ],
      ),
    );
  }

  _credictCardIcon() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Icon(MdiIcons.creditCard),
    );
  }

  _creditCardText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'Cartão de crédito',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Icon(MdiIcons.chevronRight),
      ],
    );
  }

  _invoiceText() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        'Fatura atual',
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  _invoiceValue() {
    return Text(
      'R\$ 351.574,06',
      style: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _limitText() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(
        'Limite disponível de R\$ 2.500.000,00',
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  _loanArea() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _loanIcon(),
          _loanText(),
          _loanValue(),
        ],
      ),
    );
  }

  _loanIcon() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Icon(MdiIcons.cash),
    );
  }

  _loanText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'Empréstimo',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Icon(MdiIcons.chevronRight),
      ],
    );
  }

  _loanValue() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Valor disponível até ', style: TextStyle(color: Colors.grey)),
          Text('R\$ 100.000,00 ', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  _easynvest() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _easynvestIcon(),
          _easynvestText(),
          _easynvestInfo(),
          _easynvestButton(),
        ],
      ),
    );
  }

  _easynvestIcon() {
    return Icon(MdiIcons.finance);
  }

  _easynvestText() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Investimentos Easynvest',
            style: TextStyle(
              fontSize: 23,
            ),
          ),
          Icon(MdiIcons.chevronRight),
        ],
      ),
    );
  }

  _easynvestInfo() {
    return Text(
      'Você já abriu sua conta Easynvest para investir sem taxas e burocracias.',
    );
  }

  _easynvestButton() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: TextButton(
        style: ElevatedButton.styleFrom(
          primary: backgoundColor,
          shape: StadiumBorder(),
          fixedSize: Size.infinite,
        ),
        onPressed: () {},
        child: Text(
          'Ir para Easynvest',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  _lifeInsurance() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _lifeInsuranceIcon(),
          _lifeInsuranceText(),
          _lifeInsuranceInfo(),
        ],
      ),
    );
  }

  _lifeInsuranceIcon() {
    return Icon(MdiIcons.heartOutline);
  }

  _lifeInsuranceText() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Seguro de vida',
            style: TextStyle(
              fontSize: 23,
            ),
          ),
          Icon(MdiIcons.chevronRight),
        ],
      ),
    );
  }

  _lifeInsuranceInfo() {
    return Text(
      'Conheça Nubank vida: um seguro simples e que cabe no bolso.',
    );
  }

  _discover() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _discoverText(),
          _discoverAction(),
        ],
      ),
    );
  }

  _discoverText() {
    return Text(
      'Descubra mais',
      style: TextStyle(
        fontSize: 23,
      ),
    );
  }

  _discoverAction() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width * .7,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _discoverText2(),
          _discoverText3(),
          _discoverButton(),
        ],
      ),
    );
  }

  _discoverText2() {
    return Container(
      child: Text(
        'Indique seus amigos',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  _discoverText3() {
    return Container(
      child: Text(
        'Mostre aos seus amigos como é fácil ter uma vida sem burocracia.',
        style: TextStyle(),
      ),
    );
  }

  _discoverButton() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: TextButton(
        style: ElevatedButton.styleFrom(
          primary: backgoundColor,
          shape: StadiumBorder(),
          fixedSize: Size.infinite,
        ),
        onPressed: () {},
        child: Text(
          'Indicar amigos',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  _setStatusbarColor() {
    FlutterStatusbarcolor.setStatusBarColor(backgoundColor);
  }
}
