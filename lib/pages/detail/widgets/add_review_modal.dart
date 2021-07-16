import 'package:flutter/material.dart';

class AddReviewModal extends StatefulWidget {

  @override
  _AddReviewModalState createState() => _AddReviewModalState();
}

class _AddReviewModalState extends State<AddReviewModal> {
  late TextEditingController nameController;
  late TextEditingController reviewController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    reviewController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: DraggableScrollableSheet(
        initialChildSize: 0.9,
        maxChildSize: 1,
        minChildSize: 0.9,
        builder: (context, scrollController) => Container(
          padding: EdgeInsets.all(35),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: ListView(
            controller: scrollController,
            children: [
              Text(
                'Add Review',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 26
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Name',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 10),
              TextField(
                controller: nameController,
                autofocus: true,
                cursorColor: Colors.grey[600],
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  enabledBorder: enabledBorder(),
                  focusedBorder: focusedBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Review',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 10),
              TextField(
                controller: reviewController,
                maxLines: 7,
                cursorColor: Colors.grey[600],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  enabledBorder: enabledBorder(),
                  focusedBorder: focusedBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(10),
                  textStyle: TextStyle(
                    fontSize: 17
                  ),
                  primary: Colors.red,
                  shape: StadiumBorder()
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder focusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.red[600]!, width: 2)
    );
  }

  OutlineInputBorder enabledBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.grey,width: 2)
    );
  }  
}