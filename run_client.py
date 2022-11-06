import os
import settings

os.chdir(settings.CLIENT_PATH)
cmd = " ".join(
    [
        "arma3_x64.exe",
        "-filePatching",
        "-autoInit",
        "-showScriptErrors",
        "-debug",
        f"-mod=\"{';'.join(settings.MODS)}\"",
        "-connect=127.0.0.1",
        "-password=1986",
    ]
)

print(cmd)
os.system(cmd)
