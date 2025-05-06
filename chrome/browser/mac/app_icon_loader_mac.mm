// Copyright 2025 The Chromium Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "chrome/browser/mac/app_icon_loader_mac.h"

#import <Cocoa/Cocoa.h>

#include "base/apple/foundation_util.h"
#include "base/files/file_path.h"
#include "base/files/file_util.h"
#include "base/logging.h"
#include "base/mac/mac_util.h"
#include "base/path_service.h"
#include "chrome/common/chrome_constants.h"
#include "chrome/common/chrome_paths.h"

namespace chrome {
namespace mac {

base::FilePath GetCustomIconPathFromUserDataDir() {
  base::FilePath user_data_dir;
  if (!base::PathService::Get(chrome::DIR_USER_DATA, &user_data_dir)) {
    // Log the error but don't use NOTREACHED() since we want to continue
    LOG(ERROR) << "Failed to get user data directory";
    return base::FilePath();
  }

  base::FilePath icon_path = user_data_dir.Append("icon.icns");
  
  // Check if the file exists
  if (!base::PathExists(icon_path)) {
    return base::FilePath();
  }

  return icon_path;
}

}  // namespace mac
}  // namespace chrome