import 'package:flutter/material.dart';

class AddFlowerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Flower'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Show modal overlay
              showModalBottomSheet(
                context: context,
                isScrollControlled: true, // Trying to allow full screen not working
                builder: (context) => AddFlowerModal(),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Press the + icon to add a flower.'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0, 
        onTap: (index) {
          // Take me there
        },
      ),
    );
  }
}

class AddFlowerModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, 
        children: <Widget>[
          _buildTextField('Flower Image URL', 'Enter flower image URL'),
          SizedBox(height: 20),
          _buildTextField('Flower Name', 'Enter flower name'),
          SizedBox(height: 20),
          _buildTextField('Flower Description', 'Enter flower description', maxLines: 3),
          SizedBox(height: 20),
          _buildTextField('Add Price', 'Enter flower price', keyboardType: TextInputType.number),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context); 
                  },
                  child: Text('Cancel'),
                ),
              ),
              SizedBox(width: 10), 
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Add flower to db 
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Add Flower'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _buildTextField(String label, String hint, {int maxLines = 1, TextInputType keyboardType = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        TextField(
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
      ],
    );
  }
}
