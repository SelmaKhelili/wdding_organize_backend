library zefeffete.globals;

import 'package:flutter/material.dart';

// Global map to track liked vendors by ID

final ValueNotifier<List<Map<String, dynamic>>> likedVendors =
    ValueNotifier([]);
