# How to get the code
0. **Read this [guide](https://chromium.googlesource.com/chromium/src/+/main/docs/get_the_code.md) but don't fetch the code just yet**
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
