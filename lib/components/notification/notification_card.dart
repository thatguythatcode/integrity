import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String date;
  final String imagePath;
  final bool isNew; // Indicator for new/unopened notifications

  const NotificationCard({
    required this.title,
    required this.date,
    required this.imagePath,
    this.isNew = false, // Default value is false, meaning it's not new
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Row(
        children: [
          // Card container with image and notification details
          _buildCardContent(),
          
          // Display a vertical line on the right if notification is new
          if (isNew) _buildNewIndicator(),
        ],
      ),
    );
  }

  // Builds the content section of the notification card
  Widget _buildCardContent() {
    return Container(
      height: 86,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 2,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          // Left section with image and text
          _buildLeftSection(),
          
          // Arrow button on the right side for navigation
          _buildArrowButton(),
        ],
      ),
    );
  }

  // Builds the left section (image + title + date)
  Widget _buildLeftSection() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          // Image container
          _buildImageContainer(),
          
          const SizedBox(width: 10),
          
          // Text content: title and date in column
          _buildTextContent(),
        ],
      ),
    );
  }

  // Builds the container for the notification image
  Widget _buildImageContainer() {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: const Color(0xFFBAC6DF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Image.asset(imagePath), // Display asset image here
    );
  }

  // Builds the text content (title and date)
  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title (description) in a row
        Row(
          children: [
            SizedBox(
              width: 247,
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF3E3F42),
                  fontSize: 12,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        
        // Date below the title in the column
        Row(
          children: [
            Text(
              date,
              style: const TextStyle(
                color: Color(0xFF919191),
                fontSize: 10,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Builds the forward arrow button
  Widget _buildArrowButton() {
    return IconButton(
      icon: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 18,
        color: Color(0xFF1F4799),
      ),
      onPressed: () {
        // Handle forward navigation (if needed)
      },
    );
  }

  // Builds the vertical line indicator if the notification is new
  Widget _buildNewIndicator() {
    return Container(
      width: 3,
      height: 86,
      color: const Color(0xFF1F4799),
    );
  }
}
