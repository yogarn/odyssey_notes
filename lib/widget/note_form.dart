// note_form.dart

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:odyssey_notes/services/location.dart';

class NoteForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController controllerTitle;
  final TextEditingController controllerBody;
  final TextEditingController controllerPlace;

  const NoteForm({
    Key? key,
    required this.formKey,
    required this.controllerTitle,
    required this.controllerBody,
    required this.controllerPlace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          children: [
            TextFormField(
              controller: controllerTitle,
              decoration: const InputDecoration(hintText: "Title"),
              validator: (value) => _onValidateText(value),
            ),
            TextFormField(
              maxLines: null,
              controller: controllerBody,
              decoration: const InputDecoration(hintText: "Body"),
              validator: (value) => _onValidateText(value),
            ),
            TextFormField(
              maxLines: null,
              controller: controllerPlace,
              decoration: InputDecoration(
                // contentPadding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                hintText: 'Location',
                // border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () async {
                    Position coordinate = await determinePosition();
                    String place = await determinePlace(
                        coordinate.latitude, coordinate.longitude);
                    controllerPlace.text = place;
                  },
                ),
              ),
              // validator: (value) => _onValidateText(value),
            ),
          ],
        ),
      ),
    );
  }

  String? _onValidateText(String? value) {
    if (value?.isEmpty ?? true) return 'Can\'t be empty';
    return null;
  }
}
