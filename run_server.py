import os
import settings
import pathlib
import glob

import shutil

os.chdir(settings.SERVER_PATH)
os.system("taskkill /F /IM arma3server_x64.exe /T")
cmd = " ".join(
    [
        "arma3server_x64.exe",
        "-filePatching",
        "-autoInit",
        "-debug",
        f'-profiles="{settings.SERVER_PROFILE_PATH}"',
        f'-config="{settings.SERVER_SETTINGS_PATH}"',
        f"-mod=\"{';'.join(settings.MODS)}\"",
    ]
)

print(cmd)
os.system(f"start {cmd}")
