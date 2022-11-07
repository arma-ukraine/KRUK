import os
import settings

os.system("taskkill /F /IM arma3_x64.exe /T")

os.chdir(settings.CLIENT_PATH)
cmd = " ".join(
    [
        "arma3_x64.exe",
    ]
    + settings.CLIENT_STARTUP_PARAMETERS
    + [
        "-connect=127.0.0.1",
        "-password=1986-dev",
    ],
)

print(cmd)
os.system(f"start {cmd}")
