import pathlib
import shutil

import os

import settings

os.chdir(pathlib.Path("P:\\x\\JAGER"))

dist_path = pathlib.Path(f"{settings.PROJECT_PATH}/.dist")
shutil.rmtree(dist_path)
(dist_path / "addons").mkdir(parents=True, exist_ok=True)

for dir in pathlib.Path("addons").iterdir():
    if dir.is_dir():
        # Build pbos.
        name = str(dir).split("\\")[-1]
        exit_code = os.system(f"makepbo -P -X *.cpp addons/{name} addons/{name}.pbo")
        if exit_code != 0:
            raise RuntimeError(f'"{name}" addon had issues building')

        # Copy pbos to dist.
        dist_addon_path = pathlib.Path(
            f"{settings.PROJECT_PATH}/.dist/addons/{name}.pbo"
        )
        shutil.copy(
            pathlib.Path(f"addons/{name}.pbo"),
            pathlib.Path(dist_addon_path),
        )

        # Sign pbos.
        dssign_path = pathlib.Path(f"{settings.TOOLS_PATH}/DSSignFile/DSSignFile.exe")
        print(f'"{dssign_path}"')
        private_key_path = pathlib.Path(
            f"{settings.PROJECT_PATH}/.signature/JAGER.biprivatekey"
        )
        cmd = f'"{dssign_path}" {private_key_path} {dist_addon_path}'
        exit_code = os.system(cmd)
        if exit_code != 0:
            raise RuntimeError(f'"{name}" addon had issues signing')

# Copy other artifacts info to dist.
shutil.copytree(
    pathlib.Path(f"src"),
    pathlib.Path(dist_path / "src"),
)
