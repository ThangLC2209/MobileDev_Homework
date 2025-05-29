import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI Components',
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/components': (context) => ComponentsListScreen(),
        '/textDetail': (context) => TextDetailScreen(),
        '/images': (context) => ImageScreen(),
        '/textfield': (context) => TextFieldScreen(),
        '/row': (context) => RowLayoutScreen(),
        '/column': (context) => ColumnLayoutScreen(),
      },
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 16, 0),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "le Chi Thang",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("05120512905"),
                  ],
                ),
              ),
            ),


            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/jetpack_compose_logo.png',
                    width: 120,
                    height: 120,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Jetpack Compose",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Jetpack Compose is a modern UI toolkit for building native Android applications using a declarative programming approach.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, bottom: 24),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/components');
                  },
                  child: const Text("I'm ready"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ComponentsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'UI Components List',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        children: [
          const Text("Display", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          _buildTile(context, "Text", "Displays text", '/textDetail'),
          _buildTile(context, "Image", "Displays an image", '/images'),

          const SizedBox(height: 12),
          const Text("Input", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          _buildTile(context, "TextField", "Input field for text", '/textfield'),
          _buildTile(context, "PasswordField", "Input field for passwords", null),

          const SizedBox(height: 12),
          const Text("Layout", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          _buildTile(context, "Column", "Arranges elements vertically", '/column'),
          _buildTile(context, "Row", "Arranges elements horizontally", '/row'),

          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.red[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const ListTile(
              title: Text("Tự tìm hiểu", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Tìm ra tất cả các thành phần UI Cơ bản"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTile(BuildContext context, String title, String subtitle, String? routeName) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        onTap: routeName != null ? () => Navigator.pushNamed(context, routeName) : null,
      ),
    );
  }
}

class TextDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
        (title: Text('Text Detail'),
        centerTitle: true,
        foregroundColor: Colors.blue,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: 'The '),
              TextSpan(
                text: 'quick',
                style: TextStyle(decoration: TextDecoration.lineThrough),
              ),
              TextSpan(
                text: ' Brown',
                style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
              ),
              TextSpan(text: '\nfox j u m p s '),
              TextSpan(
                text: 'over',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: '\nthe '),
              TextSpan(
                text: 'lazy',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              TextSpan(text: ' dog.', style: TextStyle(decoration: TextDecoration.underline)),
            ],
          ),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class ImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
        (
        title: Text('Images'),
        centerTitle: true,
        foregroundColor: Colors.blue,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          Image.network('https://giaothongvantaitphcm.edu.vn/wp-content/uploads/2025/01/Logo-GTVT.png'),
          Center(child: Text('Network image')),
          SizedBox(height: 10),
          Image.asset('assets/images/inapp.jpg'),
          Center(child: Text('In app')),
        ],
      ),
    );
  }
}

class TextFieldScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TextField')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Thông tin nhập',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Tự động cập nhật dữ liệu theo textfield',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowLayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row Layout'),
        centerTitle: true,
        foregroundColor: Colors.blue,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (i) =>
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(3, (j) =>
                      Container(
                        margin: EdgeInsets.all(6),
                        width: 60,
                        height: 40,
                        decoration: BoxDecoration(
                          color: j == 1 ? Colors.blue[600] : Colors.blue[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                  ),
                ),
              ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}



class ColumnLayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Colum Layout'),
        centerTitle: true,
        foregroundColor: Colors.blue,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          width: 340, //
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[100], // xám nhẹ
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(3, (index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 100,
                decoration: BoxDecoration(
                  color: index == 1 ? Colors.green[400] : Colors.green[200],
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

