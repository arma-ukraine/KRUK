import pathlib
import os

for dir in pathlib.Path("mod/addons").iterdir():
    if dir.is_dir():
        name = str(dir).split("\\")[-1]
        exit_code = os.system(
            f"makepbo -P -X *.cpp mod/addons/{name} mod/addons/{name}.pbo"
        )
        if exit_code != 0:
            raise RuntimeError(f'"{name}" addon had issues building')
