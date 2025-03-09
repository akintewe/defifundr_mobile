//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

<<<<<<< Updated upstream
import file_selector_macos
import flutter_secure_storage_macos
import local_auth_darwin
=======
import file_picker
>>>>>>> Stashed changes
import path_provider_foundation
import shared_preferences_foundation
import smart_auth
import sqflite_darwin

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
<<<<<<< Updated upstream
  FileSelectorPlugin.register(with: registry.registrar(forPlugin: "FileSelectorPlugin"))
  FlutterSecureStoragePlugin.register(with: registry.registrar(forPlugin: "FlutterSecureStoragePlugin"))
  FLALocalAuthPlugin.register(with: registry.registrar(forPlugin: "FLALocalAuthPlugin"))
=======
  FilePickerPlugin.register(with: registry.registrar(forPlugin: "FilePickerPlugin"))
>>>>>>> Stashed changes
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
  SharedPreferencesPlugin.register(with: registry.registrar(forPlugin: "SharedPreferencesPlugin"))
  SmartAuthPlugin.register(with: registry.registrar(forPlugin: "SmartAuthPlugin"))
  SqflitePlugin.register(with: registry.registrar(forPlugin: "SqflitePlugin"))
}
