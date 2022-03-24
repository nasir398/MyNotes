import 'package:flutter/cupertino.dart';

class CluodStorageException implements Exception {
  const CluodStorageException();
}

class CouldNotCreateNoteException extends CluodStorageException {}

class CouldNotGetAllNotesException extends CluodStorageException {}

class CouldNotUpdateNoteException extends CluodStorageException {}

class CouldNotDeleteNoteException extends CluodStorageException {}
