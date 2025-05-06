// Copyright 2025 The Chromium Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef CHROME_BROWSER_MAC_APP_ICON_LOADER_MAC_H_
#define CHROME_BROWSER_MAC_APP_ICON_LOADER_MAC_H_

#include "base/files/file_path.h"

namespace chrome {
namespace mac {

// Checks if a custom icon.icns file exists in the user data directory,
// and if so, applies it as the application icon. Returns true if
// a custom icon was found and applied, false otherwise.
bool LoadCustomAppIconFromUserDataDir();

// Retrieves the path to user-data-dir/icon.icns if it exists.
// Returns an empty path if the icon file doesn't exist.
base::FilePath GetCustomIconPathFromUserDataDir();

}  // namespace mac
}  // namespace chrome

#endif  // CHROME_BROWSER_MAC_APP_ICON_LOADER_MAC_H_