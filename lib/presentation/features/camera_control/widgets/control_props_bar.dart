import 'package:flutter/material.dart';

import '../../../../domain/models/control_prop.dart';
import '../../../../domain/models/control_prop_type.dart';
import 'control_prop_item.dart';

class ControlPropsBar extends StatelessWidget {
  final ControlProp isoProp = const ControlProp(
      type: ControlPropType.iso,
      currentValue: '25600',
      allowedValues: [
        '320',
        '400',
        '500',
        '640',
        '800',
        '[850]',
        '1000',
        '1250',
        '1600',
        '2000',
        '2500',
        '3200',
        '4000',
        '5000',
        '6400',
        '8000',
        '10000',
        '12800',
        '16000',
        '20000',
        '25600',
        '32000',
        '40000',
        '51200',
        '64000',
        '80000',
        '1024z'
      ]);
  final ControlProp shutterAngleProp = const ControlProp(
    type: ControlPropType.shutterAngle,
    currentValue: '180.00',
    allowedValues: [],
  );
  final ControlProp apertureProp = const ControlProp(
    type: ControlPropType.aperture,
    currentValue: '2.8',
    allowedValues: [],
  );
  final ControlProp whiteBalanceProp = const ControlProp(
    type: ControlPropType.whiteBalance,
    currentValue: '5700',
    allowedValues: [],
  );

  const ControlPropsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ControlPropItem(
            controlProp: isoProp,
            formatValue: (value) => 'ISO $value',
            onValueChanged: (value) {
              print('iso changed to $value');
            },
          ),
          ControlPropItem(
            controlProp: shutterAngleProp,
            formatValue: (value) => '$value°',
            onValueChanged: (value) {},
          ),
          ControlPropItem(
            controlProp: apertureProp,
            formatValue: (value) => 'F$value',
            onValueChanged: (value) {},
          ),
          ControlPropItem(
            controlProp: whiteBalanceProp,
            formatValue: (value) => '${value}K',
            onValueChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
