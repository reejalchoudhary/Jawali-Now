import '../models/update_model.dart';

final List<UpdateModel> mockUpdates = [
  UpdateModel(
    title: 'Traffic Update — Jawali',
    description:
        'Avoid main Jawali road due to heavy traffic.',
    type: 'alert',
    time: '2 min ago',
    icon: 'car',
  ),

  UpdateModel(
    title: 'New Shop Opened — Dhan',
    description:
        'A new local café has opened near the Dhan market.',
    type: 'local',
    time: '15 min ago',
    icon: 'coffee',
  ),

    UpdateModel(
    title: '8:30 AM Bus Delayed',
    description:
        'The Sood bus usually arriving at 8:30 AM is delayed by approximately 20 minutes.',
    type: 'transport',
    time: '15 min ago',
    icon: 'bus',
  ),

  UpdateModel(
    title: 'Weather Update',
    description:
        'Light rainfall expected in evening hours.',
    type: 'weather',
    time: '28 min ago',
    icon: 'cloud',
  ),

  UpdateModel(
    title: 'Road Cleared Successfully',
    description:
        'The Matlahar road blockage has now been cleared.',
    type: 'success',
    time: '1 hour ago',
    icon: 'check',
  ),
];