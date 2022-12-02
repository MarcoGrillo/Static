import 'package:flutter/material.dart';
import 'package:static_app/models/folder.dart';
import 'package:static_app/models/subfolder.dart';
import 'package:static_app/models/task.dart';

const folders = [
  Folder(
    id: '1',
    title: 'First',
    color: Colors.green,
  ),
  Folder(
    id: '2',
    title: 'Second',
    color: Colors.red,
  ),
  Folder(
    id: '3',
    title: 'Third',
    color: Colors.blue,
  ),
];

List<Subfolder> subfolders = [
  Subfolder(
    id: '1',
    folderId: '1',
    title: 'Urgenze',
    colors: [
      Colors.red.shade400,
      Colors.red.shade300,
    ],
    tasks: [
      const Task(
        id: '1',
        subfolderId: '1',
        title: 'Controllare esami',
        description: 'TAC, RX, Esami del sangue',
        completed: true,
      ),
      const Task(
        id: '2',
        subfolderId: '1',
        title: 'TAC Mario Rossi',
        description:
            'Richiedere TAC per il sig. Mario Rossi per il primo giorno disponibile',
        completed: true,
      ),
      const Task(
        id: '1',
        subfolderId: '2',
        title: '',
        description: '',
        completed: false,
      ),
      const Task(
        id: '2',
        subfolderId: '2',
        title: '',
        description: '',
        completed: false,
      ),
      const Task(
        id: '5',
        subfolderId: '1',
        title: '',
        description: '',
        completed: false,
      ),
    ],
  ),
  Subfolder(
    id: '2',
    folderId: '1',
    title: 'Istologici',
    colors: [
      Colors.green.shade400,
      Colors.green.shade300,
    ],
    tasks: [],
  ),
  Subfolder(
    id: '3',
    folderId: '1',
    title: 'Consegne',
    colors: [
      Colors.yellow.shade400,
      Colors.yellow.shade300,
    ],
    tasks: [],
  ),
  Subfolder(
    id: '4',
    folderId: '1',
    title: 'Altro',
    colors: [
      Colors.teal.shade400,
      Colors.teal.shade300,
    ],
    tasks: [],
  ),
];
