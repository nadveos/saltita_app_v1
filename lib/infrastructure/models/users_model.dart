

import 'package:saltita/infrastructure/models/models.dart';

class Users {
    List<User> items;
    int page;
    int perPage;
    int totalItems;
    int totalPages;

    Users({
        required this.items,
        required this.page,
        required this.perPage,
        required this.totalItems,
        required this.totalPages,
    });

    Users copyWith({
        List<User>? items,
        int? page,
        int? perPage,
        int? totalItems,
        int? totalPages,
    }) => 
        Users(
            items: items ?? this.items,
            page: page ?? this.page,
            perPage: perPage ?? this.perPage,
            totalItems: totalItems ?? this.totalItems,
            totalPages: totalPages ?? this.totalPages,
        );
}

