import pathlib
from bs4 import BeautifulSoup

PROJECT_PATH = pathlib.Path(".").absolute()
CLIENT_PATH = pathlib.Path("E:/SteamLibrary/steamapps/common/Arma 3")
TOOLS_PATH = pathlib.Path("E:/SteamLibrary/steamapps/common/Arma 3 Tools")
SERVER_PATH = pathlib.Path("E:/SteamLibrary/steamapps/common/Arma 3 Server")
SERVER_PROFILE_PATH = pathlib.Path(PROJECT_PATH / "server" / "server_profile")
SERVER_SETTINGS_PATH = pathlib.Path(PROJECT_PATH / "server" / "server.cfg")
WORKSHOP_PATH = pathlib.Path("E:/SteamLibrary/steamapps/workshop/content/107410")
JAGER_MOD_ID = "2885420087"


with open("preset.html") as fh:
    # Parse preset.
    soup = BeautifulSoup(fh, "html.parser")
    mod_ids = []
    for anchor in soup.find_all("a"):
        mod_id = anchor.attrs["href"].split("=")[-1]
        mod_ids.append(mod_id)

    # Prepare list of mods.
    MODS = [f"{WORKSHOP_PATH}/{x}" for x in mod_ids]

    # Add local mod.
    MODS.append(f"P:\\x\JAGER")

CLIENT_STARTUP_PARAMETERS = [
    "-noSplash",
    "-skipIntro",
    "-world=empty",
    "-filePatching",
    "-autoInit",
    "-showScriptErrors",
    "-debug",
    "-noPause",
    "-noPauseAudio",
    f"-mod=\"{';'.join(MODS)}\"",
]
