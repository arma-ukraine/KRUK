import pathlib

import os

import settings


dist_path = pathlib.Path(f"{settings.PROJECT_PATH}/.dist")
publisher_path = pathlib.Path(f"{settings.TOOLS_PATH}/Publisher/publisherCmd.exe")
mod_id = 2885420087

cmd = (
    f'"{publisher_path}" update /id:{mod_id} /changeNote:autopublish /path:{dist_path} '
)
os.system(cmd)
