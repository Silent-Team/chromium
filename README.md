# How to get the code
0. **Read this [guide](https://chromium.googlesource.com/chromium/src/+/main/docs/get_the_code.md) but **don't fetch** the code just yet**
1. **Create a Directory**
   ```bash
   mkdir chromium && cd chromium
   ```

2. **Create the `.gclient` File**
   - Create a file named `.gclient` in the `chromium` directory and write the following configuration into it:
     ```python
     solutions = [
       {
         "name": "src",
         "url": "https://github.com/Silent-Team/chromium.git",
         "managed": False,
         "revision": "origin/development",
         "custom_deps": {},
         "custom_vars": {
            "checkout_clangd": True,
         },
       },
     ]
     ```

3. **Run `gclient` to Sync the Repository**
   - Run the following command to get the code from `origin/development` and install dependencies:
     ```bash
     gclient sync
     ```
   - It's not recomended as it may cause problems with git, and distrurb further workflow, but you can load only last commit instead of full history with:
     ```bash
     gclient sync --no-history
     ```

---
# How to contribute

- We should not commit any changes to the `main` branch, this branch serves solely for purposes of getting latest `chromium` changes and merging them later into our `development` branch
- In order to add new feature you can either create new branch `feature/feature-name` and merge it later into the `development` branch or just commit to the `development` branch
-  How to get the latest chromium changes and merge them into our `development` branch ?
	- find out and write here about it
	
## How to Create a Release Build of Chromium

This guide assumes you're working from the `src` directory of the Chromium repository.

###  Step 0: Enable PGO Profiles

Edit the `.gclient` file located in the root of your Chromium folder. Add `"checkout_pgo_profiles": True` to the `custom_vars` so that it looks like this:

```python
solutions = [
  {
    "name": "src",
    "url": "https://github.com/Silent-Team/chromium.git",
    "managed": False,
    "revision": "origin/development",
    "custom_deps": {},
    "custom_vars": {
      "checkout_clangd": True,
      "checkout_pgo_profiles": True,
    },
  },
]
```

---

### 🛠 Step 1: Generate the Build Files

Generate the build folder and files using GN:

```bash
gn gen out/Release
```

---

### ✍️ Step 2: Edit `args.gn`

Open the `args.gn` file for the release build configuration:

```bash
code out/Release/args.gn
```

Paste the following configuration:

```gn
is_debug = false
dcheck_always_on = false
is_component_build = false
symbol_level = 0
enable_nacl = false
blink_symbol_level = 0
v8_symbol_level = 0
is_official_build = true
```

📚 *For more information on GN build args: [Chromium GN Build Configuration Guide](https://www.chromium.org/developers/gn-build-configuration/)*

You can verify the current args with:

```bash
gn args out/Release
```

---

### 🧱 Step 3: Build Chromium

Use `autoninja` to start the build:

```bash
autoninja -C out/Release chrome
```

---

## 🪟 Windows Notes

If you're building on Windows, keep the following in mind:

- Make sure you are using **Developer Command Prompt for Visual Studio** (with the correct architecture: `x64 Native Tools Command Prompt`).
- All commands should be run from `src` inside that environment.
- Instead of `autoninja`, use:

```cmd
autoninja.bat -C out\Release chrome
```

- If you're using PowerShell, remember to escape backslashes or use forward slashes consistently.
- Ensure `python` and `git` are in your system `PATH`.
- You may need to run `vcvarsall.bat` or use the `vcvars64.bat` script if not using the Developer Prompt.

---
