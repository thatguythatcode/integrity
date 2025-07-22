import 'package:flutter/material.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});

  void onServiceTap(String service) {
    // Define what should happen when a service is tapped.
    // For example, navigate to a new screen or show a message.
    print('Tapped on $service');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Services',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'See all...',
                style: TextStyle(
                  color: Color(0xFF6A6A6A),
                  fontSize: 14,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ServiceItem(label: 'Airtime', onTap: () => onServiceTap('Airtime')),
              const SizedBox(width: 24),
              ServiceItem(label: 'Data', onTap: () => onServiceTap('Data')),
              const SizedBox(width: 24),
              ServiceItem(label: 'Electricity', onTap: () => onServiceTap('Electricity')),
              const SizedBox(width: 24),
              ServiceItem(label: 'Referral', onTap: () => onServiceTap('Referral')),
            ],
          ),
        ],
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const ServiceItem({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Image.asset("assets/images/icons/service.png"),
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF0A0A0A),
              fontSize: 12,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
