import pathlib
from bs4 import BeautifulSoup

PROJECT_PATH = pathlib.Path(".").absolute()
CLIENT_PATH = pathlib.Path("D:\\SteamLibrary\\steamapps\\common\\Arma 3")
TOOLS_PATH = pathlib.Path("D:\\SteamLibrary\\steamapps\\common\\Arma 3 Tools")
SERVER_PATH = pathlib.Path("D:\\SteamLibrary\\steamapps\\common\\Arma 3 Server")
SERVER_PROFILE_PATH = pathlib.Path(PROJECT_PATH / "server_profile")
SERVER_SETTINGS_PATH = pathlib.Path(PROJECT_PATH / "server.cfg")
WORKSHOP_PATH = pathlib.Path("E:\\SteamLibrary\\steamapps\\workshop\\content\\107410")

with open("preset.html") as fh:
    # Parse preset.
    soup = BeautifulSoup(fh, "html.parser")
    mod_ids = []
    for anchor in soup.find_all("a"):
        mod_id = anchor.attrs["href"].split("=")[-1]
        mod_ids.append(mod_id)

    # Prepare list of mods.
    MODS = [f"{WORKSHOP_PATH}/{x}" for x in mod_ids]
    MODS.append(f"P:\\x\JAGER")
