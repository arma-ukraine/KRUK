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
        f'"{settings.PROJECT_PATH}\mission\mission.sqm"',
    ]
)

print(cmd)
os.system(f"start {cmd}")
