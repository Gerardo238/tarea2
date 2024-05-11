import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formas Geométricas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FormasGeometricas(),
    );
  }
}

class FormasGeometricas extends StatefulWidget {
  @override
  _FormasGeometricasState createState() => _FormasGeometricasState();
}

class _FormasGeometricasState extends State<FormasGeometricas> {
  String figura = '';
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void dibujarFigura() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formas Geométricas', style: TextStyle(color: Colors.red),),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Ingrese una figura',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese una figura';
                  }
                  return null;
                },
                onSaved: (value) {
                  figura = value!.toLowerCase();
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: dibujarFigura,
                child: Text('Aceptar'),
              ),
              SizedBox(height: 20.0),

              figura == 'triángulo'
                  ? Triangulo()
                      :figura == 'triangulo'
                       ? Triangulo()
                  : figura == 'cuadrado'
                      ? Cuadrado()
                      : figura == 'cuadrado '
                      ? Cuadrado()
                      : Text('Figura no encontrada'),
            ],
          ),
        ),
      ),
    );
  }
}

class Triangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200, 200),
      painter: TrianguloPainter(),
    );
  }
}

class Cuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Color.fromARGB(255, 244, 73, 54),
    );
  }
}

class TrianguloPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromARGB(255, 205, 243, 33)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}