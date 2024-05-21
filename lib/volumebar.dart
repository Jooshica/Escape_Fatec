import 'package:flutter/material.dart';

class VolumeBar extends StatefulWidget {
  final String label;
  final ValueChanged<double>? onChanged;
  final double initialValue;

  const VolumeBar({
    Key? key,
    required this.label,
    this.onChanged,
    this.initialValue = 0.5,
  }) : super(key: key);

  @override
  _VolumeBarState createState() => _VolumeBarState();
}

class _VolumeBarState extends State<VolumeBar> {
  late double _currentVolume;

  @override
  void initState() {
    super.initState();
    _currentVolume = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(fontSize: 16), // Tamanho de texto menor
        ),
        SizedBox(
          height: 24, // Altura menor para o Slider
          child: Slider(
            value: _currentVolume,
            min: 0,
            max: 1,
            onChanged: (double value) {
              setState(() {
                _currentVolume = value;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            },
          ),
        ),
      ],
    );
  }
}


