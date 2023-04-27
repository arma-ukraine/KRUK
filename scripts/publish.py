import pathlib

import os

from . import settings


# Change directory.
# os.chdir(pathlib.Path("E:/P/w/JAGER"))

# Make sure mission start time is 00:00.
# ret = os.system(
#     'ubuntu run "cat /mnt/e/P/w/JAGER/mission/mission.sqm | grep hour=0"'
# ) + os.system('ubuntu run "cat /mnt/e/P/w/JAGER/mission/mission.sqm | grep minute=0"')
# if ret != 0:
#     raise RuntimeError("Set mission start time to 00:00!")

# Make sure there are no debug statements.
ret = os.system("ubuntu run \"grep --exclude-dir='.*' -r '^#define DEBUG_MODE_FULL'\"")
if ret != 1:
    raise RuntimeError("Comment out debug statements!")

# Publish.
dist_path = pathlib.Path(f"{settings.PROJECT_PATH}/.hemttout/release")
publisher_path = pathlib.Path(f"{settings.TOOLS_PATH}/Publisher/publisherCmd.exe")
mod_id = settings.JAGER_MOD_ID

os.system("hemtt.exe release")
cmd = (
    f'"{publisher_path}" update /id:{mod_id} /changeNote:autopublish /path:{dist_path} '
)
print(cmd)
os.system(cmd)
